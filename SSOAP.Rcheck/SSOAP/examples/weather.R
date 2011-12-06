# http://www.weather.gov/forecasts/xml/SOAP_server/ndfdXMLserver.php?wsdl

library(SSOAP)
wsdl = processWSDL("~/Projects/org/omegahat/XML/SOAP/examples/ndfdXMLserver.wsdl")
iface = genSOAPClientInterface(def = wsdl)


# displayLevel > 0 different amounts of information with 1, 2, 3
x = iface@functions$LatLonListCityNames(2)

library(XML)
doc = xmlRoot(xmlTreeParse(x, useInternal = TRUE))
txt = xmlValue(doc[["latLonList"]])

lat.lon = read.csv(textConnection(gsub(" ", "\\\n", txt)), header = FALSE)
rownames(lat.lon) = strsplit(xmlValue(doc[["cityNameList"]]), "|", fixed = TRUE)[[1]]




