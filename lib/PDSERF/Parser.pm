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

package PDSERF::Parser;

use feature ':5.26';
use strict;
use warnings;

use PDSERF::Table;
use DataExtract::FixedWidth;

sub parse {
	my $fh = shift;
	local $/ = "\r\n";

	my @sections;
	while ( my $line = $fh->getline ) {
		chomp $line;

		my %section;
		if ( $line =~ /^Record #: (?<order>\d+) \s+ Record Name: (?<name>\w+)/ ) {
			$section{order}  = $+{order};
			$section{name}   = $+{name};

			while ( my $line = $fh->getline ) {
				chomp $line;

				## Section terinator
				if ( $line =~ /^-+$/ ) {
					last;
				}

				elsif ( $line =~ /^Description: (.*)/ ) {
					(my $desc = $1 ) =~ s/^\s+|\s+$//g;
					while ( my $line = $fh->getline ) {
						chomp $line;
						if ( $line =~ /^ {13,}(.*)/ ) {
							(my $temp = $1) =~ s/^\s+|\s+$//g;
							$desc .= " $temp";
						}
						else {
							$section{description} = $desc;
							last;
						}
					}
					next;
				}

				## Field Description extension
				elsif ( $line =~ / {98,}(.*+)$/ ) {
					$section{lines}[-1] .= $1;
					next;
				}

				## Data Lines (lines before Array are empty
				## We need to keep newlines to playback the arrays
				#elsif ( $line =~ /\S/ ) {
				else {
					push @{$section{lines}}, $line;
					next;
				}

			}

			push @sections, \%section;

		}

	}

	return [map _build_table($_), @sections];

}

sub _build_table {
	my $text = shift;

	my $t = PDSERF::Table->new({
		name        => $text->{name},
		description => $text->{description},
		order       => $text->{order},
		columns     => []
	});

	my $de = DataExtract::FixedWidth->new({
		header_row  => $text->{lines}[0],
		heuristic   => [@{$text->{lines}}[0..1]],
		fix_overlay => 1
	});

	foreach my $line (@{$text->{lines}}) {
		state $array_cnt = 0;
		# string right after the header line
		# used to make sure right unpack is generated
		next if $line =~ /^[- ]+$/;

		if ( my $row = $de->parse_hash($line) ) {
			## AN ARRAY
			if ( $array_cnt ) {
				state @rows;
				## Inside an array element
				if ( $line =~ /^\s*\d+ {4}/ ) {
					push @rows, $row;
					next;
				}
				else {
					for ( my $i = 1; $i <= $array_cnt; $i++ ) {
						foreach my $row (@rows) {
							# say $t->name, $i, $row->{'Field Name'};
							#		use Data::Dumper; warn Dumper [$i, $row->{'Field Name'}];
							$t->push_column({
								table       => $t,
								name        => $row->{'Field Name'} . $i,
								description => "$i: " . $row->{'Description'},
								type        => $row->{'Type'},
								length      => $row->{'Len'},
								mask        => $row->{'Mask'},
								order       => $row->{'#'}
							});
							# use Data::Dumper; die Dumper $t;
						}
					}
					@rows = ();
					$array_cnt = 0;
				}
			}

			## If the row is simple it has a column number
			if ( $row->{'#'} ) {
				$t->push_column({
					table       => $t,
					name        => $row->{'Field Name'},
					description => $row->{'Description'},
					type        => $row->{'Type'},
					length      => $row->{'Len'},
					mask        => $row->{'Mask'},
					order       => $row->{'#'}
				});
			}
			else {
				## Array-group header
				if ( $line =~ /^\s+Array/ ) {
					## includes max-width and the word array, we don't use max-widths on groups 
				}
				## Empty-lines: Array-Group pre-header and footer
				elsif ( $line eq '' ) {
					## We preserve empty lines on the section so we can reply the arrays,
					## here we skip them
				}
				## We have an array!
				elsif ( $row->{'Field Name'} ) {
					$row->{'Field Name'} =~ m/^(\w+) \[ (\d+) (?:\/ROW_MAJOR)? \]$/x;
					$array_cnt = int($2);
				}
				else {
					die "SHOULD NEVER REACH THIS <$line>\n";
				}
			}
			
		}
	}
	
	$t;
};

1;
