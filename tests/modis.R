# See http://daac.ornl.gov/MODIS/MODIS-menu/modis_webservice.html
# for examples.

library(SSOAP)

w = processWSDL("http://daac.ornl.gov/cgi-bin/MODIS/GLBVIZ_1_Glb_subset/MODIS_webservice.wsdl")
def = genSOAPClientInterface(, w)

products = def@functions$getproducts()

def@functions$getbands("MCD12Q1")

o = def@functions$getdates(40, 0100, "MOD11A2")


b = def@functions$getbands("MOD13Q1")
d = def@functions$getdates(40,-110, "MOD13Q1")
d = d[c(length(d)-1, length(d))]
 #XXX  FAILS
o = def@functions$getsubset(40, -110, "MOD13Q1", "250m_16_days_NDVI", d[1], d[2], 10,  10)

if( (email <- Sys.getenv("EMAIL")) != "")
  foo = def@functions$getsubsetorder(40.1, -110.2, "MOD13Q1",
                                        email, "data", d[1], d[2],  10, 10)
