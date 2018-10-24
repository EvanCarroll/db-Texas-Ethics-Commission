# Schema generation for the Texas Ethics Commission
# Copyright (C) 2018  Evan Carroll
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

package PDSERF::Table;

use strict;
use feature ':5.26';
use autodie;

use PDSERF::Column;
use PDSERF::Client ();

use Moose;
use Moose::Util::TypeConstraints;

use constant PSQL_COPY_LOAD_FORMAT => "\\COPY %s FROM '%s' WITH ( FORMAT CSV , HEADER true );\n";

subtype 'ArrayOfColumns', as 'ArrayRef[PDSERF::Column]';

coerce 'PDSERF::Column'
	=> from 'HashRef'
	=> via { PDSERF::Column->new($_) };

coerce 'ArrayOfColumns',
	from 'HashRef',
	via { [map PDSERF::Column->new($_), @$_] };

has 'columns' => (
	isa     => 'ArrayOfColumns',
	traits  => ['Array'],
	is      => 'ro',
	default => sub { [] },
	coerce  => 1,
	handles => {
		push_column => 'push'
	}
);

has 'post_statements' => (
	isa     => 'ArrayRef',
	traits  => ['Array'],
	is      => 'ro',
	default => sub {
		my $self = shift;
		
		my @fkey_constraints = grep defined
			, (map $_->fkey_constraint , @{$self->columns});
		my @post;
	
		if (
			$self->name ne 'c_FilerData'
			and $self->name =~ /^c_/
			and $self->col_by_pattern(qr/[fF]ilerTypeCd$/)
		) {
			
			my @cols = @{ $self->col_by_pattern(qr/[fF]ilerTypeCd$/) };
			foreach my $col ( @cols ) {
				my $typecd = $col->name;
				$typecd =~ /(.*?)FilerTypeCd/;
				my $prefix = $1//'';

				if ( my $col = $self->col_by_pattern(qr/^$prefix[fF]ilerIdent$/) ) {
					my $identname = $col->[0]->name;
					push @fkey_constraints, sprintf(
						'ADD FOREIGN KEY (%s) REFERENCES %s NOT VALID',
						sprintf( '%s, %s', $identname, $typecd ),
						sprintf('%s.%s', PDSERF::Client::INSTALL_SCHEMA, 'c_FilerData' )
					);
					push @post, sprintf(
						"CREATE INDEX ON %s (%s, %s);",
						$self->fully_qualified_identifier,
						$identname,
						$typecd
					)
				}	
				else {
					die sprintf(
						"ERROR: We should never have a %s, without a typeident in %s\n",
						$typecd,
						$self->name
					);
				}
			}

		}

		if ( @fkey_constraints ) {
			push @post, sprintf(
				"ALTER TABLE %s\n\t%s;",
				$self->fully_qualified_identifier,
				join ",\n\t", @fkey_constraints
			);
		}

		if (
			$self->col_by_name('reportInfoIdent')
			## don't need an idx on pkey
			and ($self->_primary_key//'') !~ /reportInfoIdent/i
		) {
			push @post, sprintf(
				"CREATE INDEX ON %s (reportinfoident);",
				$self->fully_qualified_identifier
			)
		}

		return \@post;

	},
	handles => {
		push_post_load => 'push'
	},
	lazy => 1
);

has [qw/description name/] => ( isa => 'Str', is => 'ro', required => 1 );
has order => ( isa => 'Int', is => 'ro', required => 1 );

sub pg_ddl {
	my $self = shift;

	my @body = grep defined, (
		(map $_->pg_ddl, @{$self->columns}),
		$self->_primary_key
	);
	s/\s+$// for @body;
	
	my $ddl = sprintf (
		"\n\nCREATE TABLE %s (\n%s\n);\n",
		$self->fully_qualified_identifier,
		join(",\n", @body)
	);
	
	$ddl .= $self->pg_comment;
	$ddl .= $_->pg_comment for @{$self->columns};

	$ddl;
}

sub _primary_key {
	my $self = shift;
	my $a = undef;
	my @cols;

	## Handles linking and composite key for Filer
	if ( $self->name =~ /FilerData$/ ) {
		## $self->col_by_name('filerTypeCd') and $self->col_by_name('filerIdent')
		$a = "\tPRIMARY KEY (filerIdent, filerTypeCd)";
	}

	elsif ( $self->name =~ /ExpendCategory$/ ) {
		$a = "\tPRIMARY KEY (expendCategoryCodeValue)";
	}

	elsif ( $self->name =~ /CandidateData$/ ) {
		$a = "\tPRIMARY KEY (expendPersentId)";
	}

	## Also has lobbyActivityId
	elsif( $self->name =~ /TransportationData$/ ) {
		$a = "\tPRIMARY KEY (lobactivityTravelId)";
	}

	## 'IndividualReportingData'
	elsif ( @cols = grep $_->name =~ /lobby.*id/i, @{$self->columns} ) {
		$a = "\tPRIMARY KEY (" . $cols[0]->name . ")";
	}

	# $self->name eq 'CoverSheet2Data' or $self->name eq 'CoverSheet3Data'
	elsif ( @cols = grep $_->name =~ /committee.*id/i, @{$self->columns} ) {
		$a = "\tPRIMARY KEY (" . $cols[0]->name . ")";
	}
	
	elsif (
		## We made this more liberal for CoverSheet2Data
		## $self->columns->[9]->name =~ /(.*)InfoId$/
		## && $self->name eq (ucfirst($1)."Data")
		$self->columns->[9]
		and $self->columns->[9]->name =~ /Id$/
	) {
		$a = "\tPRIMARY KEY ( " . $self->columns->[9]->name . " )";
	}

	elsif (
		$self->col_by_name('reportInfoIdent')
		and ( $self->name =~ /^l_/ || $self->name eq 'c_CoverSheet1Data' )
	) {
		$a = "\tPRIMARY KEY (reportInfoIdent)";
	}

	return $a;
}

sub fully_qualified_identifier {
	my $self = shift;
	sprintf( "%s.%s", PDSERF::Client::INSTALL_SCHEMA, $self->name);
}

sub pg_comment {
	my $self = shift;
	sprintf(
		"COMMENT ON TABLE %s IS \$\$%s\$\$;\n",
		$self->fully_qualified_identifier,
		$self->description
	);
}

sub psql_copy {
	my ( $self, $dir ) = @_;

	my @loads;
	my $desc = $self->description;
	while ( $desc =~ m/(\S+.csv)/g ) {
		my $file = $1;

		## XXX typo!
		$file = 'finals.csv' if $file eq 'final.csv';
		
		## Migrates the _## pattern to the perl glob _*
		if ( (my $pattern = $file) =~ s/_#+/_*/ ) {
			foreach my $file ( sort glob( File::Spec->catfile($dir, $pattern) ) ) {
				push @loads, sprintf(
					PSQL_COPY_LOAD_FORMAT,
					$self->fully_qualified_identifier,
					$file
				);
			}
		}
		else {
			push @loads, sprintf(
				PSQL_COPY_LOAD_FORMAT,
				$self->fully_qualified_identifier,
				File::Spec->catfile($dir, $file)
			);
		}
	}

	return join "\n", @loads;

}

sub col_by_name {
	my ( $self, $colname ) = @_;
	return grep $_->name eq $colname, @{$self->columns}
}

sub col_by_pattern {
	my ( $self, $colname ) = @_;
	return [grep $_->name =~ $colname, @{$self->columns}]
}

1;
