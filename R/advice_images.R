#' Loads one of the background images for your advice with magick package.
#'
#' @param image_name String that specifies which background you'd like to load. The options are clouds, rainbow, rain, mountain, ocean, or paper. Default is
#' @return Image object
#' @example load_image(image = "clouds")
#'

advice_image_load <- function(image_name = "clouds"){
  magick::image_read(image_name)
}

#' Prints advice on your background image (from advicegiveR::image_load())
#'
#'@param image Image object
#'@param advice Advice string from advicegiveR::get_advice() or a self-supplied string
#'
#'
test <- magick::image_read("data/parchment_background.png") %>%
  image_annotate(text = stringr::str_wrap(advice, width = 20), gravity = "center", size = 60)

test

