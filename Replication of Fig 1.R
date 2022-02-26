### Replication of Figure 1
#### Load library
library(tidyverse)

#### Load and clean data set
portfolio <- read_csv('input_distributions_NW-Table 1.csv')
portfolio <- data.frame(portfolio)
portfolio <- portfolio[c(1, 2, 3, 4, 5, 6, 7), ]
colnames(portfolio) <- c('Number of households', 'Real estate wealth', 'Financial wealth', 'Private equity', 'Pension wealth', 'Debt', 'Total net wealth', 'Wealth Level')

#### Create data set for graph
portfolio <- 
  portfolio |>
  gather(`Wealth Distribution`, Percentage, 2:7)
portfolio$Percentage <- format(round(as.numeric(as.character(portfolio$Percentage)), 2), nsmall = 2)

#### Create graph
portfolio |> 
  ggplot(aes(x = `Wealth Level`, y = Percentage, fill = `Wealth Distribution`)) +
  geom_col(position = "dodge", alpha = 0.8) +
  theme_minimal() + 
  labs(x = "Wealth Rank Intervals", y = "Percentage", title = "Wealth Concentration in Sweden")