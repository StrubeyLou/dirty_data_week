library(tidyverse)
library(janitor)
library(readxl)

boing_boing_2016_dirty <- read_xlsx("../task_4/raw_data/boing-boing-candy-2016.xlsx")

boing_boing_2016_cleaning <- boing_boing_2016_dirty %>% 
  select(-starts_with('Please')) %>% 
  select(-starts_with('Guess')) %>% 
  select(-starts_with('Betty')) %>% 
  select(-starts_with('"That dress')) %>% 
  select(-starts_with('What is your')) %>% 
  select(-starts_with('Which day')) %>% 
  select(-starts_with('Do you eat')) %>% 
  select(-starts_with('When you see')) %>% 
  select(-starts_with('[York')) %>% 
  rename("date" = "Timestamp", "age" = "How old are you?", 
         "trick_or_treating" = 
           "Are you going actually going trick or treating yourself?",
         "country" = "Which country do you live in?",
         "gender" = "Your gender:",
         "state" = "Which state, province, county do you live in?") %>% 
  mutate(age = as.integer(age)) %>% 
  mutate(year = 2016,
         .after = date) %>% 
  select(-date) %>% 
  mutate(gender = recode(gender, "Male" = "Male", 
        "Female" = "Female", .default = "Prefer not to say"))

# For changing countries use string replace all and distinct countries

boing_boing_2016_cleaning %>% 
  glimpse()
