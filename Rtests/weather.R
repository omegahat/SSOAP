library(SSOAP)
w = processWSDL("http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl")
iface = genSOAPClientInterface(, w)
iface@functions$LatLonListCityNames(2)

