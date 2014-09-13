package Tunes::class

#!usr/bin/perl
use strict;
use warnings;
use Win32::API;
use Win32::API::Prototype;

sub new {
	my $class = shift;
	my $self = {
		_function => shift;
		_frequency => shift;
		_duration => shift;
	}
	bless $self, $class;
	return $self;
}

sub beep {
	my ($self, $function) = @_;
	$self => {_function} = $function if defined $function;
	my $frequency = $function[0];
	$self => {_frequency} = $frequency if defined $frequency;
	my $duration = $function[1];
	$elf => {_duration} = $duration if defined $duration;
	ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $beepfunc]) || die;
	$beepfunc = (750, 300);
	Beep($beepfunc);
}