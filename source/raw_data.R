# Loading Packages and Dataset

library("tidyverse")
library(readxl)
library("stringr")

nba_raw <- read_excel("data/NBA_raw_data2019.xlsx")
View(nba_raw)

nba_injuries <- read.csv("data/injuries.csv")
View(nba_injuries)

# This code is observations from the NBA_raw_data2019 dataset

# Finding how many people born in 1990 or after have died in the NBA(Joshua) 

death_since_1990 <- nba_raw %>%
  group_by(birthdate, kilos) %>%
  filter(birthdate > '1990-01-01') %>%
  filter(death == "Yes") %>%
  summarize(death) %>%
  nrow
  

# Finding age of death of average player who has died since the NBA started and 2019(Joshua)

average_age_death <- nba_raw %>%
  filter(death == "Yes") %>%
  summarise(mean(ageevent)) %>%
  pull()

# Finding how many people died at age 30(Joshua)

under_30 <- nba_raw %>%
  filter(death == "Yes") %>%
  filter(ageevent <= 30) %>%
  summarise(ageevent) %>%
  nrow

# Finding the percentage of how many people died at age 30 or lower from within dataset(Joshua) 

number_in_dataset <- nba_raw %>%
  nrow
percent_under_30 <- sum(under_30 / number_in_dataset)





# Jah's Work
# This code is observations from the injuries dataset

# Finding the injuries and the associated career status for each observation

nba_injuries <- nba_injuries %>% 
  mutate(Injuries = str_extract(Notes, "[^\\(]+"),
         Status = str_extract(Notes, "(?<=\\()([^()]*?)(?=\\)[^()]*$)")
  )

nba_injuries$Injuries <- str_extract(nba_injuries$Injuries, "\\w+")

# Finding the year with the most recorded injuries in the dataset

most_recorded_injuries <- nba_injuries %>% 
  mutate(year = str_extract(Date, "....")) %>% 
  group_by(year) %>% 
  summarize(Records = length(Injuries)) %>% 
  filter(Records == max(Records)) %>% 
  pull(year)

# Finding the most common career status due to injuries for each year

most_common_status <- nba_injuries %>% 
  mutate(year = str_extract(Date, "....")) %>%
  group_by(year, Status) %>% 
  summarize(status_frequency = max(length(Status))) %>% 
  group_by(year) %>% 
  filter(status_frequency == max(status_frequency)) %>% 
  select(-status_frequency)
  

# Finding the proportion of players that were "out indefinitely" in the dataset

prop_out_indefinitely <- nba_injuries %>% 
  filter(Status == "out indefinitely")

prop_out_indefinitely <- nrow(prop_out_indefinitely) / nrow(nba_injuries)

# Finding the most common injury that caused players to be "out indefinitely" in the dataset

out_indefinitely_injuries <- nba_injuries %>% 
  mutate(abbr_injuries = str_extract(Injuries, "\\w+")) %>% 
  filter(Status == "out indefinitely") %>% 
  group_by(abbr_injuries) %>% 
  summarize(num_injuries = length(abbr_injuries)) %>% 
  filter(num_injuries == max(num_injuries)) %>% 
  pull(abbr_injuries)

# Listing the details of the most common injury to cause "out indefinitely" in the dataset

details_out_indefinitely <- nba_injuries %>% 
  filter(Status == "out indefinitely") %>% 
  mutate(details = str_detect(Injuries, out_indefinitely_injuries)) %>% 
  filter(details == TRUE) %>% 
  group_by(Injuries) %>% 
  summarize(injury_frequency = length(Injuries)) %>% 
  arrange(-injury_frequency) %>% 
  head() %>% 
  pull(Injuries)
  
    
  
