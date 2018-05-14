library(testthat)

test_that("API test", {
  skip_if_not(curl::has_internet(),
              "No internet connection")
  res <- get_advice()
  expect_is(res, "character")
})

test_that("ID error check: out of range", {
  expect_error(get_advice(0), "Error:")
})

test_that("ID error check: not integer", {
  expect_error(get_advice(10.1), "Error:")
})
