
# prakriti <img src="man/figures/logo.gif" align="right" height="180" alt="prakriti logo" />

<!-- badges: start -->
[![R-CMD-check](https://github.com/orijitghosh/prakriti/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/orijitghosh/prakriti/actions/workflows/R-CMD-check.yaml)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

30 color palettes for R, each one pulled from an Indian landscape. Himalayan
ice. Thar dunes at sunset. Flamingos over the Rann. Bioluminescent shores off
Havelock. The autumn chinar canopy in Kashmir.

Palettes come in three types (sequential, diverging, qualitative) and plug
straight into `ggplot2` with `scale_color_prakriti()` and
`scale_fill_prakriti()`. They also work fine with base graphics, `lattice`, or
anything else that takes hex codes.

## Installation

``` r
# Install from GitHub
remotes::install_github("orijitghosh/prakriti")
```

## Quick look

``` r
library(prakriti)

# See what's available
prakriti_names()
prakriti_info()

# Pull a palette as a hex vector
prakriti_palette("thar")
#> [1] "#FFF0A3" "#FFB727" "#F57D15" "#D94701" "#8B1A04" "#3D0C02"

# Interpolate to any length
prakriti_palette("himalaya", n = 50, type = "continuous")
```

## Display all palettes

``` r
display_prakriti()
```

<!-- If you have a rendered image, replace this with:
![All palettes](man/figures/all_palettes.png)
-->

## ggplot2

Qualitative palettes default to discrete scales. Sequential and diverging
palettes default to continuous. Override with `discrete = TRUE/FALSE`.

``` r
library(ggplot2)

# Categorical
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point(size = 3) +
  scale_color_prakriti("valley_of_flowers")

# Continuous fill
ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_prakriti("himalaya")

# Diverging
cor_df <- as.data.frame(as.table(cor(mtcars)))
names(cor_df) <- c("x", "y", "r")

ggplot(cor_df, aes(x, y, fill = r)) +
  geom_tile() +
  scale_fill_prakriti("mehrangarh", limits = c(-1, 1))
```

## The palettes

| | Name | Type | What it looks like |
|--:|:--|:--|:--|
| 1 | `himalaya` | seq | Blinding snow, glacial turquoise, bottomless sky |
| 2 | `thar` | seq | Blazing dunes, saffron sunset, scorched earth |
| 3 | `backwaters` | seq | Luminous palms reflected in emerald water |
| 4 | `western_ghats` | qual | Orchids, laterite, kingfishers, butterflies |
| 5 | `rann` | div | White salt flats, flamingo shock-pink, violet dusk |
| 6 | `valley_of_flowers` | qual | Every alpine wildflower color at once |
| 7 | `andaman` | qual | Electric turquoise, fire coral, bleached sand |
| 8 | `nilgiri` | seq | Blue-green mountains vanishing into mist |
| 9 | `spiti` | div | Indigo night sky crashing into scorched ochre |
| 10 | `kaziranga` | qual | Elephant grass, rhino armor, river mud, tiger flash |
| 11 | `chilika` | seq | Flamingo clouds over pewter lagoon at first light |
| 12 | `mehrangarh` | div | Jodhpur's electric blue under golden hour |
| 13 | `pangong` | seq | Pangong Tso shifting turquoise to ultramarine to ink |
| 14 | `sundarbans` | qual | Neon mangrove, dark tidal roots, tiger-flame |
| 15 | `hampi` | seq | Rose-gold boulders catching sunset fire |
| 16 | `gulmarg` | qual | Blinding snow, vivid meadow, deodar against indigo |
| 17 | `loktak` | qual | Amber dawn, floating green phumdis on deep teal |
| 18 | `kaas` | qual | Explosive wildflower carpets on the plateau |
| 19 | `darjeeling` | div | Kanchenjunga on fire, plunging into tea-estate green |
| 20 | `chinar` | seq | Gold to vermilion to smoldering embers |
| 21 | `ganges` | seq | Silt gold, monsoon green, deep current |
| 22 | `coorg` | qual | Coffee blossoms, red laterite, rain-soaked green |
| 23 | `kutch_textile` | qual | Mirrorwork silver, indigo, turmeric, madder |
| 24 | `jaisalmer` | div | Sandstone fort at noon cooling into blue twilight |
| 25 | `munnar` | seq | Rolling tea carpets, bright flush to deep shade |
| 26 | `ladakh_monastery` | qual | Prayer-flag primaries against barren rock |
| 27 | `chambal_ravines` | seq | Bone white, khaki, terracotta, deep shadow |
| 28 | `nocturn` | seq | Bioluminescent shores, ink sky to starlight |
| 29 | `konkan` | qual | Laterite cliffs, coconut spray, Arabian Sea teal |
| 30 | `corbett` | div | Gold mist, tiger-stripe amber, deep sal canopy |

**seq** = sequential / **div** = diverging / **qual** = qualitative

## API reference

| Function | What it does |
|:--|:--|
| `prakriti_palette(name)` | Returns hex vector. Args: `n`, `type`, `direction` |
| `scale_color_prakriti(name)` | ggplot2 color scale (also `scale_colour_prakriti`) |
| `scale_fill_prakriti(name)` | ggplot2 fill scale |
| `display_prakriti()` | Plot one or all palettes |
| `prakriti_names()` | Character vector of palette names |
| `prakriti_info()` | Data frame with name, type, length, inspiration |

Full docs: `?prakriti_palette` or see the [pkgdown site](https://orijitghosh.github.io/prakriti/).

## Cookbook

The [pkgdown site](https://orijitghosh.github.io/prakriti/) has full articles
with rendered plots:

- **[Getting started](https://orijitghosh.github.io/prakriti/articles/prakriti.html)** -
  installation, discovery, basic ggplot2 usage
- **[Palette gallery](https://orijitghosh.github.io/prakriti/articles/gallery.html)** -
  all 30 palettes as swatches, continuous ramps, and a metadata table
- **[Sequential & diverging recipes](https://orijitghosh.github.io/prakriti/articles/sequential-diverging.html)** -
  heatmaps, contours, calendar tiles, correlation matrices, anomaly maps
- **[Qualitative recipes](https://orijitghosh.github.io/prakriti/articles/qualitative.html)** -
  scatter plots, stacked areas, donut charts, ridgelines, dark-mode density

There's also a [`tutorial.R`](https://github.com/orijitghosh/prakriti/blob/main/tutorial.R) script with all 24 examples in one
file if you prefer running code interactively in RStudio.

## Contributing

Issues and PRs welcome. If you have a landscape in mind for a new palette, open
an issue with reference photos and suggested hex codes.

## License

MIT. See [LICENSE](https://github.com/orijitghosh/prakriti/blob/main/LICENSE.md).
