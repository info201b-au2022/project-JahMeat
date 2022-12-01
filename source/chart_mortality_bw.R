library("ggplot2")
library(openxlsx)
library(readxl)
library(tidyverse)
library(dplyr)

#White athlete graph
white_mortality <- read_excel("../data/WHITEMortalityUSA2000to2018.xlsx")
View(white_mortality)
names(white_mortality)[1] <- "age"
ggplot(white_mortality, aes(x = age, y = Averages)) +
  geom_point() +
  labs(x = 'Age of Athlete', y = 'Average SMR from 2000 to 2018', title = 'Scatterplot of Age v.s. Mortality Rate')

#Black athlete graph
black_mortality <- read_excel("../data/BLACKMortalityUSA2000to2018.xlsx")
View(black_mortality)
names(black_mortality)[1] <- "age"
ggplot(black_mortality, aes(x = age, y = Averages, color = "red")) +
  geom_point() +
  labs(x = 'Age of Athlete', y = 'Average SMR from 2000 to 2018', title = 'Scatterplot of Age v.s. Mortality Rate')

#I decided to include these charts in order to compare not only the change in mortality rates over time for
#These athletes, but also to show the differences in the trends over time between black and white players respectively. 
#By doing so, we are able to see how another factor such as race can play a role in determining the long term health 
#Of these athletes, and how it compares between the two races. It also raises the question whether or not it is the
#Race itself or other determining factors such as average household income and access to healthcare that are to blame for 
#the differences.

  