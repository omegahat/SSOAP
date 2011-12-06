library(SSOAP)
w = processWSDL("WSDLs/MODIS_webservice.wsdl")
iface = genSOAPClientInterface(, w)

o = iface@functions$getdates(40, 0100, "MOD11A2")

z = iface@functions$getsubset(40,-100,"MOD11A2","LST_Day_1km","A2002001","A2002031",10,10)
