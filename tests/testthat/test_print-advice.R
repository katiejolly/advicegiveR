library(testthat)

img <- load_image()
adv <- get_advice()

test_that("Check data types", {
  expect_error(print_advice(img, not_string))
  expect_error(print_advice(not_image, adv))
})

