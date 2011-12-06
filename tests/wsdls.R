w = c("http://www.massbank.jp/api/services/MassBankAPI?wsdl", "http://metlin.scripps.edu/soap/metlin.wsdl",
      "http://pubchem.ncbi.nlm.nih.gov/pug_soap/pug_soap.cgi?wsdl",
      "http://www.chemspider.com/MassSpecAPI.asmx?WSDL", "../WSDLs/webservice.php?wsdl",
      "http://www.brenda-enzymes.org/soap/brenda.wsdl", "http://sdw-ws.ecb.europa.eu/services/SDMXQuery?wsdl",
      "http://stats.oecd.org/SDMXWS/sdmx.asmx?WSDL")
o = lapply(w, function(x) {cat(x, "\n"); try(genSOAPClientInterface(, processWSDL(x)))})

