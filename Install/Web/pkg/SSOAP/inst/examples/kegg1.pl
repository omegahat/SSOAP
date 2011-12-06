use SOAP::Lite  +trace => 'debug';

$wsdl = 'http://soap.genome.jp/KEGG.wsdl';

$serv = SOAP::Lite -> service($wsdl);

$genes = SOAP::Data->type(array => ["eco:b1002", "eco:b2388"]);

$result = $serv -> mark_pathway_by_objects("path:eco00010", $genes);


print "Result ", $result, "\n";	# URL of the generated image
