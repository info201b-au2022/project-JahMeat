# Loading Packages and Dataset

library("tidyverse")
library(readxl)
nba_raw <- read_excel("data/NBA_raw_data2019.xlsx")
View(nba_raw)

# This file creates a scatterplot of the weight and age of NBA players who died below 30. 


# Finding how many people died at or below age 30(Joshua)

table_under_30 <- nba_raw %>%
  filter(death == "Yes") %>%
  filter(ageevent <= 30) %>%
  summarise(ageevent, kilos ) 
 
table_under_30 %>%
  ggplot(aes(ageevent, kilos,
              )) +
  geom_point(size = 3, alpha = 0.5) +
  labs(x = "Age", y = "Kilograms", title = "Weight and Age of NBA Players Who Died Below 30")
  theme_bw() 


  