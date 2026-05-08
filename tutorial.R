# =============================================================================
# prakriti - Complete Visual Tutorial
# -----------------------------------------------------------------------------
# 24 sections, each producing a polished, print-ready visualization.
# Run section-by-section in RStudio (Ctrl+Enter) or source the whole file.
#
# Sections:
#   01  Setup & theme
#   02  Discovery: prakriti_names() & prakriti_info()
#   03  Raw palettes & attributes
#   04  Direction reversal & continuous interpolation
#   05  display_prakriti(): single & grid
#   06  Gallery poster: 6 x 5 swatch grid
#   07  Qualitative scatter (iris) - valley_of_flowers
#   08  Qualitative stacked area chart - kaas
#   09  Qualitative grouped bar - western_ghats
#   10  Sequential heatmap (faithfuld) - himalaya
#   11  Sequential filled contour (volcano) - nilgiri
#   12  Sequential tile time-series - thar
#   13  Diverging signed surface - spiti
#   14  Diverging correlation tile - rann
#   15  Diverging lollipop chart - mehrangarh
#   16  Pie / donut chart - andaman
#   17  Density ridgelines (stacked) - chilika
#   18  Sequential river gradient - ganges
#   19  Qualitative treemap-style - coorg & kutch_textile
#   20  Diverging fort-at-twilight - jaisalmer
#   21  Sequential tea-garden density - munnar
#   22  Qualitative prayer-flags scatter - ladakh_monastery
#   23  Dark-mode bioluminescence - nocturn & chambal_ravines
#   24  Side-by-side comparison: one dataset, three palette types
# =============================================================================


## 01. Setup & theme ---------------------------------------------------------

# devtools::load_all(".")
library(prakriti)
library(ggplot2)

theme_prak <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title       = element_text(face = "bold", size = rel(1.2)),
      plot.subtitle    = element_text(color = "grey30", margin = margin(b = 8)),
      plot.caption     = element_text(color = "grey50", size = rel(0.75),
                                      margin = margin(t = 10)),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(color = "grey92"),
      strip.text       = element_text(face = "bold"),
      legend.position  = "right",
      plot.margin      = margin(12, 12, 12, 12)
    )
}


## 02. Discovery -------------------------------------------------------------

prakriti_names()

info <- prakriti_info()
print(info, right = FALSE)

# Filter by type
info[info$type == "sequential", ]
info[info$type == "diverging", ]
info[info$type == "qualitative", ]


## 03. Raw palettes & attributes ---------------------------------------------

prakriti_palette("himalaya")
prakriti_palette("himalaya", n = 3)
prakriti_palette("valley_of_flowers", n = 4)

p <- prakriti_palette("rann")
cat("Name:", attr(p, "name"), "\n")
cat("Type:", attr(p, "type"), "\n")
cat("Hex: ", paste(p, collapse = " "), "\n")


## 04. Direction reversal & continuous interpolation -------------------------

# Reversed
prakriti_palette("chinar", direction = -1)

# Continuous interpolation to 100 stops
ramp <- prakriti_palette("chinar", n = 100, type = "continuous")
op <- par(mar = c(1, 1, 2.5, 1))
plot(seq_along(ramp), rep(1, length(ramp)),
     col = ramp, pch = 15, cex = 4, axes = FALSE,
     xlab = "", ylab = "",
     main = "chinar - interpolated to 100 stops")
par(op)

# Compare two ramps side by side
ramp_thar  <- prakriti_palette("thar", n = 80, type = "continuous")
ramp_nilg  <- prakriti_palette("nilgiri", n = 80, type = "continuous")
op <- par(mfrow = c(2, 1), mar = c(1, 1, 2, 1))
plot(seq_along(ramp_thar), rep(1, 80), col = ramp_thar,
     pch = 15, cex = 4, axes = FALSE, xlab = "", ylab = "",
     main = "thar - blazing desert gradient")
plot(seq_along(ramp_nilg), rep(1, 80), col = ramp_nilg,
     pch = 15, cex = 4, axes = FALSE, xlab = "", ylab = "",
     main = "nilgiri - misty mountain gradient")
par(op)


## 05. display_prakriti() ----------------------------------------------------

display_prakriti("rann")
display_prakriti("valley_of_flowers")

# Full grid - resize your Plots pane tall before running
display_prakriti()


## 06. Gallery poster: 5 x 4 swatch grid ------------------------------------

gallery_df <- do.call(rbind, lapply(prakriti_names(), function(nm) {
  pal <- prakriti_palettes[[nm]]
  data.frame(
    palette = nm,
    type    = pal$type,
    pos     = seq_along(pal$colors),
    color   = pal$colors,
    stringsAsFactors = FALSE
  )
}))
gallery_df$palette <- factor(gallery_df$palette, levels = prakriti_names())

ggplot(gallery_df, aes(x = pos, y = 1, fill = color)) +
  geom_tile(height = 0.9) +
  scale_fill_identity() +
  facet_wrap(~ palette, ncol = 4, strip.position = "top") +
  labs(
    title    = "prakriti - 30 palettes from India's natural landscapes",
    subtitle = "Sequential | Diverging | Qualitative",
    caption  = "prakriti R package"
  ) +
  theme_void(base_size = 11) +
  theme(
    plot.title    = element_text(face = "bold", hjust = 0, size = rel(1.4),
                                 margin = margin(b = 4)),
    plot.subtitle = element_text(hjust = 0, color = "grey30",
                                 margin = margin(b = 12)),
    plot.caption  = element_text(hjust = 1, color = "grey55"),
    strip.text    = element_text(face = "bold", size = rel(0.85),
                                 margin = margin(b = 2)),
    plot.margin   = margin(16, 16, 16, 16)
  )


## 07. Qualitative scatter - valley_of_flowers --------------------------------

ggplot(iris, aes(Sepal.Length, Petal.Length,
                 color = Species, shape = Species)) +
  geom_point(size = 3.5, alpha = 0.85) +
  scale_color_prakriti("valley_of_flowers") +
  labs(
    title    = "Iris petal vs sepal length",
    subtitle = "Qualitative: valley_of_flowers - alpine wildflower spectrum",
    x = "Sepal length (cm)", y = "Petal length (cm)"
  ) +
  theme_prak()


## 08. Qualitative stacked area - kaas ---------------------------------------

set.seed(42)
months <- rep(month.abb, each = 5)
species <- rep(c("Strobilanthes", "Smithia", "Impatiens",
                 "Senecio", "Eriocaulon"), 12)
area_df <- data.frame(
  month   = factor(months, levels = month.abb),
  species = species,
  cover   = pmax(0, rnorm(60, 40, 20) +
                    rep(c(0, 10, 25, 35, 50, 60, 55, 40, 20, 10, 5, 0),
                        each = 5))
)

ggplot(area_df, aes(month, cover, fill = species, group = species)) +
  geom_area(alpha = 0.88, color = "white", linewidth = 0.3) +
  scale_fill_prakriti("kaas") +
  labs(
    title    = "Seasonal wildflower ground cover on Kaas Plateau",
    subtitle = "Qualitative stacked area: kaas - hot pink to acid green",
    x = NULL, y = "Cover (%)", fill = "Species"
  ) +
  theme_prak() +
  theme(axis.text.x = element_text(angle = 0))


## 09. Qualitative grouped bar - western_ghats --------------------------------

set.seed(7)
bio_df <- data.frame(
  region   = rep(c("Nilgiris", "Coorg", "Agumbe", "Wayanad"), each = 5),
  taxon    = rep(c("Birds", "Butterflies", "Reptiles",
                   "Amphibians", "Mammals"), 4),
  richness = sample(30:180, 20, replace = TRUE)
)
bio_df$region <- factor(bio_df$region,
                        levels = c("Nilgiris", "Coorg", "Agumbe", "Wayanad"))

ggplot(bio_df, aes(region, richness, fill = taxon)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_prakriti("western_ghats") +
  labs(
    title    = "Species richness across Western Ghats sub-regions",
    subtitle = "Qualitative grouped bar: western_ghats - orchid to laterite",
    x = NULL, y = "Number of species", fill = NULL
  ) +
  theme_prak() +
  theme(legend.position = "top")


## 10. Sequential heatmap (Old Faithful) - himalaya --------------------------

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_prakriti("himalaya") +
  labs(
    title    = "Old Faithful eruption density",
    subtitle = "Sequential: himalaya - snow to abyss",
    x = "Waiting time (min)", y = "Eruption duration (min)"
  ) +
  theme_prak() +
  coord_cartesian(expand = FALSE)


## 11. Sequential filled contour - nilgiri ------------------------------------

volcano_df <- expand.grid(x = seq_len(nrow(volcano)),
                          y = seq_len(ncol(volcano)))
volcano_df$z <- as.vector(volcano)

ggplot(volcano_df, aes(x, y, fill = z)) +
  geom_raster(interpolate = TRUE) +
  geom_contour(aes(z = z), color = "white", alpha = 0.3, linewidth = 0.25) +
  scale_fill_prakriti("nilgiri") +
  coord_equal(expand = FALSE) +
  labs(
    title    = "Maungawhau - filled contour",
    subtitle = "Sequential: nilgiri - mist to deep green mountain",
    x = NULL, y = NULL, fill = "Elevation (m)"
  ) +
  theme_prak() +
  theme(axis.text = element_blank(), panel.grid = element_blank())


## 12. Sequential tile time-series - thar ------------------------------------

set.seed(99)
n_days <- 365
ts_df <- data.frame(
  day  = 1:n_days,
  temp = 15 + 20 * sin(2 * pi * (1:n_days - 80) / 365) +
    rnorm(n_days, sd = 2.5)
)
ts_df$week  <- (ts_df$day - 1) %/% 7 + 1
ts_df$wday  <- factor((ts_df$day - 1) %% 7 + 1,
                       labels = c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))

ggplot(ts_df, aes(week, wday, fill = temp)) +
  geom_tile(color = "white", linewidth = 0.3) +
  scale_fill_prakriti("thar") +
  labs(
    title    = "Synthetic daily temperature - Jaisalmer",
    subtitle = "Calendar heatmap: thar - golden dawn to scorched earth",
    x = "Week of year", y = NULL, fill = "Temp (C)"
  ) +
  theme_prak() +
  theme(panel.grid = element_blank())


## 13. Diverging signed surface - spiti --------------------------------------

grid <- expand.grid(
  x = seq(-3, 3, length.out = 150),
  y = seq(-3, 3, length.out = 150)
)
grid$z <- with(grid, sin(x * 1.5) * cos(y * 1.5) + 0.5 * sin(x * y))

ggplot(grid, aes(x, y, fill = z)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_prakriti("spiti", limits = c(-1.5, 1.5)) +
  coord_equal(expand = FALSE) +
  labs(
    title    = "Signed surface: sin(1.5x)cos(1.5y) + 0.5 sin(xy)",
    subtitle = "Diverging: spiti - indigo night sky vs sun-scorched ochre",
    x = NULL, y = NULL
  ) +
  theme_prak() +
  theme(panel.grid = element_blank(), legend.title = element_blank())


## 14. Diverging correlation tile - rann --------------------------------------

cor_mat <- cor(mtcars)
cor_df  <- as.data.frame(as.table(cor_mat))
names(cor_df) <- c("var1", "var2", "rho")

ggplot(cor_df, aes(var1, var2, fill = rho)) +
  geom_tile(color = "white", linewidth = 0.5) +
  geom_text(aes(label = sprintf("%.1f", rho)),
            color = ifelse(abs(cor_df$rho) > 0.65, "white", "grey20"),
            size = 2.8) +
  scale_fill_prakriti("rann", limits = c(-1, 1)) +
  coord_equal(expand = FALSE) +
  labs(
    title    = "mtcars correlation matrix",
    subtitle = "Diverging: rann - violet dusk to flamingo pink to white salt",
    x = NULL, y = NULL, fill = expression(rho)
  ) +
  theme_prak() +
  theme(
    axis.text.x = element_text(angle = 40, hjust = 1),
    panel.grid  = element_blank()
  )


## 15. Diverging lollipop chart - mehrangarh ----------------------------------

data(mtcars)
car_df <- data.frame(
  car  = rownames(mtcars),
  diff = scale(mtcars$mpg)[, 1]
)
car_df <- car_df[order(car_df$diff), ]
car_df$car <- factor(car_df$car, levels = car_df$car)

ggplot(car_df, aes(car, diff, fill = diff)) +
  geom_col(width = 0.7) +
  scale_fill_prakriti("mehrangarh", discrete = FALSE,
                      limits = c(-2.5, 2.5)) +
  coord_flip() +
  geom_hline(yintercept = 0, color = "grey30", linewidth = 0.4) +
  labs(
    title    = "MPG deviation from mean (z-score)",
    subtitle = "Diverging bar: mehrangarh - electric blue to golden amber",
    x = NULL, y = "Standardized MPG"
  ) +
  theme_prak() +
  theme(legend.position = "none",
        axis.text.y = element_text(size = 7))


## 16. Pie / donut chart - andaman -------------------------------------------

pie_df <- data.frame(
  habitat = c("Coral reef", "Mangrove", "Seagrass",
              "Sandy beach", "Rainforest", "Open ocean"),
  pct     = c(28, 18, 12, 10, 22, 10)
)
pie_df$ymax <- cumsum(pie_df$pct)
pie_df$ymin <- c(0, head(pie_df$ymax, -1))
pie_df$mid  <- (pie_df$ymin + pie_df$ymax) / 2
pie_df$label <- paste0(pie_df$habitat, "\n", pie_df$pct, "%")

ggplot(pie_df, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 2.2,
                   fill = habitat)) +
  geom_rect(color = "white", linewidth = 0.8) +
  geom_text(aes(x = 3.1, y = mid, label = label),
            size = 3.2, color = "grey15") +
  scale_fill_prakriti("andaman") +
  coord_polar(theta = "y") +
  xlim(c(0.5, 4.5)) +
  labs(
    title    = "Andaman Islands - habitat composition",
    subtitle = "Donut chart: andaman - turquoise to coral to sand"
  ) +
  theme_void(base_size = 12) +
  theme(
    plot.title    = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, color = "grey35"),
    legend.position = "none",
    plot.margin = margin(10, 10, 10, 10)
  )


## 17. Density ridgelines - chilika ------------------------------------------

# Simulated flamingo flock sizes at Chilika across months
set.seed(123)
ridge_df <- do.call(rbind, lapply(1:6, function(m) {
  n <- 400
  base_mu <- c(120, 200, 350, 280, 160, 90)[m]
  data.frame(
    month = factor(month.abb[m], levels = rev(month.abb[1:6])),
    flock = pmax(0, rnorm(n, base_mu, base_mu * 0.3))
  )
}))

cols_chilika <- prakriti_palette("chilika")

ggplot(ridge_df, aes(flock, month, fill = month, color = month)) +
  geom_violin(scale = "width", width = 0.85, alpha = 0.8,
              trim = TRUE, linewidth = 0.3) +
  scale_fill_manual(values = cols_chilika) +
  scale_color_manual(values = cols_chilika) +
  labs(
    title    = "Flamingo flock size distribution - Chilika Lake",
    subtitle = "Violin ridgeline: chilika - dawn pink to deep lagoon teal",
    x = "Flock size", y = NULL
  ) +
  theme_prak() +
  theme(legend.position = "none",
        panel.grid.major.y = element_blank())


## 18. Sequential river gradient - ganges ------------------------------------

# Simulated river depth cross-section
set.seed(18)
river_df <- expand.grid(
  dist = seq(0, 200, length.out = 100),
  km   = seq(0, 50, length.out = 80)
)
river_df$depth <- with(river_df, {
  center <- 100 + 20 * sin(km / 8)
  width  <- 40 + 10 * cos(km / 12)
  base   <- exp(-((dist - center) / width)^2)
  base * (3 + 0.5 * sin(km / 3)) + rnorm(nrow(river_df), sd = 0.05)
})

ggplot(river_df, aes(dist, km, fill = depth)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_prakriti("ganges") +
  coord_cartesian(expand = FALSE) +
  labs(
    title    = "Simulated river depth cross-section",
    subtitle = "Sequential: ganges - silt gold to deep current",
    x = "Width (m)", y = "Downstream (km)", fill = "Depth (m)"
  ) +
  theme_prak() +
  theme(panel.grid = element_blank())


## 19. Qualitative treemap-style - coorg & kutch_textile ---------------------

# Coorg: horizontal stacked proportions (waffle-style)
crops <- data.frame(
  crop = c("Coffee", "Pepper", "Cardamom", "Rice", "Oranges", "Timber"),
  area = c(38, 22, 12, 15, 8, 5)
)
crops$xmax <- cumsum(crops$area)
crops$xmin <- c(0, head(crops$xmax, -1))
crops$mid  <- (crops$xmin + crops$xmax) / 2

ggplot(crops, aes(xmin = xmin, xmax = xmax, ymin = 0, ymax = 1,
                  fill = crop)) +
  geom_rect(color = "white", linewidth = 0.6) +
  geom_text(aes(x = mid, y = 0.5,
                label = paste0(crop, "\n", area, "%")),
            color = "white", fontface = "bold", size = 3.5) +
  scale_fill_prakriti("coorg") +
  coord_cartesian(expand = FALSE) +
  labs(
    title    = "Coorg district crop composition",
    subtitle = "Qualitative proportion bar: coorg - blossoms, laterite, green"
  ) +
  theme_void(base_size = 12) +
  theme(
    plot.title    = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey30"),
    legend.position = "none",
    plot.margin = margin(12, 12, 12, 12)
  )

# Kutch textile: categorical dot matrix (7-color showcase)
set.seed(77)
kutch_df <- data.frame(
  x      = rep(1:14, 10),
  y      = rep(1:10, each = 14),
  motif  = sample(c("Mirror", "Indigo block", "Turmeric dye",
                     "Madder red", "Teal thread", "Orange applique",
                     "Purple resist"), 140, replace = TRUE)
)

ggplot(kutch_df, aes(x, y, fill = motif)) +
  geom_tile(color = "grey90", linewidth = 0.3) +
  scale_fill_prakriti("kutch_textile") +
  coord_equal(expand = FALSE) +
  labs(
    title    = "Kutch textile motif sampler",
    subtitle = "Qualitative tile grid: kutch_textile - 7 festival colors",
    fill = "Motif"
  ) +
  theme_void(base_size = 11) +
  theme(
    plot.title    = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey30"),
    plot.margin   = margin(12, 12, 12, 12)
  )


## 20. Diverging fort-at-twilight - jaisalmer --------------------------------

# Temperature anomaly map (synthetic grid)
set.seed(20)
anom <- expand.grid(
  lon = seq(68, 78, length.out = 80),
  lat = seq(22, 32, length.out = 80)
)
anom$anomaly <- with(anom, {
  2.5 * sin((lon - 73) / 2) * cos((lat - 27) / 2) +
    rnorm(nrow(anom), sd = 0.3)
})

ggplot(anom, aes(lon, lat, fill = anomaly)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_prakriti("jaisalmer", limits = c(-3, 3)) +
  coord_equal(expand = FALSE) +
  labs(
    title    = "Synthetic temperature anomaly - Rajasthan region",
    subtitle = "Diverging: jaisalmer - blue twilight vs glowing sandstone",
    x = "Longitude", y = "Latitude", fill = "Anomaly (C)"
  ) +
  theme_prak() +
  theme(panel.grid = element_blank())


## 21. Sequential tea-garden density - munnar --------------------------------

# Bivariate density using diamonds subset
ggplot(diamonds[sample(nrow(diamonds), 5000), ],
       aes(carat, price)) +
  geom_bin2d(bins = 40) +
  scale_fill_prakriti("munnar", discrete = FALSE) +
  labs(
    title    = "Diamond carat vs price density",
    subtitle = "Sequential hex bin: munnar - bright flush to deep tea shade",
    x = "Carat", y = "Price (USD)", fill = "Count"
  ) +
  theme_prak()


## 22. Qualitative prayer-flags scatter - ladakh_monastery -------------------

# mpg dataset with 6 car classes
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_jitter(size = 2.8, alpha = 0.8, width = 0.15) +
  scale_color_prakriti("ladakh_monastery") +
  labs(
    title    = "Engine displacement vs highway MPG by vehicle class",
    subtitle = "Qualitative: ladakh_monastery - prayer-flag primaries on white",
    x = "Displacement (L)", y = "Highway MPG", color = "Class"
  ) +
  theme_prak()


## 23. Dark-mode bioluminescence - nocturn & chambal_ravines -----------------

# Nocturn: a dark-background density
set.seed(23)
bio_pts <- data.frame(
  x = c(rnorm(300, 3, 1.2), rnorm(200, 7, 0.8)),
  y = c(rnorm(300, 4, 1.5), rnorm(200, 6, 1.0))
)

ggplot(bio_pts, aes(x, y)) +
  stat_density_2d(aes(fill = after_stat(level)),
                  geom = "polygon", alpha = 0.85) +
  scale_fill_prakriti("nocturn", discrete = FALSE) +
  labs(
    title    = "Bioluminescent density field",
    subtitle = "Sequential: nocturn - ink sky to electric cyan to starlight",
    x = NULL, y = NULL
  ) +
  theme_prak() +
  theme(
    plot.background  = element_rect(fill = "#020A18", color = NA),
    panel.background = element_rect(fill = "#020A18", color = NA),
    panel.grid       = element_blank(),
    text             = element_text(color = "grey80"),
    plot.title       = element_text(color = "white"),
    axis.text        = element_text(color = "grey50"),
    legend.position  = "none"
  )

# Chambal: terrain-style elevation
ggplot(volcano_df, aes(x, y, fill = z)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_prakriti("chambal_ravines") +
  coord_equal(expand = FALSE) +
  labs(
    title    = "Terrain elevation - badlands palette",
    subtitle = "Sequential: chambal_ravines - bone white to deep shadow",
    x = NULL, y = NULL, fill = "Elevation"
  ) +
  theme_prak() +
  theme(axis.text = element_blank(), panel.grid = element_blank())


## 24. Side-by-side: same data, three palette types --------------------------

make_panel <- function(pal_name, pal_label) {
  ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
    geom_raster(interpolate = TRUE) +
    scale_fill_prakriti(pal_name, discrete = FALSE) +
    coord_cartesian(expand = FALSE) +
    labs(title = pal_name, subtitle = pal_label, x = NULL, y = NULL) +
    theme_prak(base_size = 10) +
    theme(legend.position = "none",
          axis.text = element_blank(),
          panel.grid = element_blank())
}

panels <- list(
  make_panel("himalaya",  "sequential"),
  make_panel("spiti",     "diverging"),
  make_panel("kaziranga", "qualitative (forced continuous)")
)

if (requireNamespace("patchwork", quietly = TRUE)) {
  patchwork::wrap_plots(panels, nrow = 1) +
    patchwork::plot_annotation(
      title    = "Same data - three palette types",
      subtitle = "Old Faithful eruption density",
      theme    = theme(
        plot.title    = element_text(face = "bold", size = 14),
        plot.subtitle = element_text(color = "grey30")
      )
    )
} else {
  for (pl in panels) print(pl)
}

# =============================================================================
# End of tutorial.
# Run display_prakriti() to browse all palettes.
# Run ?prakriti_palette for full argument docs.
# =============================================================================
