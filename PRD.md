# prakriti - Technical PRD

**Status:** Draft v0.1 **Date:** 2026-05-07 **Target build model:**
Claude Opus 4.6 (`claude-opus-4-6`) **Working name:** `prakriti`
(Sanskrit, “nature”). Fallback names if taken on CRAN: `bharatpalettes`,
`rangbhumi`, `IndiaPalettes`.

------------------------------------------------------------------------

## 1. Overview

`prakriti` is an R package that provides curated color palettes inspired
by India’s natural landscapes - Himalaya, Thar, Kerala backwaters,
Andaman reefs, Spiti cold desert, Kashmir’s chinar in autumn, and more.
It mirrors the API conventions established by `wesanderson`,
`nationalparkcolors`, and `MetBrewer`, and integrates first-class with
`ggplot2`, base graphics, and `scales`.

### 1.1 Why it should exist

- Existing India-themed palette packages are scarce; the few that exist
  are mostly Bollywood/textile-themed, not landscape-themed.
- Palettes are designed by hand from reference photography (not
  auto-extracted), so they are visually balanced and named meaningfully.
- Coverage spans **sequential**, **diverging**, and **qualitative**
  palette types - usable for choropleths, heatmaps, and categorical
  plots alike.

### 1.2 Non-goals

- Not a general-purpose color science library. No CIELAB conversion
  utilities, no perceptual uniformity guarantees beyond best-effort
  hand-tuning.
- Not a Bollywood/cultural-motif palette pack. Scope is strictly
  **natural landscapes / biomes / geological features**.
- Will not auto-extract palettes from user-supplied images.

------------------------------------------------------------------------

## 2. Target users & use cases

| User | Use case |
|----|----|
| Indian data journalists | Choropleth maps of states, district-level data |
| Ecologists / biodiversity researchers | Species distribution plots, habitat maps |
| ggplot2 users wanting non-Western defaults | Replacement for `viridis` / `RColorBrewer` |
| Educators | Teaching cartography & data viz with regionally relevant palettes |

------------------------------------------------------------------------

## 3. Palette catalog (v1.0)

30 palettes total. Each palette is stored as a named character vector of
hex codes in `R/palettes.R`. Type metadata governs default ggplot2 scale
behavior (continuous vs. discrete).

| \#  | Name                | Inspiration                          | Type        | n   |
|-----|---------------------|--------------------------------------|-------------|-----|
| 1   | `himalaya`          | Snow, glacial ice, alpine rock, sky  | sequential  | 6   |
| 2   | `thar`              | Rajasthan dune sunsets               | sequential  | 6   |
| 3   | `backwaters`        | Kerala palm & water                  | sequential  | 5   |
| 4   | `western_ghats`     | Monsoon forest + laterite            | qualitative | 6   |
| 5   | `rann`              | White salt desert + flamingo + dusk  | diverging   | 6   |
| 6   | `valley_of_flowers` | Uttarakhand alpine wildflowers       | qualitative | 7   |
| 7   | `andaman`           | Turquoise reefs + coral + sand       | qualitative | 6   |
| 8   | `nilgiri`           | Blue mountains, tea, mist            | sequential  | 6   |
| 9   | `spiti`             | Cold-desert ochre vs indigo sky      | diverging   | 6   |
| 10  | `kaziranga`         | Grasslands, rhino hide, river silt   | qualitative | 6   |
| 11  | `chilika`           | Lagoon dawn + flamingo flocks        | sequential  | 6   |
| 12  | `mehrangarh`        | Jodhpur blue city at golden hour     | diverging   | 6   |
| 13  | `pangong`           | Ladakh’s color-shifting lake         | sequential  | 6   |
| 14  | `sundarbans`        | Mangrove tidal forest + tiger        | qualitative | 6   |
| 15  | `hampi`             | Pink granite boulders at sunset      | sequential  | 6   |
| 16  | `gulmarg`           | Kashmir snow meadows + deodar        | qualitative | 6   |
| 17  | `loktak`            | Manipur floating phumdi at dawn      | qualitative | 6   |
| 18  | `kaas`              | Maharashtra plateau-of-flowers bloom | qualitative | 7   |
| 19  | `darjeeling`        | Kanchenjunga sunrise over tea        | diverging   | 6   |
| 20  | `chinar`            | Kashmir autumn chinar canopy         | sequential  | 6   |

Hex values are listed in §10 (locked spec).

------------------------------------------------------------------------

## 4. Public API

### 4.1 Core

``` r

prakriti_palette(name, n = NULL, type = c("discrete", "continuous"), direction = 1)
```

- `name`: palette name (string, must match `names(prakriti_palettes)`).
- `n`: number of colors. If `NULL`, returns full palette.
- `type`: `"discrete"` returns first n colors (recycled with warning if
  n \> length); `"continuous"` interpolates via
  [`grDevices::colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html).
- `direction`: `1` or `-1` to reverse.
- Returns: character vector of hex codes, with `attr(., "type")` and
  `attr(., "name")` set.

### 4.2 ggplot2 scales

``` r

scale_color_prakriti(name, ..., discrete = TRUE, direction = 1)
scale_colour_prakriti(...)   # alias
scale_fill_prakriti(name, ..., discrete = TRUE, direction = 1)
```

- For `discrete = TRUE`: wraps
  [`ggplot2::discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  with palette function.
- For `discrete = FALSE`: wraps
  `ggplot2::scale_color_gradientn(colors = ...)`.
- Default `discrete` value depends on palette `type` metadata when not
  supplied.
- Standard ggplot2 scale args (`name`, `breaks`, `labels`, `na.value`,
  `guide`) pass through via `...`.

### 4.3 Display & utility

``` r

prakriti_palettes        # named list, exported as data
display_prakriti(name = NULL)   # plots one or all palettes (base R)
prakriti_names()                # character vector of palette names
prakriti_info(name)             # data.frame: name, type, n, inspiration
```

`display_prakriti(NULL)` shows all palettes in a stacked layout (one row
per palette, similar to
[`RColorBrewer::display.brewer.all`](https://rdrr.io/pkg/RColorBrewer/man/ColorBrewer.html)).

### 4.4 Examples (informal)

``` r

library(prakriti)
library(ggplot2)

ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_prakriti("valley_of_flowers")

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster() +
  scale_fill_prakriti("himalaya", discrete = FALSE)

display_prakriti("rann")
```

------------------------------------------------------------------------

## 5. Package architecture

### 5.1 File layout

    prakriti/
    ├── DESCRIPTION
    ├── NAMESPACE                  # generated by roxygen2
    ├── LICENSE                    # MIT
    ├── LICENSE.md
    ├── README.Rmd / README.md
    ├── NEWS.md
    ├── R/
    │   ├── palettes.R             # prakriti_palettes list (data + metadata)
    │   ├── palette-fn.R           # prakriti_palette()
    │   ├── scales-ggplot.R        # scale_color_*, scale_fill_*
    │   ├── display.R              # display_prakriti()
    │   ├── utils.R                # prakriti_names(), prakriti_info(), helpers
    │   ├── zzz.R                  # .onLoad if needed (none expected)
    │   └── prakriti-package.R     # package-level docs
    ├── data/
    │   └── prakriti_palettes.rda  # exported, lazy-loaded
    ├── data-raw/
    │   └── build_palettes.R       # script that generates the .rda
    ├── man/                       # generated by roxygen2
    ├── tests/
    │   └── testthat/
    │       ├── test-palette-fn.R
    │       ├── test-scales.R
    │       ├── test-data-integrity.R
    │       └── test-display.R
    ├── vignettes/
    │   └── prakriti.Rmd
    ├── inst/
    │   └── CITATION
    └── .github/workflows/
        └── R-CMD-check.yaml

### 5.2 Internal data structure

``` r

prakriti_palettes <- list(
  himalaya = list(
    colors = c("#F4F8FB", "#C9D9E5", "#7FA0BC", "#4A6E91", "#2A3F5F", "#1B2A3E"),
    type   = "sequential",
    inspiration = "Snow peaks, glacial ice, alpine rock, deep sky"
  ),
  ...
)
```

This is generated by `data-raw/build_palettes.R` and saved with
`usethis::use_data(prakriti_palettes, overwrite = TRUE)`.

------------------------------------------------------------------------

## 6. Dependencies

### 6.1 Imports

- `grDevices` (base) - `colorRampPalette`, `rgb`
- `graphics` (base) - for `display_prakriti`
- `ggplot2` (\>= 3.4.0) - `discrete_scale`, `scale_color_gradientn`
- `scales` (\>= 1.2.0) - required for ggplot2 scale plumbing

### 6.2 Suggests

- `testthat` (\>= 3.0.0)
- `knitr`, `rmarkdown` - vignettes
- `dplyr` - README examples only

### 6.3 Avoided

No `tidyverse` aggregate, no `Rcpp`, no system dependencies. Keep
CRAN-friendly.

------------------------------------------------------------------------

## 7. Testing strategy (`testthat` 3e)

| Test file | Coverage |
|----|----|
| `test-data-integrity.R` | All 30 palettes present; all hex codes match `^#[0-9A-Fa-f]{6}$`; type ∈ {sequential, diverging, qualitative}; no duplicate colors within a palette |
| `test-palette-fn.R` | [`prakriti_palette()`](https://orijitghosh.github.io/prakriti/reference/prakriti_palette.md) returns correct length for n; `direction = -1` reverses; `type = "continuous"` interpolates to arbitrary n; errors on unknown name; warns when discrete n \> available |
| `test-scales.R` | Returns a `ScaleDiscrete` / `ScaleContinuous` ggproto object; `scale_color_*` and `scale_colour_*` are identical; passes through `name`, `na.value` |
| `test-display.R` | [`display_prakriti()`](https://orijitghosh.github.io/prakriti/reference/display_prakriti.md) runs without error on all 30 palettes; returns invisibly |

Coverage target: **\>= 90%** measured via `covr::package_coverage()`.

------------------------------------------------------------------------

## 8. Documentation

- Every exported function: roxygen2 with `@param`, `@return`,
  `@examples`, `@export`.
- Package-level docs in `prakriti-package.R` with `_PACKAGE` sentinel.
- Each palette appears in
  [`?prakriti_palettes`](https://orijitghosh.github.io/prakriti/reference/prakriti_palettes.md)
  with its inspiration string.
- README rendered from `README.Rmd` includes a hex-grid display of all
  30 palettes (chunk:
  [`display_prakriti()`](https://orijitghosh.github.io/prakriti/reference/display_prakriti.md)).
- Vignette `vignettes/prakriti.Rmd` walks through: choosing a palette by
  data type, ggplot2 examples for each of
  (qualitative/sequential/diverging), a choropleth example using `sf` +
  Indian state boundaries (data link, not bundled).

------------------------------------------------------------------------

## 9. CRAN readiness checklist

`R CMD check --as-cran` clean: 0 errors, 0 warnings, 0 notes (allow only
the “new submission” note)

DESCRIPTION: Title in title case, no trailing period; Description ≥ 1
full sentence

All examples run in \< 5s; no internet, no writes outside tempdir

`\dontrun{}` only for genuinely interactive code

LICENSE file uses CRAN template

`cran-comments.md` prepared

Tested on: R-release, R-devel, R-oldrel via GitHub Actions
(`r-lib/actions/setup-r@v2`)

`urlchecker::url_check()` passes

`goodpractice::gp()` shows no critical issues

------------------------------------------------------------------------

## 10. Locked palette spec (hex)

    himalaya          : #FCFEFF #A8D8EA #3D9BE9 #1A5FB4 #0D3B82 #051B3E
    thar              : #FFF0A3 #FFB727 #F57D15 #D94701 #8B1A04 #3D0C02
    backwaters        : #D4F5C4 #56C45D #1E8C3A #0C6B2E #054A1E
    western_ghats     : #00A86B #5C4B99 #E35427 #F5C542 #1A8FE3 #C21460
    rann              : #1C0B2B #7B1FA2 #FF4081 #FFFDF5 #F5D7A8 #E8A44A
    valley_of_flowers : #FF1744 #FF9100 #FFEA00 #00E676 #2979FF #D500F9 #1A0A3E
    andaman           : #FFFDE7 #FFB74D #00E5CC #0097A7 #004D5A #FF5252
    nilgiri           : #E0F2E9 #5CC6A0 #228B6B #0B6E54 #064740 #022420
    spiti             : #0A0F3A #2A3590 #CFB97A #E8960C #C25106 #5D1E06
    kaziranga         : #D4A017 #6B4226 #4A4A4A #8DB255 #1B5E20 #BF360C
    chilika           : #FFD6E0 #FF4D8A #C2185B #00838F #00606E #003640
    mehrangarh        : #001F5B #0D47A1 #42A5F5 #FFC107 #FF8F00 #BF360C
    pangong           : #E0F7FA #4DD0E1 #0288D1 #01579B #0D2652 #6D4C28
    sundarbans        : #76FF03 #33691E #1B3A12 #3E2723 #E65100 #FF6D00
    hampi             : #FFE0B2 #FF8A65 #E64A19 #AD1457 #6A1B4D #1A0510
    gulmarg           : #FFFFFF #A5D6A7 #2E7D32 #1B5E20 #5C6BC0 #1A237E
    loktak            : #FFD180 #FF6D00 #43A047 #00695C #004D6B #001A2E
    kaas              : #FF80AB #E91E63 #9C27B0 #4A148C #FFD600 #76FF03 #FFFDE7
    darjeeling        : #FFE0CC #FF7043 #D32F2F #880E4F #1B5E20 #0D3311
    chinar            : #FFECB3 #FFB300 #FF6F00 #D50000 #7F0000 #260000

These are the v1.0 contract. Any change to a palette’s name, hex set, or
type after release is a **breaking change** and must bump major version.

------------------------------------------------------------------------

## 11. Implementation roadmap

### Milestone M1 - scaffold (Opus 4.6, single session)

- `usethis::create_package()`, `use_mit_license()`, `use_testthat(3)`,
  `use_roxygen_md()`
- DESCRIPTION populated
- Empty `R/` files with section headers
- GitHub Actions workflow committed

### Milestone M2 - data + core function

- `data-raw/build_palettes.R` written; `data/prakriti_palettes.rda`
  generated
- [`prakriti_palette()`](https://orijitghosh.github.io/prakriti/reference/prakriti_palette.md)
  implemented + tests
- [`prakriti_names()`](https://orijitghosh.github.io/prakriti/reference/prakriti_names.md),
  [`prakriti_info()`](https://orijitghosh.github.io/prakriti/reference/prakriti_info.md)
  implemented

### Milestone M3 - ggplot2 integration

- `scale_color_prakriti`, `scale_fill_prakriti`, `scale_colour_prakriti`
- Tests via `vdiffr` (Suggests) - optional, only if cheap
- Tests for ggproto class returned

### Milestone M4 - display + docs

- [`display_prakriti()`](https://orijitghosh.github.io/prakriti/reference/display_prakriti.md)
- Roxygen comments completed
- README.Rmd rendered
- Vignette drafted

### Milestone M5 - CRAN polish

- `R CMD check --as-cran` clean
- `cran-comments.md`
- Submit

------------------------------------------------------------------------

## 12. Open questions

1.  **Package name on CRAN** - confirm `prakriti` is unclaimed via
    `available::available("prakriti")` before scaffolding.
2.  **Choropleth vignette** - bundle a small `sf` object of Indian
    states, or link to `geodata::gadm()`? Bundling adds ~200KB; linking
    adds an internet dependency in vignette build. **Lean: link.**
3.  **Color-blind safety** - should we annotate each palette with
    deuteranopia/protanopia simulation results (`colorspace::deutan`)?
    **Lean: yes for sequential & diverging; qualitative palettes flagged
    with `cb_safe = FALSE` where applicable.**
4.  **Hindi/Sanskrit palette aliases** - e.g., `himalaya` ↔︎ `himalaya`,
    `thar` ↔︎ `marusthal`. **Lean: skip in v1; revisit if requested.**

------------------------------------------------------------------------

## 13. License & attribution

MIT License. Palettes are original hand-tuned designs based on reference
photography from public-domain and Creative Commons sources; no
individual photo is reproduced. CITATION file lists the maintainer and a
suggested BibTeX entry.
