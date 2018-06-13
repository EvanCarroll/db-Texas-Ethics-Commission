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

use File::Path ();
use File::Spec ();
use IO::File   ();

use lib 'lib';
use PDSERF::Parser ();
use PDSERF::Client ();

my @files = (
	{ DIR => 'TEC_CF_CSV', FILE => 'ReadMe.txt' },
	{ DIR => 'TEC_LA_CSV', FILE => 'LobbyLAR-ReadMe.txt' }
);

foreach my $file ( @files ) {

	my $fh = IO::File->new(
		File::Spec->catfile(PDSERF::Client::INROOT, $file->{DIR}, $file->{FILE}),
		'r'
	);

	foreach my $t ( @{PDSERF::Parser::parse($fh)} ) {
		say "Generating " . $t->name;
		my $indir  = File::Spec->catdir( PDSERF::Client::INROOT, $file->{DIR} );
		my $outdir = File::Spec->catdir( PDSERF::Client::OUTROOT, 'gen', $file->{DIR} );
		File::Path::make_path( $outdir, error => $_ );
		my $fh = IO::File->new(
			File::Spec->catfile(
				$outdir,
				sprintf("%02s_%s.sql", $t->order, $t->name)
			),
			'w'
		);
		$fh->write( PDSERF::Client::LICENSE );
		$fh->write( sprintf( "\\echo LOADING %s\n", $t->name ) );
		$fh->write( $t->pg_ddl );
		$fh->write( $t->psql_copy($indir) );
		$fh->close;
	} 

}

__END__

=head1 NAME

generate_from_readme.pl

=head1 DESCRIPTION

Schema generater and parser

A loader that takes the readme files produced by the TEC and dumps out
representative SQL DDL
