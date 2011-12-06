#!/usr/bin/perl -w
use SOAP::Lite
    on_action => sub { sprintf '"%s"', shift}
;

$s = SOAP::Lite
 -> proxy("http://upload.eraserver.net/circle24/worldtime/worldtime.asmx")
    -> uri("http://circle24.com/webservices/WorldTime/GetTime");

# $response = $s->GetTime('City' => 'New York');

# $response = $s->GetTime(SOAP::Data->name(City => 'New York'));

$response = $s->GetTime(SOAP::Data->type(string => 'New York'));

die "Fault: ".$response->faultcode." ".$response->faultdetail." ".$response->faultstring if $response->faultcode;  

$k = $response->result;
print "Answer: $k";
# print @res;

