 #!perl -w

use SOAP::Lite;

# Apache SOAP http://xml.apache.org/soap/ (running on XMethods.net)

$s = SOAP::Lite                             
    -> uri('urn:xmethods-BNPriceCheck')                
    -> proxy('http://services.xmethods.net/soap/servlet/rpcrouter');

my $isbn = '0596000278'; # Programming Perl, 3rd Edition

print $s->getPrice(SOAP::Data->type(string => $isbn))->result;
