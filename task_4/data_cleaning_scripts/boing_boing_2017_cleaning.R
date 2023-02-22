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
                         "Female" = "Female", .default = "Prefer not to say")) %>% 
  rename("trick_or_treating" = "q1_going_out", "gender" = "q2_gender",
         "age" = "q3_age", "country" = "q4_country", 
         "state" = "q5_state_province_county_etc") %>% 
  mutate(country = case_when(
    country == "United States" ~ "USA",
    country == "usa" ~ "USA",
    country == "Usa" ~ "USA",
    country == "US" ~ "USA",
    country == "United States of America" ~ "USA",
    country == "us" ~ "USA",
    country == "united states" ~ "USA",
    country == "United states" ~ "USA",
    country == "Us" ~ "USA",
    country == "U.S." ~ "USA",
    country == "U.S.A." ~ "USA", 
    country == "united states of america" ~ "USA",
    country == "US of A" ~ "USA",
    country == "Unites States" ~ "USA",
    country == "america" ~ "USA",
    country == "u.s." ~ "USA",
    country == "America" ~ "USA",
    country == "The United States" ~ "USA",
    country == "United State" ~ "USA",
    country == "United Stated" ~ "USA",
    country == "'merica" ~ "USA",
    country == "Alaska" ~ "USA",
    country == "California" ~ "USA",
    country == "Murica" ~ "USA",
    country == "N. America" ~ "USA",
    country == "New Jersey" ~ "USA",
    country == "New York" ~ "USA",
    country == "North Carolina" ~ "USA",
    country == "Pittsburgh" ~ "USA",
    country == "The United States of America" ~ "USA",
    country == "U S" ~ "USA",
    country == "USA USA USA!!!!" ~ "USA",
    country == "USA! USA! USA!" ~ "USA",
    country == "USAA" ~ "USA",
    country == "USAUSAUSA" ~ "USA",
    country == "USSA" ~ "USA",
    country == "USa" ~ "USA",
    country == "Unied States" ~ "USA",
    country == "United Sates" ~ "USA",
    country == "United Statea" ~ "USA",
    country == "United Statss" ~ "USA",
    country == "United staes" ~ "USA",
    country == "United ststes" ~ "USA",
    country == "u s a" ~ "USA",
    country == "u.s.a." ~ "USA",
    country == "unite states" ~ "USA",
    country == "united States" ~ "USA",
    country == "united ststes" ~ "USA",
    country == "usas" ~ "USA",
    country == "Ahem....Amerca" ~ "USA",
    country == "I pretend to be from Canada, but I am really from the United States." ~ "USA",
    country == "1" ~ NA,
    country == "32" ~ NA,
    country == "35" ~ NA,
    country == "45" ~ NA,
    country == "46" ~ NA,
    country == "A" ~ NA,
    country == "Atlantis" ~ NA,
    country == "Can" ~ NA,
    country == "Canae" ~ NA,
    country == "Earth" ~ NA,
    country == "Fear and Loathing" ~ NA,
    country == "I don't know anymore" ~ NA,
    country == "Narnia" ~ NA,
    country == "Trumpistan" ~ NA,
    country == "UD" ~ NA,
    country == "USA? Hard to tell anymore.." ~ NA,
    country == "cascadia" ~ NA,
    country == "insanity lately" ~ NA,
    country == "murrika" ~ NA,
    country == "soviet canuckistan" ~ NA,
    country == "subscribe to dm4uz3 on youtube" ~ NA,
    country == "unhinged states" ~ NA,
    country == "Germany" ~ "Other",
    country == "Netherlands" ~ "Other",
    country == "Australia" ~ "Other",
    country == "Japan" ~ "Other",
    country == "Ireland" ~ "Other",
    country == "Mexico" ~ "Other",
    country == "Switzerland" ~ "Other",
    country == "germany" ~ "Other",
    country == "China" ~ "Other",
    country == "Denmark" ~ "Other",
    country == "France" ~ "Other",
    country == "Sweden" ~ "Other",
    country == "australia" ~ "Other",
    country == "Costa Rica" ~ "Other",
    country == "Europe" ~ "Other",
    country == "Greece" ~ "Other",
    country == "Hong Kong" ~ "Other",
    country == "Iceland" ~ "Other",
    country == "Indonesia" ~ "Other",
    country == "Korea" ~ "Other",
    country == "Singapore" ~ "Other",
    country == "South Korea" ~ "Other",
    country == "South africa" ~ "Other",
    country == "Taiwan" ~ "Other",
    country == "The Netherlands" ~ "Other",
    country == "UAE" ~ "Other",
    country == "finland" ~ "Other",
    country == "france" ~ "Other",
    country == "hong kong" ~ "Other",
    country == "spain" ~ "Other",
    country == "canada" ~ "Canada",
    country == "CANADA" ~ "Canada",
    country == "Canada`" ~ "Canada",
    country == "United Kingdom" ~ "UK",
    country == "Scotland" ~ "UK",
    country == "Uk" ~ "UK",
    country == "uk" ~ "UK",
    country == "England" ~ "UK",
    country == "U.K." ~ "UK",
    country == "United kingdom" ~ "UK",
    country == "endland" ~ "UK",
    .default = country
  )) %>% 
  rename_with(.fn = ~str_remove(.x, "q6_"), .cols = everything()) %>% 
  select(-starts_with("state")) %>% 
  select(-starts_with("bonkers_the_board")) %>% 
  select(-starts_with("broken_")) %>% 
  select(-starts_with("cash_")) %>% 
  select(-starts_with("chick_o")) %>% 
  select(-starts_with("creepy_")) %>% 
  select(-starts_with("dental_")) %>% 
  select(-starts_with("glow_")) %>% 
  select(-starts_with("hugs_")) %>% 
  select(-starts_with("pencils")) %>% 
  select(-starts_with("real_")) %>% 
  select(-starts_with("spotted_")) %>% 
  select(-starts_with("vials_")) %>% 
  select(-starts_with("vicodin")) %>% 
  select(-starts_with("white_")) %>% 
  select(-starts_with("internal")) %>% 
  select(-starts_with("kale_")) %>% 
  mutate(age = as.integer(age)) %>% 
  rename("x100_grand_bar" = "100_grand_bar", 
         "anonymous_brown_globs_that_come_in_black_and_orange_wrappers" = 
           "anonymous_brown_globs_that_come_in_black_and_orange_wrappers_a_k_a_mary_janes",
         "bonkers" = "bonkers_the_candy", "dark_chocolate_hershey" = "hersheys_dark_chocolate")
  

boing_boing_2017_count <- boing_boing_2017_cleaning %>% 
  group_by(country) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))


boing_boing_2017_cleaning %>% 
    glimpse()

write_csv(boing_boing_2017_cleaning, "../task_4/clean_data/boing_boing_2017_cleaning.csv")

