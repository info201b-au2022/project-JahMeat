library("tidyverse")
library("ggplot2")
setwd("~/info201/projects/project-JahMeat")

# Retrieve Dataset

nba_injuries <- read.csv("data/injuries.csv")
View(nba_injuries)

nba_injuries <- nba_injuries %>% 
  mutate(Injuries = str_extract(Notes, "[^\\(]+"),
         Status = str_extract(Notes, "(?<=\\()([^()]*?)(?=\\)[^()]*$)"),
         year = str_extract(Date, "....")
  )

nba_injuries$Injuries <- str_extract(nba_injuries$Injuries, "\\w+")

nba_injuries <- nba_injuries %>% 
  group_by(Status) %>% 
  mutate(frequency = length(Status)) %>% 
  filter(Injuries == "surgery" | Injuries == "rest" | Injuries == "torn" | Injuries == "illness") %>% 
  filter(Status == "out indefinitely" | Status == "DNP" | Status == "DTD" | Status == "out for season")

injury_plot <- ggplot(data = nba_injuries) +
  geom_col(
    mapping = aes(x = Status, y = frequency, fill = Injuries),
    position = "fill"
  )

plot(injury_plot)
