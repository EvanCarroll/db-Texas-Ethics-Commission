#!/usr/bin/env perl
# Pad CSV rows with missing trailing columns to match header column count
# Usage: pad_csv_columns.pl file.csv [file2.csv ...]

use strict;
use warnings;
use Text::CSV;

foreach my $file (@ARGV) {
    my $csv = Text::CSV->new({ binary => 1, auto_diag => 1 });

    open my $in, "<", $file or die "Cannot open $file: $!";
    my $header = $csv->getline($in);
    my $cols = scalar @$header;

    my @rows = ($header);
    my $padded = 0;

    while (my $row = $csv->getline($in)) {
        if (scalar @$row < $cols) {
            push @$row, ("") x ($cols - scalar @$row);
            $padded++;
        }
        push @rows, $row;
    }
    close $in;

    open my $out, ">", $file or die "Cannot write $file: $!";
    $csv->say($out, $_) for @rows;
    close $out;

    warn "$file: padded $padded rows to $cols columns\n" if $padded;
}
