library(SSOAP)

wsdl="http://calibayes2.ncl.ac.uk:81/CalibayesServices1.wsdl"
if(file.exists("tests/CalibayesServices1.wsdl"))
 wsdl = "tests/CalibayesServices1.wsdl"
cali.wsdl = processWSDL(wsdl)
cali.def = genSOAPClientInterface(def = cali.wsdl, verbose = FALSE)

sid="Calibayes_1248593626578"

IsReasy=
function (from) 
{
    obj = new("isReady")
    obj@sessionId <- from # xmlValue(from[["sessionId"]])
    obj
}
 
setAs("character", "isReady", IsReasy) # function(from) IsReasy)
if(FALSE) {
rst = cali.def@functions$isReady(sid)
rst@status 
}
