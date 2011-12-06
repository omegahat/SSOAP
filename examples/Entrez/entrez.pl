#!/usr/bin/perl

use SOAP::Lite;

$wsdl = 'http://www.ncbi.nlm.nih.gov/entrez/eutils/soap/eutils.wsdl';

$serv = SOAP::Lite->service($wsdl);

print join(', ', keys(%{$serv})), "\n";
$x = $serv->run_eInfo("text");

print $x, "\n";
print join(', ', keys(%{$x})), "\n";


