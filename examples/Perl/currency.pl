use SOAP::Lite;

$response = SOAP::Lite
 -> proxy("http://services.xmethods.net/soap")
 -> uri("urn:xmethods-CurrencyExchange")
 -> getRate(country1=>"ireland", country2=>"usa");

$res = $response->result;

print "Answer: $res";
# print @res;

