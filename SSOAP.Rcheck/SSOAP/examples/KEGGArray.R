# Example of working with an array.

wsdl = "http://soap.genome.jp/KEGG.wsdl"
wsdl = "~/KEGG.wsdl"
library(SSOAP)

kegg <- processWSDL(wsdl)
def = genSOAPClientInterface(def=kegg, verbose = TRUE) 


cvt =
function(content, type) {

  tt = SSOAP:::parseSOAP(content$content, asText = TRUE)

     # envelope, body, get_elements_by_pathwayResponse, return
  tmp = xmlApply(SSOAP:::getReturnNode(tt),
                  fromSOAP, type = "PathwayElement")

  as(tmp, "ArrayOfPathwayElement")
}

z = def@functions$get_elements_by_pathway('path:bsu00010', .convert = cvt)



# The default mechanism seems marginally faster.

content = def@functions$get_elements_by_pathway('path:bsu00010', .convert = FALSE)
type = environment(def@functions$get_elements_by_pathway)$.operation@returnValue
system.time(zz <- convertFromSOAP(SOAPResult(content$content, content$header), type))
# [1] 5.21 0.07 5.42 0.00 0.00

system.time(zzz <- cvt(content, type))
# [1] 5.93 0.07 6.17 0.00 0.00


# The cvt function does get the class right.
