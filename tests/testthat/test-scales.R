test_that("scale_color_prakriti returns a ggplot2 Scale", {
  s <- scale_color_prakriti("valley_of_flowers")
  expect_s3_class(s, "Scale")
})

test_that("scale_fill_prakriti returns a ggplot2 Scale", {
  s <- scale_fill_prakriti("himalaya")
  expect_s3_class(s, "Scale")
})

test_that("scale_colour_prakriti is identical to scale_color_prakriti", {
  expect_identical(scale_colour_prakriti, scale_color_prakriti)
})

test_that("qualitative palettes default to discrete", {
  s <- scale_color_prakriti("valley_of_flowers")
  expect_true(inherits(s, "ScaleDiscrete"))
})

test_that("sequential palettes default to continuous", {
  s <- scale_color_prakriti("himalaya")
  expect_true(inherits(s, "ScaleContinuous"))
})

test_that("discrete override forces a discrete scale", {
  s <- scale_color_prakriti("himalaya", discrete = TRUE)
  expect_true(inherits(s, "ScaleDiscrete"))
})

test_that("unknown palette errors via scales", {
  expect_error(scale_color_prakriti("nope"), "not found")
})
