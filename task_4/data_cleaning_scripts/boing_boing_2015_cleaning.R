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
         "trick_or_treating" = 
           "Are you going actually going trick or treating yourself?" ) %>% 
  mutate(age = as.integer(age)) %>% 
  mutate(year = 2015,
         .before = "age") %>% 
  select(-date) %>% 
  clean_names() %>% 
  select(-starts_with("vials_")) %>% 
  select(-starts_with("cash_")) %>% 
  select(-starts_with("dental_")) %>% 
  select(-starts_with("glow_")) %>% 
  select(-starts_with("broken_")) %>% 
  select(-starts_with("creepy_")) %>% 
  select(-starts_with("hugs_")) %>% 
  select(-starts_with("kale_")) %>% 
  select(-starts_with("pencils")) %>% 
  select(-starts_with("chick_")) %>% 
  select(-starts_with("spotted_")) %>% 
  select(-starts_with("vicodin")) %>% 
  select(-starts_with("white_")) %>% 
  select(-starts_with("sea_salt"))
  

boing_boing_2015_cleaning %>% 
  glimpse


boing_boing_pivot <- boing_boing_2015_cleaning %>% 
  pivot_longer(cols = -(1:3),names_to = "candy", values_to = "rating") %>% 
  count(candy, rating, sort = TRUE) 
  

write_csv(boing_boing_2015_cleaning, "../task_4/clean_data/boing_boing_2015_cleaning.csv")


            