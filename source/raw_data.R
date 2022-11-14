# Loading Packages and Dataset

library("tidyverse")
library(readxl)
nba_raw <- read_excel("data/NBA_raw_data2019.xlsx")
View(nba_raw)
# This code is observations from the NBA_raw_data2019 dataset

# Finding how many people born in 1990 or after have died in the NBA(Joshua) 

death_since_1990 <- nba_raw %>%
  group_by(birthdate, kilos) %>%
  filter(birthdate > '1990-01-01') %>%
  filter(death == "Yes") %>%
  summarize(death) %>%
  nrow
  

# Finding average age of death of players who have died since the NBA started and 2019(Joshua)

average_age_death <- nba_raw %>%
  filter(death == "Yes") %>%
  summarise(mean(ageevent)) %>%
  pull()

# Finding how many people died at or below age 30(Joshua)

under_30 <- nba_raw %>%
  filter(death == "Yes") %>%
  filter(ageevent <= 30) %>%
  summarise(ageevent) %>%
  nrow

#Finding the percentage of how many people died at age 30 or lower from within dataset(Joshua) 

number_in_dataset <- nba_raw %>%
  nrow
percent_under_30 <- sum(under_30 / number_in_dataset)
