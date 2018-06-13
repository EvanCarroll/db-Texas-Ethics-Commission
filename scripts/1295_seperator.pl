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
use PDSERF::Client ();

##
## This seperates the 1295Certificates into _BOX123 and _PARTY
##
{
	my $fh_comb   = IO::File->new(
		File::Spec->catfile( PDSERF::Client::INROOT, '1295Certificates.csv' )
		, 'r'
	);
	my $fh_box123 = IO::File->new(
		File::Spec->catfile( PDSERF::Client::INROOT, '1295Certificates_BOX123.csv' )
		, 'w'
	);
	my $fh_party  = IO::File->new(
		File::Spec->catfile( PDSERF::Client::INROOT, '1295Certificates_PARTY.csv' )
		, 'w'
	);

	while ( my $line = <$fh_comb> ) {
		chomp $line;

		if ( $line =~ /^BOX123/ ) {
			$fh_box123->write($line."\n");
		}
		elsif ( $line =~ /^PARTY/ ) {
			$fh_party->write($line."\n");
		}

	}

}

__END__

=head1 NAME

1295_seperator.pl

=head1 DESCRIPTION

This script expects one combined file to be in F<./data/1295Certificates.csv>
and splits it into 

=over 4

=item F<./data/1295Certificates_BOX123.csv>

If the first characters are BOX123

=item F<./data/1295Certificates_PARTY.csv>

If the first characters are PARTY

=back

