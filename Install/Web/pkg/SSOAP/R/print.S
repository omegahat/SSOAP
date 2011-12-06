print.WSDLMethod =
function(x, ...)
{
  args <- paste(names(x@parameters), collapse = ", ")
  cat(x@name, "(", args, ")\n")
}
