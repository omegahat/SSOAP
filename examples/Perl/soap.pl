use SOAP::Lite;

$response = SOAP::Lite
 -> proxy("http://services.xmethods.com/perl/soaplite.cgi")
 -> uri("urn:xmethodsPing")
 -> pingHost("www.yahoo.com");

print "Answer: ";
print $response, "\n";

