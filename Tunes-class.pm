package Tunes::class

#!usr/bin/perl
use strict;
use warnings;
use File::Slurp;
use Win32::API;
use Win32::API::Prototype;

sub new {
	my $class = shift;
	my $self = {
		_savefile => shift;
		_function => shift;
		_frequency => shift;
		_duration => shift;
		_beepfrequency => shift;
		_beepduration => shift;
		_bopfrequency => shift;
		_bopduration => shift;
		_blapfrequency => shift;
		_blapduration => shift;
		_symphony => shift;
	}
	bless $self, $class;
	return $self;
}

sub save_settings {
	my ($self, $savefile) = @_;
	$self => {_savefile} = $savefile if defined $savefile;
	my %savedata = {
		"beepf" => $self=>{_beepfrequency},
		"beepd" => $self=>{_beepduration},
		"bopf" => $self=>{_bopfrequency},
		"bopd" => $self=>{_bopduration},
		"blapf" => $self=>{_bladfrequency},
		"blapd" => $self=>{_blapduration},
	}
	my $directory = file($savefile[0]);
	my $file = $directory->file($savefile[1]);
	my $filehandle = $file->openw();
	my @printlist = %savedata;
	foreach my $lines (@printlist) {
		$filehandle->print($lines."\n");
	} 
}	
sub import_settings {
	my ($self, $importfile) = @_;
	$self => {_importfile} = $importfile if defined $importfile;
	my $directory = dir($importfile[0]);
	my $file = $directory->file($importfile[1]);
	my $filehandle = $file->openr();
	while( my $lines=$filehandle->get_line()) {
		my @importdata = chomp($lines);
	}
	my %importhash = @importdata;
	my $self=>{_beepfrequency} = $importhash->{beepf};
	my $self=>{_beepduration} = $importhash->{beepd};
	my $self=>{_bopfrequency} = $importhash->{bopf};
	my $self=>{_bopduration} = $importhash->{bopd};
	my $self=>{_blapfrequency} = $importhash->{blapf};
	my $self=>{_blapduration} = $importhash->{blapd};
	
}

sub beep_set {
	my ($self, $beepsettings) = @_;
	if ($beepsettings[0] = "-s") {
		my $beepfrequency = $beepsettings[1];
		my $beepduration = $beepsettings[2];
		$self => {_beepfrequency} = $beepfrequency if defined $beepfrequency;
		$self => {_beepduration} = $beepduration if defined $beepduration;
		return "Beep frequency is $beepfrequency and duration is $beepduration.\n"
		}
		elsif (defined ($self=>{_beepfrequency} and $self=>{_beepduration})) {
			ApiLink('kernekl32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
			my @beepfuncset = ($self => {_beepfrequency}, $self => {_beepduration})
			$lpsystem = $beepfuncset[0,1];
			Beep($lpsystem);
		}
		else {
			ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $lpsystme]) || die;
			$lpsystem = ($beepsettings[0,1]);
			Beep($lpsystem);
		}		
}
sub bop_set {
	my ($self, $bopsettings) = @_;
	if ($bopsettings[0] = "-s") {
		my $bopfrequency = $bopsettings[1];
		my $bopduration = $bopsettings[2];
		$self => {_bopfrequency} = $bopfrequency if defined $bopfrequency;
		$self => {_bopduration} = $bopduration if defined $bopduration;
		return "Bop frequency is $bopfrequency and duration is $bopduration.\n";
		}
		elsif (defined ($self=>{_bopfrequency} and $self=>{_bopduration})) {
			ApiLink('kernekl32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
			my @beepfuncset = ($self => {_bopfrequency}, $self => {_bopduration})
			$lpsystem = $bopfuncset[0,1];
			Beep($lpsystem);
			}
			else {
				ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
				$lpsystem = $bopsettings[0,1];
				Beep($lpsystem);
			}
}
sub blap_set {
	my ($self, $blapsettings) = @_;
	if ($blapsettings[0] = "-s") {
		my $blapfrequency = $blapsettings[1];
		my $blapduration = $blapsettings[2];
		$self => {_blapduartion} = $blapduration if defined $blapduration;
		$self => {_blapfrequency} = $blapfrequency if defined $blapfrequency;
		return "Blap frequency is $blapfrequency and duration is $blapduration";
		}
		elsif (defined ($self=>{_blapfrequency} and $self=>{_blapduration})) {
			ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
			my @blapfuncset = ($self=>{_blapfrequency}, $self=>{_blapduration});
			$lpsystem = $blapfuncset[0,1];
			Beep($lpsystem);
			}
			else {
				ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
				$lpsystem = $bblapsettings[0,1];
				Beep($lpsystems);
			}
}
sub beep_symphony {
	my ($self, @symphony) = @_;
	$self => {_symphony} = $symphony if defined $symphony;
	ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
	my @validbeeps = ("beep", "bop", "blap");
	my @symphonygrepped = grep{/$validbeeps$/} @symphony;
	foreach my $beep (@symphonygrepped) {
		if ($beep = "beep") {
			$lpsystem = (750, 300);
			Beep($lpsystem);
		}
		elsif ($beep = "bop") {
			$lpsystem = (500, 300);
			Beep($lpsystem);
		}
		elsif ($beep = "blap") {
			$lpsystem = (850, 300);
			Beep($lpsystem);
		}
		else { 
			return "Not a valid signal!";
			}
	}
}