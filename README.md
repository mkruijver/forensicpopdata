
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Introduction

The **forensicpopdata** package provides allele frequency data for human
genetic markers (STRs) commonly used in forensic genetics and kinship
analysis. Currently two data sets are included:

- NIST 1036 Allele Frequency Data for 29 STR Loci (`NIST1036freqs`)
- UK DNA-17 Allele Frequency Data for 16 STR Loci (`UKDNA17freqs`)

In addition, it is possible to access the
[`STRidER`](https://strider.online/frequencies) database through the
`read_STRidER_xml` function.

## Installation

The **forensicpopdata** package is not yet available from CRAN. You can
install the **forensicpopdata** package using the
[`pak`](https://pak.r-lib.org/) package in R:

``` r
# install.packages("pak")
pak::pak("mkruijver/forensicpopdata")
```

## Usage (data sets)

The `data` function is used to load a data set.

``` r
require(forensicpopdata)
#> Loading required package: forensicpopdata

data(NIST1036freqs)
```

The data set is a named list for each population:

``` r
names(NIST1036freqs)
#> [1] "AfAm"  "Asian" "Cauc"  "Hisp"
```

For each population, a list of frequencies by locus name is available:

``` r
NIST1036freqs$AfAm$TH01
#>           5           6           7           8           9         9.3 
#> 0.004385965 0.131578947 0.407894737 0.195906433 0.159356725 0.096491228 
#>          10 
#> 0.004385965
```

## Usage (STRidER)

The `read_STRidER_xml` function downloads the most recent `STRidER`
database from `https://strider.online/`.

``` r
freqs <- read_STRidER_xml()
```

The data set is a named list for each population:

``` r
names(freqs)
#>  [1] "Entire Database"        "Africa"                 "America"               
#>  [4] "Asia"                   "Europe"                 "AUSTRIA"               
#>  [7] "BELGIUM"                "BOSNIA AND HERZEGOWINA" "CZECH REPUBLIC"        
#> [10] "DENMARK"                "DOMINICAN REPUBLIC"     "FINLAND"               
#> [13] "FRANCE"                 "GERMANY"                "GREECE"                
#> [16] "HUNGARY"                "IRELAND"                "KENYA"                 
#> [19] "MONTENEGRO"             "NORWAY"                 "POLAND"                
#> [22] "SAUDI ARABIA"           "SLOVAKIA"               "SLOVENIA"              
#> [25] "SOUTH AFRICA"           "SPAIN"                  "SWEDEN"                
#> [28] "SWITZERLAND"            "THAILAND"               "VIETNAM"
```

For each population, a list of frequencies by locus name is available:

``` r
freqs$`Entire Database`$TH01
#>         8.3          10           7         7.3           8        10.3 
#> 3.58038e-04 2.72467e-02 2.26924e-01 3.58038e-05 1.13426e-01 3.58038e-05 
#>         9.3          12           6          11           9           4 
#> 2.01862e-01 1.43215e-04 1.93305e-01 6.44468e-04 2.35231e-01 3.58038e-05 
#>           5        13.3 
#> 7.16076e-04 3.58038e-05
```
