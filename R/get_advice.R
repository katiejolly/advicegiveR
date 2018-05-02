#' Makes a call to the advice slip API to return a random piece of advice. Requires jsonlite.
#
#'@param id An integer between 1 and 216. Default is randomly generated.
#'
#'@return A string of advice
#'
#'@import jsonlite
#'
#' @export

get_advice <- function(id = sample(1:216, 1)){
  if(!(id%%1==0)){
    stop("Error: id must be an integer")
  }
  if(!(id >= 1 & id <= 216)){
    stop("Error: id must be between 1 and 216")
  }
  message("The id you are using is ", as.character(id))
    api_url <- paste0("http://api.adviceslip.com/advice/", as.character(id))
    message("API endpoint = ", api_url)
    api_call <- fromJSON(api_url)
    return(api_call$slip$advice)
}

#' Loads one of the background images for your advice with magick package.
#'
#'@param image_name String that specifies which background you'd like to load. The options are clouds, rainbow, mountain, ocean, sunset, or paper. Default is
#'@return Image object
#'
#'@import jsonlite
#'@import magick
#'@examples load_image(image_name = "clouds")
#'
#' @export
#'

load_image <- function(image_name = "clouds"){
  image_url <- paste0("https://raw.githubusercontent.com/katiejolly/advicegiveR/master/inst/extdata/", image_name, ".jpg") # create the url

  tryCatch(
    image_read(image_url) %>%
      image_scale("500"),
    error = function(e){
      message("Error: Please enter a valid image name. The options are clouds, mountain, ocean, paper, rainbow, or sunset")
    }
  )
}

#' Prints advice on your background image (from advicegiveR::image_load())
#'
#'@param image Image object
#'@param advice Advice string from advicegiveR::get_advice() or a self-supplied string
#'@param textcolor The color of the advice. Accepts color strings or hex codes. Default is white.
#'@param size Size of the text. Default is 30.
#'
#'@import magick
#'@import stringr
#'@import extrafont
#'
#'@return Image with the advice message annotated on top of it
#'
#'@examples
#'\dontrun{
#' print_advice(image, advice, textcolor = "yellow", size = 35) }
#'
#' @export

print_advice <- function(image, advice, textcolor = "white", size = 30){
  if(class(image) != "magick-image"){
    stop("Error: Image class must be magick-image") # only run if the image is correct
  }
  if(!is.character(advice)){
    stop("Error: Advice must be a string") # only run if advice is a character string
  }
  image_annotate(image, text = str_wrap(advice, width = 20), gravity = "center", size = size, color = textcolor, font = "Century Gothic")
}



