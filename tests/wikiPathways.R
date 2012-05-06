library(SSOAP)

u = "http://www.wikipathways.org/wpi/webservice/webservice.php?wsdl"
#w = processWSDL("WSDLs/wikipathways.R")
w = processWSDL(u) 
wk = genSOAPClientInterface(, u)

wk@functions$listOrganisms()

if(FALSE) {

srv = SOAPServer("http://www.wikipathways.org/wpi/webservice/webservice.php");
## List all organisms on WikiPathways ##
reply = .SOAP(srv, "listOrganisms", action=I("listOrganisms"), handlers=NULL)
doc = xmlParse(reply$content, asText=TRUE)
organismNodes = xmlElementsByTagName(xmlRoot(doc), "organisms", TRUE)

unlist(xmlToList(v$content)$Body)

## Find all pathways for the 'apoptosis' keyword ##
reply = .SOAP(srv, "findPathwaysByText", query="apoptosis", species="", action=I("findPathwaysByText"), handlers=NULL)
doc = xmlParse(reply$content, asText=TRUE)

# Find the result nodes with an xpath query
resultNodes = getNodeSet(doc, "//*[local-name()='result']")
# Print the pathway name, species and url for each result
for(node in resultNodes) {
  children = xmlChildren(node, addNames= TRUE)
  url = xmlValue(children$url)
  name = xmlValue(children$name);
  species = xmlValue(children$species);

  print(paste(name, " (", species, "): ", url, sep=""))
}
}
