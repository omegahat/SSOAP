setGeneric("paramTypes", 
            function(x, ...) standardGeneric("paramTypes"))

setMethod("paramTypes", "WSDLGeneratedSOAPFunction", 
             function(x, ...)
                paramTypes(environment(x)$.operation))

setMethod("paramTypes", "WSDLMethod",
             function(x, ...)
                x@parameters)
