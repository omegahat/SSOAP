library(SSOAP)
library(XML)
KEGGserver="http://soap.genome.jp/keggapi/request_v6.2.cgi"
KEGGxmlns="SOAP/KEGG"
KEGGaction="SOAP/KEGG"
KEGGsoapns="1.2"

## Here is where things get more interesting.  If I set the variable below to:
genes.id.list = c("eco:b0078") ## then the code chunk below doesn't work as expected (I get no results)
## BUT, if I set it to:
genes.id.list = c("eco:b0078","") ## then the code chunk below magically works again...  This is puzzling.

## code chunk
.SOAP(KEGGserver, "get_pathways_by_genes",
                              .soapArgs=list('genes_id_list' = genes.id.list),
                              action = KEGGaction,
                          xmlns = KEGGxmlns,
                          nameSpaces = SOAPNameSpaces(version=KEGGsoapns))


#tt = XMLSchema:::resolve(kegg.wsdl@operations[[1]]$get_pathways_by_genes@parameters[[1]], kegg.wsdl@types)
tt = strArrayType = new("ArrayType", elType = new("PrimitiveSOAPType", nsuri = "http://www.w3.org/2001/XMLSchema", name = "string" ))
.SOAP(KEGGserver, "get_pathways_by_genes",
                              .soapArgs=list('genes_id_list' = genes.id.list),
                              action = KEGGaction,
                          xmlns = KEGGxmlns,
                          nameSpaces = SOAPNameSpaces(version=KEGGsoapns),
             .types = list(tt))

