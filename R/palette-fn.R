#' Build a color palette from a `prakriti` palette
#'
#' Returns a character vector of hex codes drawn from one of the named palettes
#' in [prakriti_palettes]. Supports both discrete subsetting and continuous
#' interpolation via [grDevices::colorRampPalette()].
#'
#' @param name Character. Name of the palette. See [prakriti_names()].
#' @param n Integer. Number of colors to return. If `NULL` (default), returns
#'   the full base palette unchanged.
#' @param type Either `"discrete"` (subset / recycle base colors) or
#'   `"continuous"` (interpolate smoothly across the base colors).
#' @param direction `1` (default) or `-1` to reverse the palette order.
#'
#' @return A character vector of hex codes with attributes `name` and `type`.
#'
#' @examples
#' prakriti_palette("himalaya")
#' prakriti_palette("himalaya", n = 3)
#' prakriti_palette("himalaya", n = 50, type = "continuous")
#' prakriti_palette("thar", direction = -1)
#'
#' @export
prakriti_palette <- function(name,
                             n = NULL,
                             type = c("discrete", "continuous"),
                             direction = 1) {
  validate_palette_name(name)
  validate_direction(direction)
  validate_n(n)
  type <- match.arg(type)

  pal <- prakriti_palettes[[name]]
  base_colors <- pal$colors
  if (direction == -1L) base_colors <- rev(base_colors)
  if (is.null(n)) n <- length(base_colors)

  out <- if (type == "continuous") {
    grDevices::colorRampPalette(base_colors)(n)
  } else {
    if (n > length(base_colors)) {
      warning(
        "Requested ", n, " colors but '", name, "' only has ",
        length(base_colors), "; recycling. ",
        "Use type = \"continuous\" for smooth interpolation.",
        call. = FALSE
      )
      base_colors[((seq_len(n) - 1L) %% length(base_colors)) + 1L]
    } else {
      base_colors[seq_len(n)]
    }
  }

  attr(out, "name") <- name
  attr(out, "type") <- pal$type
  out
}
