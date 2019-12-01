## code to prepare `gdp_deflator` dataset goes here
library(dplyr)
library(stringr)
library(readr)
library(fs)

temp_file <- fs::file_temp()

download.file("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/835509/GDP_Deflators_Qtrly_National_Accounts_September_2019_update.xlsx",
              temp_file)

gdp_deflator <-
  read_excel(
    temp_file,
    range = "B9:D76",
    col_names = c(
      "financial_year",
      "skip",
      "percent_change"
    ),
    col_types = c("text", "skip", "numeric")
  ) %>%
  mutate(financial_year = as.integer(str_sub(financial_year, 1L, 4L)),
         percent_change = percent_change / 100 + 1)

usethis::use_data(gdp_deflator, overwrite = TRUE)
