test_that("display_prakriti runs without error for each palette", {
  pdf(NULL)
  on.exit(dev.off(), add = TRUE)
  for (nm in prakriti_names()) {
    expect_silent(display_prakriti(nm))
  }
})

test_that("display_prakriti(NULL) runs for full grid", {
  pdf(NULL)
  on.exit(dev.off(), add = TRUE)
  expect_silent(display_prakriti())
})

test_that("show_type = FALSE works", {
  pdf(NULL)
  on.exit(dev.off(), add = TRUE)
  expect_silent(display_prakriti("himalaya", show_type = FALSE))
  expect_silent(display_prakriti(show_type = FALSE))
})

test_that("unknown palette errors with suggestion", {
  expect_error(display_prakriti("himalayas"), "Did you mean")
})

test_that("non-logical show_type errors with clear message", {
  expect_error(display_prakriti(show_type = "sequential"),
               "must be TRUE or FALSE")
  expect_error(display_prakriti(show_type = 1),
               "must be TRUE or FALSE")
})

test_that("prakriti_names returns 20 unique strings", {
  nms <- prakriti_names()
  expect_length(nms, 30L)
  expect_equal(length(unique(nms)), 30L)
})

test_that("prakriti_info returns expected schema", {
  df <- prakriti_info()
  expect_s3_class(df, "data.frame")
  expect_equal(nrow(df), 30L)
  expect_named(df, c("name", "type", "n", "inspiration"))
  expect_type(df$n, "integer")
})

test_that("prakriti_info errors on unknown palette", {
  expect_error(prakriti_info("ganga"), "Unknown palette")
})

test_that("prakriti_info rejects non-character input", {
  expect_error(prakriti_info(123), "character vector")
})
