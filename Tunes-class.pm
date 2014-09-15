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
		_symphony => shift;
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
	$self => {_duration} = $duration if defined $duration;
	ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
	$lpsystem = ($frequency, $duration);
	Beep($lpsystem);
}
sub beep_symphony {
	my ($self, @symphony) = @_;
	$self => {_symphony} = $symphony if defined $symphony;
	ApiLink('kernel32.dll', 'void Beep', [LPSYSTEM $lpsystem]) || die;
	my @validbeeps = ("beep", "bop", "blap");
	my @symphonygrepped = grep{/$validbeeps$/} @symphony;
	foreach my $beep = (@symphonygrepped) {
		if $beep = "beep" {
			$lpsystem = (750, 300);
			Beep($lpsystem);
		}
		elsif $beep = "bop" {
			$lpsystem = (500, 300);
			Beep($lpsystem);
			}
		elsif $beep = "blap" {
			$lpsystem = (850, 300);
			Beep($lpsystem);
		}
	}
}