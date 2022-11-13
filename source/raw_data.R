# Loading Packages and Dataset

library("tidyverse")
library(readxl)
nba_raw <- read_excel("data/NBA_raw_data2019.xlsx")
View(nba_raw)

# Code finding how many people born in 1990 or after have died in the NBA(Joshua)

death_since_1990 <- nba_raw %>%
  group_by(birthdate, kilos) %>%
  filter(birthdate > '1990-01-01') %>%
  filter(death == "Yes") %>%
  summarize(death) %>%
  nrow
  

# finding age of death of average player who has died since the NBA started and 2019(Joshua)

average_age_death <- nba_raw %>%
  filter(death == "Yes") %>%
  summarise(mean(ageevent)) %>%
  pull()
