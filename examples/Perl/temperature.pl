 #!perl -w

use SOAP::Lite +debug;

print SOAP::Lite                                            
    -> uri('http://www.soaplite.com/Temperatures')
    -> proxy('http://services.soaplite.com/temper.cgi')
    -> c2f(37.5)
    -> result;

