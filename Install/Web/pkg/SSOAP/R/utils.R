
changeQuotes =
function(txt, fancyQuote = c('"' = "\u2018", '"' = "\u2019"))
{
  for(i in seq(along = fancyQuote))
     txt = gsub(fancyQuote[i], names(fancyQuote)[i], txt)

  txt
}

sQuote =
function(x)
{
  sprintf("'%s'", x)
}

