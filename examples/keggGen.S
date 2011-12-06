kegg = processWSDL("http://soap.genome.ad.jp/KEGG.wsdl")
names(kegg@operations[[1]])
op = kegg@operations[[1]][["get_genes_by_pathway"]]
f = createOperationDefinition(op, kegg@server, kegg@types)
p = f("path:eco00020", .convert = TRUE)

#Type: string  & length =  27 
#There were 27 warnings (use warnings() to see them)
p

