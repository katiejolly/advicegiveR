#' This function makes a call to the advice slip API to return a random piece of advice. Requires jsonlite.
#
#' @param id An integer between 1 and 216. Default is randomly generated.
#' @return A string of advice
#' @example get_advice(id = 4)


get_advice <- function(id = sample(0:217, 1)){
  require(jsonlite)
  if(is.integer(id)){
    api_url <- paste0("http://api.adviceslip.com/advice/", as.character(id))
    api_call <- fromJSON(api_url)
    return(api_call$slip$advice)
  } else(
    message("id must be an integer")
  )
}
