# Color palettes inspired by India's natural landscapes

A named list of 30 palettes. Each element is itself a list with:

- `colors` - character vector of hex codes

- `type` - one of `"sequential"`, `"diverging"`, `"qualitative"`

- `inspiration` - short prose description of the source landscape

## Usage

``` r
prakriti_palettes
```

## Format

A named list of length 30.

## Examples

``` r
names(prakriti_palettes)
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
prakriti_palettes$himalaya$colors
#> [1] "#FCFEFF" "#A8D8EA" "#3D9BE9" "#1A5FB4" "#0D3B82" "#051B3E"
```
