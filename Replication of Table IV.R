### Replication of Table IV
#### Load library
library(tidyverse)
library(knitr)
library(kableExtra)
#### Load and clean the data set
real_estate <- read_csv('T6. Real estate-Table 1.csv')
real_estate <- data.frame(real_estate)
real_estate <- subset(real_estate, select = c(2, 3, 4, 6, 7, 8))
real_estate <- real_estate[-c(1, 2, 3, 4, 5, 6), ]
colnames(real_estate) <- c('', 'Asset Pricing Model \n (1)', 'Historical Average \n (2)', 'Standard Deviation (%) \n (3)', 'Share of Idiosyncratic Risk (%) \n (4)', 'Sharpe Ratio \n (5)')
real_estate <- sapply(real_estate, as.character)
real_estate[is.na(real_estate)] <- ""

#### Create table
real_estate |> 
  kable(
    caption = "Table IV 
    Return on Real Estate Portfolio", 
    digits = 1,
    booktabs = TRUE, 
    linesep = ""
  ) |>
  add_header_above(c(" " = 1, "Expected Return (%)" = 2, "Measurement of Risk and Performance" = 3)) |>
  add_header_above(c(" " = 1, "Characteristics of Household Real Estate Portfolio 
                     (Annual Units)" = 5))
