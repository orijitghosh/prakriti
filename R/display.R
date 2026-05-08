#' Display one or all prakriti palettes
#'
#' Renders a base-graphics swatch view of one palette, or a stacked grid of all
#' palettes. Useful for quick visual inspection in the R console / RStudio
#' Plots pane.
#'
#' @param name Character or `NULL`. Name of the palette. If `NULL` (default),
#'   displays all 30 palettes stacked vertically.
#' @param show_type Logical. If `TRUE` (default), includes the palette type
#'   (sequential, diverging, qualitative) in row labels. Must be `TRUE` or
#'   `FALSE` - to filter by type, use `prakriti_info()` instead.
#'
#' @return Invisibly returns `NULL`. Called for its side effect.
#'
#' @examples
#' display_prakriti("rann")
#' \dontrun{
#' display_prakriti()
#' display_prakriti(show_type = FALSE)
#' }
#'
#' @export
display_prakriti <- function(name = NULL, show_type = TRUE) {
  validate_logical(show_type, "show_type")

  if (is.null(name)) {
    nms <- names(prakriti_palettes)
    op <- graphics::par(
      mar = c(0.2, 9, 0.2, 0.2),
      mfrow = c(length(nms), 1L),
      bg = "white"
    )
    on.exit(graphics::par(op), add = TRUE)
    for (nm in nms) display_one(nm, show_type = show_type, title = FALSE)
  } else {
    validate_palette_name(name)
    op <- graphics::par(mar = c(0.5, 1, 2.5, 1), bg = "white")
    on.exit(graphics::par(op), add = TRUE)
    display_one(name, show_type = show_type, title = TRUE)
  }
  invisible(NULL)
}

display_one <- function(nm, show_type = TRUE, title = FALSE) {
  pal <- prakriti_palettes[[nm]]
  cols <- pal$colors
  n <- length(cols)
  graphics::plot.new()
  graphics::plot.window(xlim = c(0, n), ylim = c(0, 1),
                        xaxs = "i", yaxs = "i")
  graphics::rect(0:(n - 1L), 0, 1:n, 1, col = cols, border = NA)

  label <- if (show_type) sprintf("%s  [%s]", nm, pal$type) else nm
  if (title) {
    graphics::title(main = sprintf("%s  -  %s", nm, pal$inspiration),
                    cex.main = 0.95)
  } else {
    graphics::mtext(label, side = 2, las = 1, line = 0.4, cex = 0.75)
  }
}
