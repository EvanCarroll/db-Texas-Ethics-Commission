#!/usr/bin/env perl

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

use strict;
use feature ':5.26';
use autodie;

## These really shouldn't be here, but provided to constructors
## Globals are funn!!
use constant {
	INROOT  => './data',
	OUTROOT => './out',
	INSTALL_SCHEMA => 'tec'
};


use File::Spec;
use IO::File;

use PDSERF::Parser;

mkdir (OUTROOT) unless -x OUTROOT;

my @files = (
	{ DIR => 'TEC_CF_CSV', FILE => 'ReadMe.txt' },
	{ DIR => 'TEC_LA_CSV', FILE => 'LobbyLAR-ReadMe.txt' }
);

my $license = <<'EOF';
-- Schema generation for the Texas Ethics Commission
-- Copyright (C) 2018  Evan Carroll
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

EOF

foreach my $file ( @files ) {

	my $fh = IO::File->new(
		File::Spec->catfile(INROOT, $file->{DIR}, $file->{FILE}),
		'r'
	);

	foreach my $t ( @{PDSERF::Parser::parse($fh)} ) {
		say "Generating " . $t->name;
		my $indir = File::Spec->catdir( INROOT, $file->{DIR} );
		my $fh = IO::File->new(
			File::Spec->catfile(
				'out',
				sprintf("%02s_%s.sql", $t->order, $t->name)
			),
			'w'
		);
		$fh->write( $license );
		$fh->write( sprintf( "\\echo LOADING %s\n", $t->name ) );
		$fh->write( $t->pg_ddl );
		$fh->write( $t->psql_copy($indir) );
		$fh->close;
	} 

}

__DATA__
__END__

=head1 NAME

generate_from_readme.pl

=head1 DESCRIPTION

Schema generater and parser

A loader that takes a readme file in dumps out representative SQL

=cut
