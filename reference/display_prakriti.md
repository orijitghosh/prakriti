# Display one or all prakriti palettes

Renders a base-graphics swatch view of one palette, or a stacked grid of
all palettes. Useful for quick visual inspection in the R console /
RStudio Plots pane.

## Usage

``` r
display_prakriti(name = NULL, show_type = TRUE)
```

## Arguments

- name:

  Character or `NULL`. Name of the palette. If `NULL` (default),
  displays all 30 palettes stacked vertically.

- show_type:

  Logical. If `TRUE` (default), includes the palette type (sequential,
  diverging, qualitative) in row labels. Must be `TRUE` or `FALSE` - to
  filter by type, use
  [`prakriti_info()`](https://orijitghosh.github.io/prakriti/reference/prakriti_info.md)
  instead.

## Value

Invisibly returns `NULL`. Called for its side effect.

## Examples

``` r
display_prakriti("rann")

if (FALSE) { # \dontrun{
display_prakriti()
display_prakriti(show_type = FALSE)
} # }
```
