#!/usr/bin/perl
use strict;
use warnings;


my $filename = $ARGV[0];
#my $output = $ARGV[1];
open my $fh, '<', $filename or die $!;
#open my $outfh,'>',$output or die $!;
while (my $line=<$fh>) {
	chomp $line;
	my $spices_name;
	if ($line =~ /^(\d+\. *Diospyros \w+)/g) {
		print "$1\n";
		$spices_name = $1;
	}
	#print "lalala spices_name = $spices_name\n";
#	if ($line =~ /$spices_name (var. lotus)/){
#		print "$1\n";
#		print "spices_name is $spices_name\nyayaya\n";
#	}
	if ($line =~ /([Tt]rees.+?[cm](\s*tall)?)/g) {
		print "$1\n";
	}
	if ($line =~ /([Tt]runk to.+d\.b\.h)/g) {
		print "$1\n";
	}
	if ($line =~ /([Pp]etiole .+? [cm]m)/g) {
		print "$1\n";
	}
	if ($line =~ /([Bb]erry.+?[cm]m(\s*in\s+diam)?)/g) {
		print "$1\n";
	}
	if ($line =~ /([Ss]eeds.+?[cm]m)/g) {
		print "$1\n";
	}
	if ($line =~ /([Ff]l\.\s*[^,.]+)/g) {
		print "$1\n";
	}
	if ($line =~ /([Ff]r\.\s*[^,.]+)/g) {
		print "$1\n";
	}
	print "######\n";

}
close $fh;
#close $outfh;
print "done!\n";
