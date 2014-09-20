#!usr/bin/perl
use strict;
use warnings;
use Tunes::class;

$tunes = Tunes::class->new();
print "Please enter a tune!";
$input = <STDIN>;
@inputsplit = split(/ /, $input);
if ($inputsplit[0] = "beep") {
	if ($inputspli[1] = "-s") {
		my @beepsettings = $inputsplit[1..3];
		$tunes->beep_set(@beepsettings);
	}
	else {
		my @beeps = $inputsplit[1,2];
		$tunes->beep_set(@beeps);
		}	
	}
	elsif ($inputsplit[0] = "bop") {
		if ($inputsplit[1] = "-s") {
			my @bopsettings = $inputsplit[1..3];
			$tunes->bop_set(@bopsettings);
		}
		else {
			my @bops = $inputsplit[1,2];
			$tunes->bop_set(@bops);
			}
	}
	elsif ($inputsplit[0] = "blap") {
		if ($inputsplit[1] = "-s") {
			my @blapsettings - $inputsplit[1..3];
			$tunes->blap_set(@blapsettings);
		}
		else {
			my @blaps = $inputsplit[1,2];
			$tunes->blap_set(@blap);
	}
	elsif ($inputsplit[0] = "symphony") {
		if ($inputsplit[1] = "-t") {
			my $dir = dir($inputsplit[2]);
			my $file = $dir->file($inputsplit[3]);
			my $file_handle = $file->openr();
			open $file_handle, '<';
			chomp (my @lines = <$file_handle>);
			close $file_handle;
			$tunes->beep_symphony(@lines);
		}
			elsif ($inputsplit[1] = "-i") {
				my @inlinebeeps = $inputsplit[2..];
				$tunes->beep_symphony(@inlinebeeps);
			}
	}
	elsif ($inputsplit[0] = ("Help", "help", "HELP")) {
		if ($inputspli[1] = "beep") {
			print "Usage: beep [frequency] [duration]\n";
		}
			elsif ($inputsplit[1] = "symphony") {
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
	elsif ($inputsplit[0] = ("save", "Save", "SAVE")) {
		my @savedata = ($inputsplit[1], $inputsplit[2]);
		$tunes->save_settings(@savedata);
	}
	elsif ($inputsplit[0] = ("import", "Import", "IMPORT")) {
		@importdata = ($inputsplit[0], $inputsplit[1]);
		$tunes->import_settings(@importdata);
	}
	else {
		print "Not a valid command. Type Help for more information.";
		}