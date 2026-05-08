# prakriti

> Color palettes inspired by India’s natural landscapes.

`prakriti` (Sanskrit, *nature*) is an R package providing 30 hand-tuned
color palettes drawn from India’s biomes and geography - Himalayan snow,
Thar dunes, Kerala backwaters, Andaman reefs, Spiti’s cold desert,
Kashmir’s autumn chinar, and more. Palettes ship in three flavors -
sequential, diverging, qualitative - with first-class `ggplot2`
integration.

## Install

``` r

# remotes::install_github("orijitghosh/prakriti")
devtools::load_all(".")  # during development
```

## Quickstart

``` r

library(prakriti)
library(ggplot2)

# Discrete (qualitative)
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  scale_color_prakriti("valley_of_flowers") +
  theme_minimal()

# Continuous (sequential)
ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster() +
  scale_fill_prakriti("himalaya") +
  theme_minimal()

# Inspect what's available
prakriti_info()
display_prakriti()
```

## The 30 palettes

| Name | Type | Inspiration |
|----|----|----|
| `himalaya` | sequential | Snow peaks, glacial ice, alpine rock, deep sky |
| `thar` | sequential | Rajasthan dune sunsets |
| `backwaters` | sequential | Kerala palm canopy and still water |
| `western_ghats` | qualitative | Monsoon evergreen forest with laterite earth |
| `rann` | diverging | White salt desert, flamingos, dusk |
| `valley_of_flowers` | qualitative | Uttarakhand alpine wildflower meadows |
| `andaman` | qualitative | Turquoise reefs, coral, white sand |
| `nilgiri` | sequential | Blue mountains, tea estates, mist |
| `spiti` | diverging | Cold-desert ochre cliffs against indigo sky |
| `kaziranga` | qualitative | Grasslands, rhino hide, Brahmaputra silt |
| `chilika` | sequential | Lagoon dawn with flamingo flocks |
| `mehrangarh` | diverging | Jodhpur blue city at golden hour |
| `pangong` | sequential | Ladakh’s color-shifting high-altitude lake |
| `sundarbans` | qualitative | Mangrove tidal forest and tiger |
| `hampi` | sequential | Pink granite boulders at sunset |
| `gulmarg` | qualitative | Kashmir snow meadows and deodar |
| `loktak` | qualitative | Manipur’s floating phumdi islands at dawn |
| `kaas` | qualitative | Maharashtra’s plateau-of-flowers seasonal bloom |
| `darjeeling` | diverging | Kanchenjunga sunrise over tea estates |
| `chinar` | sequential | Kashmir’s autumn chinar canopy |
| `ganges` | sequential | Sacred river at dawn - silt gold, monsoon green, deep current |
| `coorg` | qualitative | Coffee blossoms, red laterite, rain-soaked plantation green |
| `kutch_textile` | qualitative | Rann at festival - mirrorwork silver, indigo, turmeric, madder |
| `jaisalmer` | diverging | Sandstone fort glowing at noon, cooling into blue twilight |
| `munnar` | sequential | Rolling tea carpets from bright flush to deep shade |
| `ladakh_monastery` | qualitative | Whitewashed walls, prayer-flag primaries against barren rock |
| `chambal_ravines` | sequential | Eroded badlands - bone white, khaki, terracotta, deep shadow |
| `nocturn` | sequential | Bioluminescent shores of Havelock - ink sky to starlight |
| `konkan` | qualitative | Laterite cliffs, coconut spray, Arabian Sea teal, monsoon violet |
| `corbett` | diverging | Sal forest dawn - gold mist, tiger-stripe amber, deep canopy |

## API

``` r

prakriti_palette(name, n = NULL, type = "discrete", direction = 1)
scale_color_prakriti(name, ..., discrete = NULL, direction = 1)
scale_fill_prakriti(name, ..., discrete = NULL, direction = 1)
display_prakriti(name = NULL)
prakriti_names()
prakriti_info(name = NULL)
```

See [`tutorial.R`](https://orijitghosh.github.io/prakriti/tutorial.R)
for a full visual walkthrough.

## License

MIT
