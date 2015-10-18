isHTTPError <-
  #
  # Looks at the elements of the HTTP response
  # header, assumed to be pre-processed into name-value pairs,
  # and figures out whether the response indicates an error
  # or success.
  # It does this by looking for the non name-value pair
  # corresponding to the `HTTP/1.1 status message' string.
  # It then gets the status and compares it to the value 200.
function(response)
{
  if(length(response) == 0)
     stop("HTTP response had no content")
  
  !(response[["status"]] %in% c(100, 200:206))
}  
