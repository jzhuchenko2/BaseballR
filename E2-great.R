#Exam 2--group question
library(tidyverse)
library(Lahman)

print("Hello")

People %>% 
  filter(nameFirst == "Ozzie", nameLast == "Smith") %>%
  pull(playerID) -> smith_id

People %>% 
  filter(nameFirst == "Rabbit", nameLast == "Maranville") %>%
  pull(playerID) -> maranville_id

People %>% 
  filter(nameFirst == "Robin", nameLast == "Yount") %>%
  pull(playerID) -> yount_id

People %>% 
  filter(nameFirst == "Honus", nameLast == "Wagner") %>%
  pull(playerID) -> wagner_id

People %>% 
  filter(nameFirst == "John", nameLast == "Ward", nameGiven == "John Montgomery") %>%
  pull(playerID) -> ward_id

batting <- Batting %>%
  replace_na(list(SF = 0, HBP = 0))
