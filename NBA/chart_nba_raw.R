# Loading Packages and Dataset

library("tidyverse")
library(readxl)
nba_raw <- read_excel("NBA_raw_data2019.xlsx")

# This file creates a scatterplot of the weight and age of NBA players who died below 30. 


# Finding how many people died at or below age 30(Joshua)

table_under_30 <- nba_raw %>%
  filter(death == "Yes") %>%
  filter(ageevent <= 30) %>%
  summarise(ageevent, kilos ) 
 
chart_under_30 <- table_under_30 %>%
  ggplot(aes(ageevent, kilos,
              )) +
  geom_point(size = 3, alpha = 0.5) +
  geom_line(size = 1)+
  labs(x = "Age", y = "Kilograms", title = "Weight and Age of NBA Players Who Died Below 30")
  theme_bw() 
chart_under_30
# This chart is used to visualize the weights and ages of each NBA player who died below age 30
# This information is useful to discover the health of each of these players who died at a young 
# age, as extremes in weight can often be proof of a decline in health. 


  