library("tidyverse")
library("ggplot2")
# Retrieve and wrangle Dataset

nba_injuries <- read.csv("data/injuries.csv")
View(nba_injuries)

nba_injuries <- nba_injuries %>% 
  mutate(Injuries = str_extract(Notes, "\\w+"),
         Status = str_extract(Notes, "(?<=\\()([^()]*?)(?=\\)[^()]*$)"),
         year = str_extract(Date, "....")
  )

# Computing the top 10 most frequently occuring injuries

injury_frequency <- nba_injuries %>% 
  group_by(Injuries) %>% 
  summarize(frequency = length(Injuries)) %>% 
  arrange(-frequency) %>% 
  head(10) %>% 
  pull(Injuries)

# Computing the top 4 most frequently occuring career status caused by injuries

status_frequency <- nba_injuries %>% 
  group_by(Status) %>% 
  summarize(frequency = length(Status)) %>% 
  arrange(-frequency) %>% 
  filter(is.na(Status) == FALSE) %>% 
  head(4) %>% 
  pull(Status)

# Plotting the summary of proportion of common injuries vs. common career status

nba_status <- nba_injuries %>% 
  group_by(Status) %>% 
  mutate(frequency = length(Status)) %>% 
  filter(Status %in% status_frequency == TRUE) %>% 
  filter(Injuries %in% injury_frequency == TRUE)

injury_plot <- ggplot(data = nba_status) +
  geom_col(
    aes(x = Status, y = frequency, fill = Injuries),
    position = "fill",
  ) +
  labs( 
    title = "Most Common NBA Career Status caused by Types of Injuries 2010 - 2018",
    x = "NBA Career Status",
    y = "Proportion of Injuries"
  )

plot(injury_plot)

# The aim of this chart is to directly draw a correlation between NBA injuries
# and the effects on a player's career status from 2010 to 2018. In this chart, 
# the proportion of the top 10 most common NBA injuries is indicated for each of 
# the top 4 most common NBA career status caused by those injuries. 
# One noticeable observation could be drawn from the severity of the injury and 
# the career status. An example could be observed the bruised injuries happened more 
# frequently in less life impacting career status such as DNP (Did Not Play) and DTD 
# (Day To Day). Whereas, injuries involving surgery happened a lot more frequently 
# in life impacting or threatening career status such as out for season and out indefinitely.

