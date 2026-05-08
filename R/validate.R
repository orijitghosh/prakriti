# Shared input validation helpers (not exported)

validate_palette_name <- function(name, arg_name = "name") {
  if (missing(name) || is.null(name)) {
    stop(
      "`", arg_name, "` is required. ",
      "Available palettes: ", paste(names(prakriti_palettes), collapse = ", "),
      call. = FALSE
    )
  }
  if (!is.character(name) || length(name) != 1L || is.na(name)) {
    stop(
      "`", arg_name, "` must be a single character string, not ",
      class(name)[1], ".",
      call. = FALSE
    )
  }
  if (!name %in% names(prakriti_palettes)) {
    candidates <- agrep(name, names(prakriti_palettes), value = TRUE,
                        max.distance = 0.3)
    hint <- if (length(candidates)) {
      paste0(" Did you mean: ", paste(candidates, collapse = ", "), "?")
    } else {
      paste0(" Available: ", paste(names(prakriti_palettes), collapse = ", "))
    }
    stop("Palette '", name, "' not found.", hint, call. = FALSE)
  }
  invisible(name)
}

validate_direction <- function(direction) {
  if (!is.numeric(direction) || length(direction) != 1L ||
      !direction %in% c(-1, 1)) {
    stop(
      "`direction` must be 1 (forward) or -1 (reversed), not `",
      deparse(direction), "`.",
      call. = FALSE
    )
  }
  invisible(direction)
}

validate_n <- function(n) {
  if (!is.null(n)) {
    if (!is.numeric(n) || length(n) != 1L || is.na(n) || n < 1L) {
      stop("`n` must be a positive integer (>= 1), not `",
           deparse(n), "`.", call. = FALSE)
    }
  }
  invisible(n)
}

validate_logical <- function(x, arg_name) {
  if (!is.logical(x) || length(x) != 1L || is.na(x)) {
    stop(
      "`", arg_name, "` must be TRUE or FALSE, not `",
      deparse(x), "`.",
      call. = FALSE
    )
  }
  invisible(x)
}
