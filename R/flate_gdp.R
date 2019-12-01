#' Inflate or Deflate by GDP
#'
#' Given a UK price in GBP, inflates to from the given year to the given year
#' (in the future), or deflates from the given year to the given year (in the
#' past).
#'
#' @param price in pounds (GBP, numeric)
#' @param from financial year of the price (numeric, `2018` is the 2018/19
#'   financial year)
#' @param to financial year to inflate to (integer, `2019` is the 2019/20
#'   financial year)
#' @examples
#' x <- flate_gdp(100, from = 2017, to = 2019)
#' x
#' flate_gdp(x, from = 2019, to = 2017)
#' @export
flate_gdp <- function(price, from, to) {
  stopifnot(is.numeric(price))
  stopifnot(is.numeric(from))
  stopifnot(is.numeric(to))

  inflator <-
    gdp_deflator %>%
    dplyr::filter(financial_year > min(from, to),
                  financial_year <= max(from, to)) %>%
    dplyr::pull(percent_change) %>%
    cumprod() %>%
    tail(1L)

  if (to > from) {
    price * inflator
  } else {
    price / inflator
  }
}
