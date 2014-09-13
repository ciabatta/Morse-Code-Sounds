#!usr/bin/perl
use strict;
use warnings;
use Tunes::class;

$tunes = Tunes::class->new();
print "Please enter a tune!";
$input = <STDIN>;
@inputsplit = split(/ /, $input);
$tunes->beep(@inputsplit); 