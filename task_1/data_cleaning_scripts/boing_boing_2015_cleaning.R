library(tidyverse)
library(janitor)
library(readxl)
?select

boing_boing_2015 <- read_xlsx("../task_4/raw_data/boing-boing-candy-2015.xlsx")

boing_boing_2015 %>% 
  glimpse

boing_boing_2015_cleaning <- boing_boing_2015 %>% 
  select(-'What is your favourite font?') %>% 
  select(-starts_with('Please')) %>% 
  select(-starts_with('Fill')) %>% 
  select(-starts_with('Which')) %>% 
  select(-starts_with('If')) %>% 
  select(-starts_with('"That dress')) %>% 
  select(-starts_with('Check')) %>% 
  select(-starts_with('Betty')) %>% 
  select(-starts_with('Guess')) %>% 
  rename("date" = "Timestamp", "age" = "How old are you?", 
         "trick_or_treating?" = 
           "Are you going actually going trick or treating yourself?" ) %>% 
  mutate(age = as.integer(age)) %>% 
  mutate(year = 2015,
         .before = "age") %>% 
  select(-date)


boing_boing_2015_cleaning %>% 
  glimpse


            