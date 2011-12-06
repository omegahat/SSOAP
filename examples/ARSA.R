library(SSOAP)
g = processWSDL("http://xml.nig.ac.jp/wsdl/ARSA.wsdl")
f = genSOAPClientInterface(g)

r = f@functions$searchSimple("Escherichia coli", 1, 1000)
r = strsplit(r, "\\n")[[1]]
r = r[ -c(1, length(r)) ]

wsdls = c("http://xml.nig.ac.jp/wsdl/NCBIGenomeAnnotation.wsdl",
          "http://xml.nig.ac.jp/wsdl/GetEntry.wsdl",
          "http://xml.nig.ac.jp/wsdl/TxSearch.wsdl",
          "http://xml.nig.ac.jp/wsdl/Ensembl.wsdl",
          "http://xml.nig.ac.jp/wsdl/GTPS.wsdl",
          "http://xml.nig.ac.jp/wsdl/Gtop.wsdl",
          "http://xml.nig.ac.jp/wsdl/GIBV.wsdl",
          "http://xml.nig.ac.jp/wsdl/Gib.wsdl",
          "http://xml.nig.ac.jp/wsdl/GIBIS.wsdl",
          "http://xml.nig.ac.jp/wsdl/SPS.wsdl",
          "http://xml.nig.ac.jp/wsdl/VecScreen.wsdl",
          "http://xml.nig.ac.jp/wsdl/PhylogeneticTree.wsdl",
          "http://xml.nig.ac.jp/wsdl/Blast.wsdl",
          "http://xml.nig.ac.jp/wsdl/ClustalW.wsdl",
          "http://xml.nig.ac.jp/wsdl/Mafft.wsdl",
          "http://xml.nig.ac.jp/wsdl/RequestManager.wsdl",
          "http://xml.nig.ac.jp/wsdl/DDBJ.wsdl",
          "http://xml.nig.ac.jp/wsdl/ARSA.wsdl"
         )

ifaces = lapply(wsdls, function(w) genSOAPClientInterface(processWSDL(w)))
names(ifaces) = gsub(".wsdl", "", basename(wsdls))

fileNames = sprintf("/tmp/%s.R", names(ifaces))
mapply(writeInterface, ifaces, fileNames)
lapply(fileNames, function(f) { e = new.env(); source(f, local = e)})


