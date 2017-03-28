#!/usr/bin/perl
use strict;
use warnings;

my $filename = $ARGV[0];
my $output = $ARGV[1];
open my $fh, '<', $filename or die $!;
open my $outfh,'>',$output or die $!;
while (my $line=<$fh>) {
	# body...
	chomp $line;
	$line =~ s/^\t([^\t\n])/- $1/g;
	$line =~ s/^(\t+)\t([^\t\n])/$1- $2/g;
	print $outfh "$line\n";
}
close $fh;
close $outfh;
print "done!\n";