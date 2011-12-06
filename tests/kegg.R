library(SSOAP)
w = processWSDL("http://soap.genome.jp/KEGG.wsdl")
kegg.iface = genSOAPClientInterface(, w, addSoapHeader = TRUE)

o = kegg.iface@functions$get_pathways_by_genes("eco:b0078")

f = "kegg-code.R"

sink(f)
writeInterface(kegg.iface)
sink()

source(f)

