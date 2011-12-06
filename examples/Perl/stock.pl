 #!perl -w

use SOAP::Lite +debug;

# GLUE http://www.themindelectric.com/ (running on XMethods.net)

my $s = SOAP::Lite                             
    -> uri('urn:xmethods-delayed-quotes')                
    -> proxy('http://services.xmethods.net/soap');

my $symbol = 'AMZN';
  my $r = $s->getQuote($symbol)->result;
  print "Quote for $symbol symbol is $r\n";
