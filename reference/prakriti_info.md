# Tabular metadata for prakriti palettes

Returns a data frame with one row per palette describing its name, type,
length, and natural-landscape inspiration.

## Usage

``` r
prakriti_info(name = NULL)
```

## Arguments

- name:

  Character or `NULL`. If supplied, restricts the result to the named
  palette(s). If `NULL` (default), returns all palettes.

## Value

A data frame with columns `name`, `type`, `n`, `inspiration`.

## Examples

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
prakriti_info("himalaya")
#>       name       type n
#> 1 himalaya sequential 6
#>                                                  inspiration
#> 1 Blinding snow, glacial turquoise, bottomless Himalayan sky
```
