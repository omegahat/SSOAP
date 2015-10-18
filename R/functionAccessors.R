

setGeneric("returnType",
           function(fun, ...) {
             standardGeneric("returnType")
           })

setMethod("returnType", "WSDLGeneratedSOAPFunction",
          function(fun, ...)
             environment(fun)$.operation@returnValue)


setGeneric("returnConverter",
           function(fun, ...) {
             standardGeneric("returnConverter")
           })

setMethod("returnConverter", "WSDLGeneratedSOAPFunction",
          function(fun, ...)
             returnType(fun)@fromConverter
          )

setGeneric("server",
           function(fun, ...) {
             standardGeneric("server")
           })

setMethod("server", "WSDLGeneratedSOAPFunction",
          function(fun, ...)
             get(".defaultServer", environment(fun)))
