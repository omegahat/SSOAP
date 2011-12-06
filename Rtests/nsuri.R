ty = unlist(w@types, recursive = FALSE)
gc = sapply(ty, function(x) (is(x, "GenericSchemaType")))
#sapply(ty[gc], function(x) length(x@nsuri) > 0 && !is.na(x@nsuri))
names(ty) = sapply(ty, function(x) x@name)
#sapply(ty[gc], function(x) length(x@nsuri) > 0 && !is.na(x@nsuri))
table(sapply(ty[gc], class)[!sapply(ty[gc], function(x) length(x@nsuri) > 0 && !is.na(x@nsuri))])

o = split(ty[gc], sapply(ty[gc], class))

table(unlist(sapply(ty[gc], function(x) x@nsuri)))
