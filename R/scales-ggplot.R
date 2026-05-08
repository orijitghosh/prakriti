#' ggplot2 color and fill scales for prakriti palettes
#'
#' These functions plug `prakriti` palettes into `ggplot2`. By default the
#' scale type (discrete vs. continuous) is chosen from the palette's metadata:
#' qualitative palettes default to discrete; sequential and diverging palettes
#' default to continuous. Override with `discrete`.
#'
#' @param name Character. Name of the palette. See [prakriti_names()].
#' @param ... Additional arguments passed to the underlying ggplot2 scale
#'   constructor ([ggplot2::discrete_scale()],
#'   [ggplot2::scale_color_gradientn()], or
#'   [ggplot2::scale_fill_gradientn()]).
#' @param discrete Logical or `NULL`. If `NULL` (default), inferred from the
#'   palette's `type`. Set `TRUE` to force discrete, `FALSE` for continuous.
#' @param direction `1` (default) or `-1` to reverse the palette order.
#'
#' @return A ggplot2 scale object.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_color_prakriti("valley_of_flowers")
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_raster() +
#'   scale_fill_prakriti("himalaya")
#' }
#'
#' @name scale_prakriti
NULL

#' @rdname scale_prakriti
#' @export
scale_color_prakriti <- function(name, ..., discrete = NULL, direction = 1) {
  build_prakriti_scale(name, aesthetic = "colour", ...,
                       discrete = discrete, direction = direction)
}

#' @rdname scale_prakriti
#' @export
scale_colour_prakriti <- scale_color_prakriti

#' @rdname scale_prakriti
#' @export
scale_fill_prakriti <- function(name, ..., discrete = NULL, direction = 1) {
  build_prakriti_scale(name, aesthetic = "fill", ...,
                       discrete = discrete, direction = direction)
}

# Internal -------------------------------------------------------------------

build_prakriti_scale <- function(name, aesthetic, ..., discrete, direction) {
  validate_palette_name(name)
  validate_direction(direction)
  if (!is.null(discrete)) validate_logical(discrete, "discrete")

  pal_meta <- prakriti_palettes[[name]]
  if (is.null(discrete)) {
    discrete <- identical(pal_meta$type, "qualitative")
  }

  if (discrete) {
    ggplot2::discrete_scale(
      aesthetics = aesthetic,
      palette = function(n) {
        prakriti_palette(name, n = n, type = "discrete",
                         direction = direction)
      },
      ...
    )
  } else {
    cols <- prakriti_palette(name, n = 256L, type = "continuous",
                             direction = direction)
    if (aesthetic == "colour") {
      ggplot2::scale_color_gradientn(colours = cols, ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = cols, ...)
    }
  }
}
