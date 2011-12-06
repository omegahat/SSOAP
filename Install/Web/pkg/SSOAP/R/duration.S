duration =
  # e.g. c("P5Y2M10D", "P5Y2M10DT15H", "-P10D", "T1H2M30S")
  # This is not necessarily an efficient implementation.
  # It is reasonably straightforward.
function(x)
{
   # Remove the initial P, although it could be after a -
  x = gsub("^([-]?)P", "\\1", x)
    # Fetch the bit after and before the T, if it is there.
  tmp = strsplit(x, "T")
  times = sapply(tmp, "[", 2)  # function(x) if(length(x) > 1) x[2] else NA)
  ymd = sapply(tmp, "[", 1)

  
 
  ids = c("years" = "Y", "months" = "M", "days" = "D",
          "hours"  = "H", "minutes" = "m", seconds = "S")

  tt = as.integer(rep(NA, length(x)))
  ans = data.frame(years = tt, months = tt, days = tt,
                   hours = tt, minutes = tt, seconds = tt)
              

  process =
    function(els, pattern = "[YMD]", days = TRUE) {
       sapply(seq(along = els), 
              function(i) {
                x = els[i]
                if(is.na(x) || x == "")
                  return(FALSE)           
                vals = strsplit(x, pattern)
                labels = strsplit(x, "[0-9]+")
                labels = sapply(labels, function(x) x[-1])
                if(days) {
                  ids = ids[1:3]
                } else {
                  labels[labels == "M"] = "m"
                }
                j = match(labels, ids)                        
                ans[i, j] <<- as.integer(unlist(vals))
              }
              )
     }

  process(ymd)
  process(times, "[HMS]", FALSE)  

  class(ans) = c("duration", class(ans))
#  new("duration", ans)
  ans
}  
