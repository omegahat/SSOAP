# Test the use of a SOAP header using KEGG functions.

kegg.wsdl = processWSDL("http://soap.genome.jp/KEGG.wsdl")
kegg.iface = genSOAPClientInterface(, kegg.wsdl, addSoapHeader = TRUE)
f = function(...)
      newXMLNode("Header", newXMLNode("login", "Duncan Temple Lang"), newXMLNode("token", 12345), newXMLNode("app", "R"))

debug(.SOAP)

kegg.iface@functions$list_databases(.soapHeader = f)

h = newXMLNode("Header", newXMLNode("login", "Duncan Temple Lang"), newXMLNode("token", 12345), newXMLNode("app", "R"))
kegg.iface@functions$list_databases(.soapHeader = h)

kegg.iface = genSOAPClientInterface(, kegg.wsdl, addSoapHeader = f)
kegg.iface@functions$list_databases()
