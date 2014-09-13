#!usr/bin/perl
use strict;
use warnings;
use Tunes::class;

$tunes = Tunes::class->new();
print "Please enter a tune!";
$input = <STDIN>;
@inputsplit = split(/ /, $input);
if $inputsplit[0] = "beep" {
	@beeps = split(/ /, $inputsplit[1,2]);
	$tunes->beep(@beeps);
	elsif $inputsplit[0] = "symphony" {
		if $inputsplit[1] = "-t" {
			my $dir = dir($inputsplit[2]);
			my $file = $dir->file($inputsplit[3]);
			my $file_handle = $file->openr();
			open $file_handle, '<';
			chomp (my @lines = <$file_handle>);
			close $file_handle;
			$tunes->beep_symphony(@lines);
		}
			elsif $inputsplit[1] = "-i" {
				my @inlinebeeps = $inputsplit[2..];
				$tunes->beep_symphony(@inlinebeeps);
			}
	}
	elsif $inputsplit[0] = ("Help", "help", "HELP") {
		if $inputspli[1] = "beep" {
			print "Usage: beep [frequency] [duration]\n";
		}
			elsif $inputsplit[1] = "symphony" {
				print "Usage: symphony [-t] [-i] arguments\n";
				print "-t Usage: Arguments should be a file path and the name of a file.\n";
				print "Seperate the file name from the filepath by a space.\n";
				print "-i Usage: Arguments should be any combination of beep, bop and blap\n";
				print "seperated by spaces.\n";
			}
			else { print "Invalid command. Possiblye commands are 'Help beep' and\n";
				   print "Help symphony.\n";
				 }
		print "Valid commands are:\n";
		print "beep\n";
		print "symphony\n";
	}
	else print "Not a valid command. Type Help for more information.";
}
$tunes->beep(@inputsplit); 