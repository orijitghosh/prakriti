#' Color palettes inspired by India's natural landscapes
#'
#' A named list of 30 palettes. Each element is itself a list with:
#' * `colors` - character vector of hex codes
#' * `type` - one of `"sequential"`, `"diverging"`, `"qualitative"`
#' * `inspiration` - short prose description of the source landscape
#'
#' @format A named list of length 30.
#' @examples
#' names(prakriti_palettes)
#' prakriti_palettes$himalaya$colors
#' @export
prakriti_palettes <- list(

  himalaya = list(
    colors = c("#FCFEFF", "#A8D8EA", "#3D9BE9", "#1A5FB4", "#0D3B82", "#051B3E"),
    type = "sequential",
    inspiration = "Blinding snow, glacial turquoise, bottomless Himalayan sky"
  ),

  thar = list(
    colors = c("#FFF0A3", "#FFB727", "#F57D15", "#D94701", "#8B1A04", "#3D0C02"),
    type = "sequential",
    inspiration = "Blazing Rajasthan dunes, saffron sunset, scorched earth"
  ),

  backwaters = list(
    colors = c("#D4F5C4", "#56C45D", "#1E8C3A", "#0C6B2E", "#054A1E"),
    type = "sequential",
    inspiration = "Luminous Kerala palms reflected in emerald water"
  ),

  western_ghats = list(
    colors = c("#00A86B", "#5C4B99", "#E35427", "#F5C542", "#1A8FE3", "#C21460"),
    type = "qualitative",
    inspiration = "Monsoon: orchids, laterite, kingfishers, butterflies"
  ),

  rann = list(
    colors = c("#1C0B2B", "#7B1FA2", "#FF4081", "#FFFDF5", "#F5D7A8", "#E8A44A"),
    type = "diverging",
    inspiration = "Infinite white salt flats, flamingo shock-pink, violet dusk"
  ),

  valley_of_flowers = list(
    colors = c("#FF1744", "#FF9100", "#FFEA00", "#00E676", "#2979FF", "#D500F9", "#1A0A3E"),
    type = "qualitative",
    inspiration = "Carpets of alpine wildflowers - every color screaming at once"
  ),

  andaman = list(
    colors = c("#FFFDE7", "#FFB74D", "#00E5CC", "#0097A7", "#004D5A", "#FF5252"),
    type = "qualitative",
    inspiration = "Electric turquoise shallows, fire coral, bleached sand"
  ),

  nilgiri = list(
    colors = c("#E0F2E9", "#5CC6A0", "#228B6B", "#0B6E54", "#064740", "#022420"),
    type = "sequential",
    inspiration = "Blue-green mountains disappearing into monsoon mist"
  ),

  spiti = list(
    colors = c("#0A0F3A", "#2A3590", "#CFB97A", "#E8960C", "#C25106", "#5D1E06"),
    type = "diverging",
    inspiration = "Stark indigo night sky crashing into sun-scorched ochre cliffs"
  ),

  kaziranga = list(
    colors = c("#D4A017", "#6B4226", "#4A4A4A", "#8DB255", "#1B5E20", "#BF360C"),
    type = "qualitative",
    inspiration = "Golden elephant grass, rhino armor, river mud, tiger flash"
  ),

  chilika = list(
    colors = c("#FFD6E0", "#FF4D8A", "#C2185B", "#00838F", "#00606E", "#003640"),
    type = "sequential",
    inspiration = "Flamingo clouds over pewter lagoon at first light"
  ),

  mehrangarh = list(
    colors = c("#001F5B", "#0D47A1", "#42A5F5", "#FFC107", "#FF8F00", "#BF360C"),
    type = "diverging",
    inspiration = "Jodhpur's electric blue houses blazing under golden hour"
  ),

  pangong = list(
    colors = c("#E0F7FA", "#4DD0E1", "#0288D1", "#01579B", "#0D2652", "#6D4C28"),
    type = "sequential",
    inspiration = "Pangong Tso shifting from turquoise to ultramarine to ink"
  ),

  sundarbans = list(
    colors = c("#76FF03", "#33691E", "#1B3A12", "#3E2723", "#E65100", "#FF6D00"),
    type = "qualitative",
    inspiration = "Neon mangrove canopy, dark tidal roots, tiger-flame ambush"
  ),

  hampi = list(
    colors = c("#FFE0B2", "#FF8A65", "#E64A19", "#AD1457", "#6A1B4D", "#1A0510"),
    type = "sequential",
    inspiration = "Rose-gold boulders catching sunset fire, fading to magenta night"
  ),

  gulmarg = list(
    colors = c("#FFFFFF", "#A5D6A7", "#2E7D32", "#1B5E20", "#5C6BC0", "#1A237E"),
    type = "qualitative",
    inspiration = "Blinding snow, vivid meadow, deodar silhouettes against indigo dusk"
  ),

  loktak = list(
    colors = c("#FFD180", "#FF6D00", "#43A047", "#00695C", "#004D6B", "#001A2E"),
    type = "qualitative",
    inspiration = "Amber dawn, floating green phumdis on deep teal water"
  ),

  kaas = list(
    colors = c("#FF80AB", "#E91E63", "#9C27B0", "#4A148C", "#FFD600", "#76FF03", "#FFFDE7"),
    type = "qualitative",
    inspiration = "Explosive wildflower carpets - hot pink, violet, acid green, gold"
  ),

  darjeeling = list(
    colors = c("#FFE0CC", "#FF7043", "#D32F2F", "#880E4F", "#1B5E20", "#0D3311"),
    type = "diverging",
    inspiration = "Kanchenjunga on fire at sunrise, plunging into deep tea-estate green"
  ),

  chinar = list(
    colors = c("#FFECB3", "#FFB300", "#FF6F00", "#D50000", "#7F0000", "#260000"),
    type = "sequential",
    inspiration = "Kashmir's chinar ablaze - gold to vermilion to smoldering embers"
  ),

  ganges = list(
    colors = c("#F5E6B8", "#D4A44C", "#8B9A6B", "#4A7C59", "#2D5A4A", "#0F2B22"),
    type = "sequential",
    inspiration = "Sacred river at dawn - silt gold, monsoon green, deep current"
  ),

  coorg = list(
    colors = c("#FFFFFF", "#FFB7C5", "#C62828", "#33691E", "#1B3A12", "#3E2723"),
    type = "qualitative",
    inspiration = "Coffee blossoms, red laterite, rain-soaked plantation green"
  ),

  kutch_textile = list(
    colors = c("#E8E8E8", "#1A237E", "#F9A825", "#AD1457", "#00695C", "#FF6D00", "#4A148C"),
    type = "qualitative",
    inspiration = "Rann at festival - mirrorwork silver, indigo, turmeric, madder"
  ),

  jaisalmer = list(
    colors = c("#0D1B2A", "#1B3A5C", "#FFE082", "#FFB300", "#E65100", "#BF360C"),
    type = "diverging",
    inspiration = "Sandstone fort glowing at noon, cooling into blue twilight"
  ),

  munnar = list(
    colors = c("#E8F5E9", "#81C784", "#43A047", "#2E7D32", "#1B5E20", "#0A3A10"),
    type = "sequential",
    inspiration = "Rolling tea carpets from bright flush to deep shade"
  ),

  ladakh_monastery = list(
    colors = c("#FAFAFA", "#D32F2F", "#1565C0", "#F9A825", "#2E7D32", "#4E342E"),
    type = "qualitative",
    inspiration = "Whitewashed walls, prayer-flag primaries against barren rock"
  ),

  chambal_ravines = list(
    colors = c("#F5F0E1", "#D9C6A5", "#B8956A", "#8D5B3E", "#5D3222", "#1A0E08"),
    type = "sequential",
    inspiration = "Eroded badlands - bone white, khaki, terracotta, deep shadow"
  ),

  nocturn = list(
    colors = c("#020A18", "#0A1E40", "#0E4D6E", "#00E5FF", "#76FF03", "#F5F5F5"),
    type = "sequential",
    inspiration = "Bioluminescent shores of Havelock - ink sky to starlight"
  ),

  konkan = list(
    colors = c("#BF360C", "#FF8A65", "#00BFA5", "#01579B", "#7B1FA2", "#FDD835"),
    type = "qualitative",
    inspiration = "Laterite cliffs, coconut spray, Arabian Sea teal, monsoon violet"
  ),

  corbett = list(
    colors = c("#FFFDE7", "#FFD54F", "#FF8F00", "#BF360C", "#2E7D32", "#0D3311"),
    type = "diverging",
    inspiration = "Sal forest dawn - gold mist, tiger-stripe amber, deep canopy"
  )
)
