use strict;
use warnings;
use feature ':5.26';
use autodie;

use IO::File;

my $fh_comb   = IO::File->new( './data/1295Certificates.csv', 'r' );
my $fh_box123 = IO::File->new( './data/1295Certificates_BOX123.csv', 'w' );
my $fh_party  = IO::File->new( './data/1295Certificates_PARTY.csv', 'w' );

while ( my $line = <$fh_comb> ) {
	chomp $line;

	if ( $line =~ /^BOX123/ ) {
		$fh_box123->write($line."\n");
	}
	elsif ( $line =~ /^PARTY/ ) {
		$fh_party->write($line."\n");
	}

}

__END__

=head1 NAME

1295_seperate.pl

=head1 DESCRIPTION

This script expects one combined file to be in F<./data/1295Certificates.csv>
and splits it into 

=over 4

=item F<./data/1295Certificates_BOX123.csv>

If the first characters are BOX123

=item F<./data/1295Certificates_PARTY.csv>

If the first characters are PARTY

=back
