test_that("returns full palette by default", {
  p <- prakriti_palette("himalaya")
  expect_length(p, length(prakriti_palettes$himalaya$colors))
  expect_equal(attr(p, "name"), "himalaya")
  expect_equal(attr(p, "type"), "sequential")
})

test_that("discrete subsetting respects n", {
  p <- prakriti_palette("himalaya", n = 3L)
  expect_length(p, 3L)
  expect_equal(unname(p[1]), prakriti_palettes$himalaya$colors[1])
})

test_that("continuous interpolation hits requested length", {
  p <- prakriti_palette("himalaya", n = 50L, type = "continuous")
  expect_length(p, 50L)
  expect_true(all(grepl("^#[0-9A-F]{6}$", p, ignore.case = TRUE)))
})

test_that("direction = -1 reverses palette", {
  fwd <- prakriti_palette("thar")
  rev_p <- prakriti_palette("thar", direction = -1)
  expect_equal(as.character(rev_p), rev(as.character(fwd)))
})

test_that("recycling warns when discrete n exceeds palette", {
  expect_warning(
    p <- prakriti_palette("backwaters", n = 12L, type = "discrete"),
    "only has"
  )
  expect_length(p, 12L)
})

# --- Error messages are clear and helpful ---

test_that("unknown palette suggests close matches", {
  expect_error(prakriti_palette("himalayas"), "Did you mean.*himalaya")
})

test_that("totally wrong name lists available palettes", {
  expect_error(prakriti_palette("zzz_nope"), "Available:")
})

test_that("non-string name gives clear type error", {
  expect_error(prakriti_palette(42), "single character string.*numeric")
  expect_error(prakriti_palette(TRUE), "single character string.*logical")
})

test_that("NULL name gives helpful error", {
  expect_error(prakriti_palette(NULL), "is required")
})

test_that("invalid direction gives clear error", {
  expect_error(prakriti_palette("himalaya", direction = 0), "1.*or.*-1")
  expect_error(prakriti_palette("himalaya", direction = "up"), "1.*or.*-1")
})

test_that("invalid n gives clear error", {
  expect_error(prakriti_palette("himalaya", n = -1), "positive integer")
  expect_error(prakriti_palette("himalaya", n = "five"), "positive integer")
})
