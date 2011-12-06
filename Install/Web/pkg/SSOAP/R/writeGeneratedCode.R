
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
   
   sink(file)
   if(file != stdout())
      on.exit({cat("Re-sinking\n"); sink()}, add = TRUE)

   sapply(iface@classes,
          function(types)
            sapply(types,
                    function(def) {
                        if(!is.character(def))
                          return()

                       exportClassDef(getClass(def,  where = where))

                       cat("setAs('XMLAbstractNode',", sQuote(def), ",\n")
                       m = as(selectMethod('coerce', c("XMLAbstractNode", def)), "function")
                       environment(m) = globalenv()
                       print(m)
                       cat(")\n")
                    }))
   
   sapply(names(iface@functions),
           function(id) {
             cat(id, "=", "\n")
             f = iface@functions[[id]]
             print(expandFunction(f))
             cat("\nclass(", id, ") = c(", paste(c("SerializedFunction", sQuote(class(f))), sep = ", "), ")\n\n")
           })
   
   invisible(TRUE)
}

exportClassDef =
function(def)
{
  cat("setClass(", sQuote(def@className))
  if(length(def@slots)) 
    cat(",\n   representation(\n",
            paste(names(def@slots), sQuote(unlist(def@slots)), sep = " = ", collapse = ",\n\t"),
          ")")
  if(length(def@contains))
      cat(",\n   contains = ", sQuote(names(def@contains)[1]))
#  paste(sQuote(names(def@contains)), collapse = ", ")

    # prototype
  cat(")\n\n")
}


# Do we ever use this.
if(FALSE)
ef =
function(f)
{
   g = function() {x}
   body(g)[[2]] =  environment(f)$.header
   g
}

expandFunction =
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
   formals(f)[[".convert"]] = op@returnValue@fromConverter
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

setGeneric("expandS4",
            function(x)
              standardGeneric("expandS4"))

setMethod("expandS4", "list",
function(x) {

  e = quote(list())
  for(i in seq(along = x))
    e[[i + 1]] = expandS4(x[[i]])

  if(length(names(x)))
    names(e) = c("", names(x))

  e
})


setMethod("expandS4", "ANY",
function(x)
{
   if(!isS4(x))
      return(x)

   e = substitute(new(k), list(k = class(x)))
   for(i in seq(along = slotNames(x))) {
      e[[ i + 2 ]] = expandS4(slot(x, slotNames(x)[i]))
   }
   names(e) = c("", "", slotNames(x))
   e
})
