library(SSOAP)

ff = list.files(pattern = "wsdl$", full.name = TRUE, recursive = TRUE)
ff = grep("SSOAP.Rcheck", ff, invert = TRUE, value = TRUE)
wsdls = lapply(ff, function(x) {print(x) ; w = try(genSOAPClientInterface(, processWSDL(x)))})


#wsdls = lapply(ff, function(x) {print(x) ; w = processWSDL(x)})
