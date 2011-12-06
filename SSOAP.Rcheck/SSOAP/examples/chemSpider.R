library(SSOAP)
cs = processWSDL("http://www.chemspider.com/MassSpecAPI.asmx?WSDL")
o = genSOAPClientInterface(, cs)
token = getOption("ChemSpiderToken")

 o@functions$SearchByMass2(list(mass = 89.04767, range = 0.01)) 
 o@functions$SearchByMass2(mass = 89.04767, range = 0.01) # also works

if(!is.character(token)) {
 o@functions$GetExtendedCompoundInfo(list(CSID=23078572L, token = token))
 o@functions$GetExtendedCompoundInfo(CSID=23078572L, token = token) # works too.

   # This works.
 o@functions$GetExtendedCompoundInfoArray(list(CSIDs = c(23500L, 23543L), token = token))
   # This doesn't!
 o@functions$GetExtendedCompoundInfoArray(c(23500, 23543), token)
}


writeInterface(o, "ChemSpiderCode.R")
source("ChemSpiderCode.R")

SearchByMass2(list(mass = 89.04767, range = 0.01)) 
SearchByMass2(mass = 89.04767, range = 0.01) # also works
if(!is.character(token)) {
   GetExtendedCompoundInfo(list(CSID=23078572L, token = token))
   GetExtendedCompoundInfo(CSID=23078572L, token = token) # works too.
} 


