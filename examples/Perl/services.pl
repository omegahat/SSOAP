use SOAP::Lite;

# http://www.xmethods.net/wsdl/query.wsdl")
$response = SOAP::Lite
 -> proxy("http://www.xmethods.net/ve2/Interfaces.po#soap")
 -> uri("urn:xmethodsPing")
 -> getServiceNames();

print "Answer: ";
print $response, "\n";

