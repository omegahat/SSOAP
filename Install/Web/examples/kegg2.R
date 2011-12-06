
library(SSOAP)
kegg.wsdl = processWSDL("~/KEGG.wsdl")
kegg.iface = genSOAPClientInterface(, kegg.wsdl)

genes = c("eco:b1002", "eco:b2388")


kegg.iface@functions[["mark_pathway_by_objects"]]("path:eco00010", genes)

