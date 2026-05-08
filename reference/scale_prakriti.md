# ggplot2 color and fill scales for prakriti palettes

These functions plug `prakriti` palettes into `ggplot2`. By default the
scale type (discrete vs. continuous) is chosen from the palette's
metadata: qualitative palettes default to discrete; sequential and
diverging palettes default to continuous. Override with `discrete`.

## Usage

``` r
scale_color_prakriti(name, ..., discrete = NULL, direction = 1)

scale_colour_prakriti(name, ..., discrete = NULL, direction = 1)

scale_fill_prakriti(name, ..., discrete = NULL, direction = 1)
```

## Arguments

- name:

  Character. Name of the palette. See
  [`prakriti_names()`](https://orijitghosh.github.io/prakriti/reference/prakriti_names.md).

- ...:

  Additional arguments passed to the underlying ggplot2 scale
  constructor
  ([`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html),
  [`ggplot2::scale_color_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html),
  or
  [`ggplot2::scale_fill_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)).

- discrete:

  Logical or `NULL`. If `NULL` (default), inferred from the palette's
  `type`. Set `TRUE` to force discrete, `FALSE` for continuous.

- direction:

  `1` (default) or `-1` to reverse the palette order.

## Value

A ggplot2 scale object.

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)
ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_prakriti("valley_of_flowers")

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster() +
  scale_fill_prakriti("himalaya")
} # }
```
