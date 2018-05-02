#' Loads one of the background images for your advice with magick package.
#'
#'@param image_name String that specifies which background you'd like to load. The options are clouds, rainbow, rain, mountain, ocean, or paper. Default is
#'@return Image object
#'@examples load_image(image = "clouds")
#'

advice_image_load <- function(image_name = "clouds"){
  image_url <- paste0("https://raw.githubusercontent.com/katiejolly/advicegiveR/working/data/", image_name, ".jpg") # create the url

  tryCatch(
    magick::image_read(image_url) %>%
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
#'@return Image with the advice message annotated on top of it
#'
#'@examples print_advice(image = background, advice = advice_text, textcolor = "yellow", size = 35)

print_advice <- function(image, advice, textcolor = "white", size = 30){
  if(class(image) != "magick-image"){
    stop("Error: Image class must be magick-image") # only run if the image is correct
  }
  if(!is.character(advice)){
    stop("Error: Advice must be a string") # only run if advice is a character string
  }
  magick::image_annotate(image, text = stringr::str_wrap(advice, width = 20), gravity = "center", size = size, color = textcolor, font = "Century Gothic")
}



