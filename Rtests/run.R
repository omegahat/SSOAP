library(SSOAP)

def = processWSDL("TestService.wsdl")
iface = genSOAPClientInterface(def@operations[[1]], def, def@name)

token = iface@functions$login("?", "?", .opts = list(verbose = FALSE))

txt = iface@functions$getFile("xxxx")
txt = iface@functions$getFile(token, "xxxx")


adef = processWSDL("TestService-modified.wsdl")
aiface = genSOAPClientInterface(adef@operations[[1]], adef, adef@name)


token = aiface@functions$login("kalbflei", "kalbflei", .opts = list(verbose = FALSE))
cel = aiface@functions$getFile(token, "xxxx")

# Get the raw result and we'll see what we have and how to handle it.
cel = aiface@functions$getGZIPFile(token, "xxxx", .convert = NULL)

getGZContent =
function(ans)
{
  n = getReturnNode(ans)
  rr = base64Decode(xmlValue(n), mode = "raw")
  library(Rcompression)
  gunzip(rr)
}

cel = aiface@functions$getGZIPFile(token, "xxxx", .convert = getGZContent)
substring(cel, 1, 1000)
