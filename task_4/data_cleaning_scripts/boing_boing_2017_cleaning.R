library(tidyverse)
library(janitor)
library(readxl)

boing_boing_2017_dirty <- read_xlsx("../task_4/raw_data/boing-boing-candy-2017.xlsx")


boing_boing_2017_dirty %>% 
  glimpse

boing_boing_2017_cleaning <- boing_boing_2017_dirty %>% 
  clean_names() %>% 
  select(-starts_with('q7_')) %>% 
  select(-starts_with('q8_')) %>% 
  select(-starts_with('q9_')) %>% 
  select(-starts_with('q10_')) %>% 
  select(-starts_with('x114')) %>% 
  select(-starts_with('q11_')) %>% 
  select(-starts_with('q12_')) %>% 
  select(-starts_with('click_')) %>% 
  mutate(year = 2017,
         .before = q1_going_out) %>% 
  mutate(q2_gender = recode(q2_gender, "Male" = "Male", 
                         "Female" = "Female", .default = "Prefer not to say"))
boing_boing_2017_cleaning %>% 
    glimpse()

rename("trick_or_treating" = "q1_going_out", "gender" = "q2_gender",
       "age" = "q2_age", "country" = "q4_country", 
       "state" = "q5_state_province_county_etc")

