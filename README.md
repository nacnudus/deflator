
<!-- README.md is generated from README.Rmd. Please edit that file -->

# deflator

<!-- badges: start -->

<!-- badges: end -->

The {deflator} package is a demonstration of how to create a simple
package. It has one function, `flate_gdp()`, for inflating or deflating
UK prices by GDP. It also has one dataset, `gdp_deflator`, which is a
data frame of year-on-year inflation rates published on
[GOV.UK](https://www.gov.uk/government/statistics/gdp-deflators-at-market-prices-and-money-gdp-march-2019-quarterly-national-accounts).

## Installation

You can install from [github](https://github.com/nacnudus/deflator)
with:

``` r
devtools::install_github("deflator")
```

## Example

Inflate £100 from 2017 prices to 2019 prices, by GDP.

``` r
library(deflator)
flate_gdp(100, 2017, 2019)
#> [1] 103.9335
```

Go back again: deflate £103 from 2019 prices to 2017 prices, by GDP.

``` r
flate_gdp(103.9335, 2019, 2017)
#> [1] 100
```
