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

package PDSERF::Column;

use strict;
use feature ':5.36';
use autodie;

use PDSERF::Client ();

use Moose;
use PDSERF::Table;

has 'table'  => ( isa => 'PDSERF::Table', is => 'ro', required => 1 );
has [qw/name type description/] => ( isa => 'Str', is => 'ro', required => 1 );
has 'length' => ( isa => 'Int', is => 'ro', required => 1 );
has 'mask'   => ( isa => 'Str', is => 'ro', required => 1 );
has 'order'  => ( isa => 'Int', is => 'ro' );

sub pg_ddl ($self) {
	sprintf(
		"\t%-40s%-20s",
		$self->name,
		$self->pg_type,
	);
}

sub pg_type ($self) {
	
	state $types = {
		BigDecimal => 'numeric(12,2)',
		String     => 'text',
		Long       => 'bigint'
	};

	my $coltype;
	if ( $self->name =~ /Ident$/ ) {
		$coltype = 'int';
	}
	elsif ( $self->name =~ /Flag$/ and $self->type ) {
		## XXX: No idea wtf
		## SELECT * FROM candidatedata WHERE capitallivingexpflag = ',';
		if ( $self->name eq 'capitalLivingexpFlag' ) {
			$coltype = 'char(1)';
		}
		else { $coltype = 'bool'; }
	}
	elsif ( $self->name =~ /year$/i ) {
		$coltype = 'smallint';
	}
	elsif ( $self->name =~ /dt$/i ) {
		$coltype = 'date';
	}
	elsif ( $self->name =~ /ExpendCd$/ ) {
		$coltype = 'bool';
	}
	elsif ( $self->name =~ /CountryCd$/ ) {
		$coltype = 'char(3)';
	}
	elsif ( defined $types->{$self->type} ) {
		$coltype = $types->{$self->type};
	}
	else {
		$coltype = lc($self->type);
	}
	$coltype;
}


sub pg_comment ($self) {
	sprintf(
		"COMMENT ON COLUMN %s IS \$\$%s\$\$;\n",
		$self->fully_qualified_identifier,
		$self->description
	);
}

sub fully_qualified_identifier ($self) {
	my $fqn =  sprintf(
		"%s.%s.%s",
		PDSERF::Client::INSTALL_SCHEMA,
		$self->table->name,
		$self->name
	);
	lc($fqn);
}

sub fkey_constraint ($self) {

	# This points to the schema.table, which targets the pkey implicitly
	my $fmt = sprintf(
		'ADD FOREIGN KEY (%s) REFERENCES %s.%%s NOT VALID',
		$self->name,
		PDSERF::Client::INSTALL_SCHEMA
	);

	# ExpendCd is only 'Y' or 'N'
	if ( $self->name =~ /expendCatCd$/ ) {
		return sprintf( $fmt, 'c_expendcategory' );
	}
	elsif ( $self->name =~ /reportInfoIdent$/ ) {
		if ( $self->table->name =~ /^l_/ and $self->table->name ne 'l_CoverSheetLaData' ) {
			return sprintf( $fmt, 'l_CoverSheetLaData' );
		}
		elsif ( $self->table->name =~ /^c_/ and $self->table->name ne 'c_CoverSheet1Data' ) {
			return sprintf( $fmt, 'c_CoverSheet1Data' );
		}

	}
	
	elsif ( $self->name =~ /CountyCd\d*$/ ) {
		return sprintf( $fmt, 'codes_counties' );
	}
	elsif ( $self->name =~ /CountryCd\d*$/ ) {
		return sprintf( $fmt, 'codes_countries' );
	}
	elsif ( $self->name =~ /reportTypeCd\d*$/ ) {
		return sprintf( $fmt, 'codes_reports' );
	}
	elsif ( $self->name =~ /NamePrefixCd$/ ) {
		return sprintf( $fmt, 'codes_name_prefixes' );
	}
	elsif ( $self->name =~ /NameSuffixCd$/ ) {
		return sprintf( $fmt, 'codes_name_suffixes' );
	}
	elsif (
		$self->name =~ /filerTypeCd$/
		# $self->table->name eq 'c_FilerData' || $self->table->name =~ /^l_/
	) {
		return sprintf( $fmt, 'codes_filertype' );
	}
	# elsif ( $self->name =~ /schedFormTypeCd$/ ) {
	# 	return sprintf( $fmt, 'codes_schedule' );
	# }
	elsif ( $self->name =~ /formTypeCd$/ ) {
		return sprintf( $fmt, 'codes_forms' );
	}
	elsif ( $self->name =~ /totalTypeCd$/ ) {
		return sprintf( $fmt, 'codes_totals' );
	}
	elsif ( $self->name =~ /OfficeCd$/ ) {
		return sprintf( $fmt, 'codes_offices' );
	}
	elsif ( $self->name =~ /Cd$/ ) {
		warn sprintf("Unhandled foreign key detected for table %s: %s", $self->table->name, $self->name );
	}
	return undef;
}

1;
