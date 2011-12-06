 #!perl -w

use SOAP::Lite +debug;

# GLUE http://www.themindelectric.com/ (running on XMethods.net)

my $s = SOAP::Lite                             
    -> uri('urn:xmethods-CurrencyExchange')                
    -> proxy('http://services.xmethods.net/soap');

my $r = $s->getRate(SOAP::Data->name(country1 => 'England'), 
                      SOAP::Data->name(country2 => 'Japan'))
            ->result;
  print "Currency rate for England/Japan is $r\n";
