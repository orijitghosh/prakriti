#' Names of available prakriti palettes
#'
#' @return A character vector of palette names.
#' @examples
#' prakriti_names()
#' @export
prakriti_names <- function() {
  names(prakriti_palettes)
}

#' Tabular metadata for prakriti palettes
#'
#' Returns a data frame with one row per palette describing its name, type,
#' length, and natural-landscape inspiration.
#'
#' @param name Character or `NULL`. If supplied, restricts the result to the
#'   named palette(s). If `NULL` (default), returns all palettes.
#' @return A data frame with columns `name`, `type`, `n`, `inspiration`.
#' @examples
#' prakriti_info()
#' prakriti_info("himalaya")
#' @export
prakriti_info <- function(name = NULL) {
  nms <- if (is.null(name)) names(prakriti_palettes) else name
  if (!is.character(nms)) {
    stop("`name` must be a character vector or NULL.", call. = FALSE)
  }
  bad <- setdiff(nms, names(prakriti_palettes))
  if (length(bad)) {
    stop(
      "Unknown palette(s): ", paste(bad, collapse = ", "), ". ",
      "Use prakriti_names() to see available palettes.",
      call. = FALSE
    )
  }
  data.frame(
    name        = nms,
    type        = vapply(nms, function(x) prakriti_palettes[[x]]$type,
                         character(1)),
    n           = vapply(nms, function(x) length(prakriti_palettes[[x]]$colors),
                         integer(1)),
    inspiration = vapply(nms, function(x) prakriti_palettes[[x]]$inspiration,
                         character(1)),
    stringsAsFactors = FALSE,
    row.names = NULL
  )
}
