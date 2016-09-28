context("assert")


test_that("assert works", {
  expect_equal(assert(2 == 2, "ok"), NULL)
  expect_error(assert(2 == 3, "ok"), NULL)
})
