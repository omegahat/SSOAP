
#
# This may exist in other parts of the package already, but I can't see it off hand
# The intent is to take the output from genSOAPClientInterface and write them 
# to a file so that it can be used in a package.
# We have to deal with environments here and handle the objects in those environments.
# There are various approaches for this, including using package-level variables.
# If there are multiple ports in the WSDL, i.e. Web services, we will need to 
# disambiguate between these.
#
# We also need to dump the class information.
#
#
# We have issues with deparse()'ing the S4 objects.
#
#


writeInterface =
function(iface, file =  stdout(), where = globalenv())
{
   if(is.character(file)) {
     file = file(file, "w")
     on.exit(close(file))     
   }

   if(!isOpen(file)) {
     file = open(file, "w")
     on.exit(close(file))
   }

   cat("library(SSOAP)\nlibrary(XMLSchema)\nlibrary(XML)\n", file = file)

   sapply(iface@classes,
          function(types)
            sapply(types, writeClassDef, file = file, where = where))
   
   sapply(names(iface@functions),
           function(id) {
             cat(id, "=", "\n", file = file)
             f = iface@functions[[id]]
             cat(deparse(expandFunction(f)), file = file, sep = "\n")
             cat("\nclass(", id, ") = c(", paste(sQuote(c("SerializedFunction", class(f))), collapse = ", "), ")\n\n", file = file)
           })
   
   invisible(TRUE)
}



# Do we ever use this.
if(FALSE) {
ef = function(f)
{
   g = function() {x}
   body(g)[[2]] =  environment(f)$.header
   g
}
}

expandFunction =
  # This is highly specific to the SOAP code we generated. It could be abstracted, but no need for now.
function(f)  
{
   env = environment(f)
   op = env$.operation
   
   ex = body(f)[[2]]

   ex[[3]] = op@name
   ex[["action"]] = op@action
   ex[["xmlns"]] = op@namespace
   ex[[".types"]] = expandS4(op@parameters)
         # XXX losing the names here.
         # dput() with SHOWATTRIBUTES removed from SIMPLE_OPTS in deparse.c
         # fixes the problem. But for now, let's just create the call.
       
   ex[[".header"]] =  makeCall(get(".header", env))  #    expandS4(get(".header", env))

   body(f)[[2]] = ex

     # change the default values of some of the parameters
     # to substitute
   formals(f)[[".convert"]] = expandS4(op@returnValue) # @fromConverter
   formals(f)[["server"]] = expandS4(get(".defaultServer", env))

   attr(f, "source") = NULL
#   class(f) = c("SerializedFunction", class(f))
   environment(f) = globalenv()

   f
}

makeCall =
function(obj)
{
  e = call("c")
  e[seq(along = obj) + 1] = obj
  names(e)[seq(along = obj) + 1] = names(obj)
  e
}




