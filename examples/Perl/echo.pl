use SOAP::Lite;

$response = SOAP::Lite
 -> proxy("http://services.xmethods.net/perl/soaplite.cgi")
 -> uri("urn:soapinterop")
 -> echoString(inputString=>"foo");

die "Fault: ".$response->faultcode." ".$response->faultdetail." ".$response->faultstring if $response->faultcode;  

print $response->result, "\n";

$res = $response->result;

print "Answer: $res";
# print @res;

