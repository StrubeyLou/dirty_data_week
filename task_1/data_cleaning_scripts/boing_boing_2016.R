library(tidyverse)
library(janitor)
library(readxl)

boing_boing_2016_dirty <- read_xlsx("../task_4/raw_data/boing-boing-candy-2016.xlsx")

boing_boing_2016_cleaning <- boing_boing_2016_dirty %>% 
  select(-starts_with('Please')) %>% 
  rename("date" = "Timestamp", "age" = "How old are you?", 
         "trick_or_treating?" = 
           "Are you going actually going trick or treating yourself?",
         "country" = "Which country do you live in?",
         "state" = "Which state, province, county do you live in?")

# For changing countries use string replace all and distinct countries

boing_boing_2016_cleaning %>% 
  glimpse()
