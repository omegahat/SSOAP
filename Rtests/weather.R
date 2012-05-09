library(SSOAP)
w = processWSDL("http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl")
iface = genSOAPClientInterface(, w)
txt = iface@functions$LatLonListCityNames(2)

doc = xmlParse(txt)
tmp = xmlSApply(xmlRoot(doc), xmlValue)
els = strsplit(tmp, "[,|]")





