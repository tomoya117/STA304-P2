### Replication of Table V
#### Load library
library(tidyverse)
library(knitr)
library(kableExtra)
#### Load and clean data set
private_equity <- read_csv('T7. Private equity-Table 1.csv')
private_equity <- data.frame(private_equity)
private_equity <- subset(private_equity, select = c(2, 3, 4, 5, 6))
private_equity <- private_equity[-c(1, 2, 3, 4, 5, 6), ]
colnames(private_equity) <- c('', 'Expected Return (%) \n (1)', 'Standard Deviation (%) \n (2)', 'Share of Idiosyncratic Risk (%) \n (3)', 'Sharpe Ratio \n (4)')
private_equity <- sapply(private_equity, as.character)
private_equity[is.na(private_equity)] <- ""

#### Create table
private_equity |> 
  kable(
    caption = "Table V 
    Return on Private Equity Portfolio", 
    digits = 1,
    booktabs = TRUE, 
    linesep = ""
  ) |>
  add_header_above(c(" " = 1, "Characteristics of Household Private Equity Portfolio Return
                     (Annual Units)" = 4))