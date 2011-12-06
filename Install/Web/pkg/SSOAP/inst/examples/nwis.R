library(SSOAP)

wsdl = "nwis.wsdl"
nwis <- processWSDL(wsdl)
def = genSOAPClientInterface(def = nwis, verbose = TRUE) 

setAs("character", "GetSiteInfo", function(from) new("GetSiteInfo", SiteCode = from))

def@functions$GetSiteInfo("374048118543001")

