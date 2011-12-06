library(SSOAP)
library(XML)
org = "hsa"
start = 1
max.results = 10
KEGGserver= SOAPServer("soap.genome.jp", url="/keggapi/request_v6.2.cgi")
KEGGxmlns="SOAP/KEGG"
KEGGaction="SOAP/KEGG"

#debug(XMLSchema:::fromSOAPArray)
## If I call .SOAP() I get an error about infinite recursion.
xx = unlist(.SOAP(KEGGserver, "get_genes_by_organism", .soapArgs = list(org = org,start = start, max_results = max.results), action = KEGGaction, xmlns = KEGGxmlns)) 
