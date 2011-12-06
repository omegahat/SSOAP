# Inputs for examples very gratefully received from Jan Hummel.
#

library(SSOAP)
z = processWSDL("WSDLs/wsGoBioSpace.asmx.WSDL", port = 1)
f = genSOAPClientInterface(, z)

a = f@functions$GetAdducts()
d = f@functions$GetDepositors()

# environment(f@functions$GetAdduct)$.operation@returnValue@type@type@elType@isAttribute

  # DepositorIds
session = f@functions$CreateSession(DepositorIds = c(3, 6, 8), AdductIds = c(2L, 3L))

sm = f@functions$SearchMass12C(SessionID = session, mass = 579.1705, tolerance = 0.001)
names(sm)
sapply(sm, slot, "fID")

f@functions$PurgeSession(session)


