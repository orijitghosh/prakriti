# Getting started with prakriti

## What is prakriti?

**prakriti** (Sanskrit for *nature*) provides 30 hand-tuned color
palettes inspired by India’s natural landscapes. Each palette is
designed for a specific use case - sequential, diverging, or
qualitative - and integrates directly with `ggplot2`.

``` r

library(prakriti)
library(ggplot2)
```

## Discovering palettes

``` r

prakriti_names()
#>  [1] "himalaya"          "thar"              "backwaters"       
#>  [4] "western_ghats"     "rann"              "valley_of_flowers"
#>  [7] "andaman"           "nilgiri"           "spiti"            
#> [10] "kaziranga"         "chilika"           "mehrangarh"       
#> [13] "pangong"           "sundarbans"        "hampi"            
#> [16] "gulmarg"           "loktak"            "kaas"             
#> [19] "darjeeling"        "chinar"            "ganges"           
#> [22] "coorg"             "kutch_textile"     "jaisalmer"        
#> [25] "munnar"            "ladakh_monastery"  "chambal_ravines"  
#> [28] "nocturn"           "konkan"            "corbett"
```

Get structured metadata with
[`prakriti_info()`](https://orijitghosh.github.io/prakriti/reference/prakriti_info.md):

``` r

prakriti_info()
#>                 name        type n
#> 1           himalaya  sequential 6
#> 2               thar  sequential 6
#> 3         backwaters  sequential 5
#> 4      western_ghats qualitative 6
#> 5               rann   diverging 6
#> 6  valley_of_flowers qualitative 7
#> 7            andaman qualitative 6
#> 8            nilgiri  sequential 6
#> 9              spiti   diverging 6
#> 10         kaziranga qualitative 6
#> 11           chilika  sequential 6
#> 12        mehrangarh   diverging 6
#> 13           pangong  sequential 6
#> 14        sundarbans qualitative 6
#> 15             hampi  sequential 6
#> 16           gulmarg qualitative 6
#> 17            loktak qualitative 6
#> 18              kaas qualitative 7
#> 19        darjeeling   diverging 6
#> 20            chinar  sequential 6
#> 21            ganges  sequential 6
#> 22             coorg qualitative 6
#> 23     kutch_textile qualitative 7
#> 24         jaisalmer   diverging 6
#> 25            munnar  sequential 6
#> 26  ladakh_monastery qualitative 6
#> 27   chambal_ravines  sequential 6
#> 28           nocturn  sequential 6
#> 29            konkan qualitative 6
#> 30           corbett   diverging 6
#>                                                             inspiration
#> 1            Blinding snow, glacial turquoise, bottomless Himalayan sky
#> 2               Blazing Rajasthan dunes, saffron sunset, scorched earth
#> 3                      Luminous Kerala palms reflected in emerald water
#> 4                  Monsoon: orchids, laterite, kingfishers, butterflies
#> 5           Infinite white salt flats, flamingo shock-pink, violet dusk
#> 6         Carpets of alpine wildflowers - every color screaming at once
#> 7                Electric turquoise shallows, fire coral, bleached sand
#> 8                   Blue-green mountains disappearing into monsoon mist
#> 9        Stark indigo night sky crashing into sun-scorched ochre cliffs
#> 10           Golden elephant grass, rhino armor, river mud, tiger flash
#> 11                    Flamingo clouds over pewter lagoon at first light
#> 12             Jodhpur's electric blue houses blazing under golden hour
#> 13            Pangong Tso shifting from turquoise to ultramarine to ink
#> 14           Neon mangrove canopy, dark tidal roots, tiger-flame ambush
#> 15     Rose-gold boulders catching sunset fire, fading to magenta night
#> 16  Blinding snow, vivid meadow, deodar silhouettes against indigo dusk
#> 17                Amber dawn, floating green phumdis on deep teal water
#> 18    Explosive wildflower carpets - hot pink, violet, acid green, gold
#> 19 Kanchenjunga on fire at sunrise, plunging into deep tea-estate green
#> 20     Kashmir's chinar ablaze - gold to vermilion to smoldering embers
#> 21        Sacred river at dawn - silt gold, monsoon green, deep current
#> 22          Coffee blossoms, red laterite, rain-soaked plantation green
#> 23       Rann at festival - mirrorwork silver, indigo, turmeric, madder
#> 24           Sandstone fort glowing at noon, cooling into blue twilight
#> 25                  Rolling tea carpets from bright flush to deep shade
#> 26         Whitewashed walls, prayer-flag primaries against barren rock
#> 27         Eroded badlands - bone white, khaki, terracotta, deep shadow
#> 28             Bioluminescent shores of Havelock - ink sky to starlight
#> 29     Laterite cliffs, coconut spray, Arabian Sea teal, monsoon violet
#> 30         Sal forest dawn - gold mist, tiger-stripe amber, deep canopy
```

## Viewing palettes

Display a single palette:

``` r

display_prakriti("valley_of_flowers")
```

![](prakriti_files/figure-html/display-one-1.png)

Display all 30 palettes at once:

``` r

display_prakriti()
```

![](prakriti_files/figure-html/display-all-1.png)

## Using palettes directly

[`prakriti_palette()`](https://orijitghosh.github.io/prakriti/reference/prakriti_palette.md)
returns a character vector of hex codes:

``` r

prakriti_palette("himalaya")
#> [1] "#FCFEFF" "#A8D8EA" "#3D9BE9" "#1A5FB4" "#0D3B82" "#051B3E"
#> attr(,"name")
#> [1] "himalaya"
#> attr(,"type")
#> [1] "sequential"
prakriti_palette("thar", n = 3)
#> [1] "#FFF0A3" "#FFB727" "#F57D15"
#> attr(,"name")
#> [1] "thar"
#> attr(,"type")
#> [1] "sequential"
```

Reverse with `direction = -1`:

``` r

prakriti_palette("chinar", direction = -1)
#> [1] "#260000" "#7F0000" "#D50000" "#FF6F00" "#FFB300" "#FFECB3"
#> attr(,"name")
#> [1] "chinar"
#> attr(,"type")
#> [1] "sequential"
```

Interpolate to any number of colors with `type = "continuous"`:

``` r

prakriti_palette("nilgiri", n = 12, type = "continuous")
#>  [1] "#E0F2E9" "#A4DEC7" "#68CAA6" "#46B08C" "#2C9574" "#1B8364" "#11755A"
#>  [8] "#0A6650" "#075547" "#05433D" "#03332E" "#022420"
#> attr(,"name")
#> [1] "nilgiri"
#> attr(,"type")
#> [1] "sequential"
```

## ggplot2 integration

### Qualitative palettes (categorical data)

``` r

ggplot(iris, aes(Sepal.Length, Petal.Length,
                 color = Species, shape = Species)) +
  geom_point(size = 3, alpha = 0.85) +
  scale_color_prakriti("valley_of_flowers") +
  labs(title = "Iris dataset - valley_of_flowers palette") +
  theme_minimal()
```

![](prakriti_files/figure-html/scatter-1.png)

### Sequential palettes (continuous data)

``` r

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_prakriti("himalaya") +
  coord_cartesian(expand = FALSE) +
  labs(title = "Old Faithful - himalaya palette") +
  theme_minimal()
```

![](prakriti_files/figure-html/heatmap-1.png)

### Diverging palettes (data with a meaningful midpoint)

``` r

cor_mat <- cor(mtcars[, 1:7])
cor_df  <- as.data.frame(as.table(cor_mat))
names(cor_df) <- c("var1", "var2", "rho")

ggplot(cor_df, aes(var1, var2, fill = rho)) +
  geom_tile(color = "white", linewidth = 0.5) +
  scale_fill_prakriti("mehrangarh", limits = c(-1, 1)) +
  coord_equal() +
  labs(title = "Correlation matrix - mehrangarh palette") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

![](prakriti_files/figure-html/diverging-1.png)

## Overriding defaults

By default, qualitative palettes produce discrete scales and
sequential/diverging produce continuous scales. Override with
`discrete`:

``` r

# Force a sequential palette into discrete mode
ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
  geom_boxplot() +
  scale_fill_prakriti("thar", discrete = TRUE) +
  labs(title = "Forced discrete: thar palette") +
  theme_minimal() +
  theme(legend.position = "none")
```

![](prakriti_files/figure-html/override-1.png)

## Full tutorial

For 24 detailed plot examples covering every palette type - stacked
area, donut charts, calendar heatmaps, correlation tiles, dark-mode
density fields, and more - see `tutorial.R` in the package root.
