library(testthat)

img <- load_image()

test_that("Image class", {
  expect_match(class(img), "magick-image")
})

test_that("Invalid image test", {
  expect_message(load_image("wrong"), "Error:")
})
