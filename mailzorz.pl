#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $argv = shift or die "Uso: perl mailzorz.pl filetesto.txt\n";
open (TEXT, "< " . $argv);

my $cont = <TEXT>;
print "Mail del mittente: ";
chomp(my $yrmail = <STDIN>);
print "Nome del mittente: ";
chomp(my $yrname = <STDIN>);
print "Nome destinatario: ";
chomp(my $hsname = <STDIN>);
print "Mail destinatario: ";
chomp(my $hsmail = <STDIN>);
print "Oggetto dell'email: ";
chomp(my $subject = <STDIN>);

$yrmail =~ /[\w\.-]+@[\w\.-]+\.[\w]{2,4}/ or die "L'indirizzo e-mail del mittente non e' valido";
$hsmail =~ /[\w\.-]+@[\w\.-]+\.[\w]{2,4}/ or die "L'indirizzo e-mail del destinatario non e' valido";

my $url = "http://kn0t.th3game.in/m4ilz0rz/z0rz.php?yrname=" . $yrname . "&yrmail=" . $yrmail . "&hsname=" . $hsname . "&hsmail=" . $hsmail . "&subject=" . $subject . "&text=" . $cont;

my $content = get $url;
if ($content =~ /M4il inviata./) {
	print "Mail inviata con successo :)\n";
} elsif ($content =~ /OMFG un3xp3ct3d 3rr0rz!/) {
	print "Errore inaspettato :/\n";
}
