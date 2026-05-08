test_that("all 30 palettes are present", {
  expect_length(prakriti_palettes, 30L)
})

test_that("every palette has required fields", {
  for (nm in names(prakriti_palettes)) {
    pal <- prakriti_palettes[[nm]]
    expect_named(pal, c("colors", "type", "inspiration"),
                 info = nm)
    expect_type(pal$colors, "character")
    expect_true(length(pal$colors) >= 5L, info = nm)
    expect_true(pal$type %in% c("sequential", "diverging", "qualitative"),
                info = nm)
    expect_true(nchar(pal$inspiration) > 0L, info = nm)
  }
})

test_that("all hex codes are well-formed", {
  hex_re <- "^#[0-9A-Fa-f]{6}$"
  for (nm in names(prakriti_palettes)) {
    expect_true(all(grepl(hex_re, prakriti_palettes[[nm]]$colors)),
                info = nm)
  }
})

test_that("no palette has duplicate colors", {
  for (nm in names(prakriti_palettes)) {
    cols <- prakriti_palettes[[nm]]$colors
    expect_equal(length(cols), length(unique(cols)), info = nm)
  }
})

test_that("palette names are unique and lowercase_snake", {
  nms <- names(prakriti_palettes)
  expect_equal(length(nms), length(unique(nms)))
  expect_true(all(grepl("^[a-z][a-z_]*$", nms)))
})
