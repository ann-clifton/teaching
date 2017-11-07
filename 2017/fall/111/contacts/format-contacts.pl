#!/usr/bin/env perl
use strict;
use warnings;

my $fn = "contacts-111-F17.csv";

open(my $fh, '<:encoding(UTF-8)', $fn) or die "Could not open file '$fn' $!";
while (my $line = <$fh>){
    chomp $line;
    if ($line =~ m/\s*(.*)\s*,\s*(.*)\s*,\s*(.*)\s*/){
	my $temp = $2;
	my $last = $1;
	my $email = $3;
	my $first;
	my $middle;
	if ($temp =~ m/(.*)\s+(.*)$/){
	    $first = $1;
	    $middle = $2;
	}
	else{
	    $first = $temp;
	    $middle = "";
	}

	#trim the white spaces.
	$last =~ s/^\s+|\s+$//;
	$middle =~ s/^\s+|\s+$//;
	$first =~ s/^\s+|\s+$//;
	$email =~ s/^\s+|\s+$//;
	
	print "$first,$middle,$last,$email\n"
    }
}
close($fh);
