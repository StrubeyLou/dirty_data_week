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
        "Female" = "Female", .default = "Prefer not to say")) %>% 
  mutate(country = case_when(
    country == "United States" ~ "USA",
    country == "usa" ~ "USA",
    country == "us" ~ "USA",
    country == "US" ~ "USA",
    country == "Usa" ~ "USA",
    country == "U.S.A" ~ "USA",
    country == "U.S." ~ "USA",
    country == "Us" ~ "USA",
    country == "united states" ~ "USA",
    country == "United States of America" ~ "USA",
    country == "U.S.A." ~ "USA",
    country == "America" ~ "USA",
    country == "Murica" ~ "USA",
    country == "Merica" ~ "USA",
    country == "USA! USA! USA!" ~ "USA",
    country == "u.s." ~ "USA",
    country == "united states of america" ~ "USA",
    country == "U.s." ~ "USA",
    country == "UNited States" ~ "USA",
    country == "USA (I think but it's an election year so who can really tell)" ~ "USA",
    country == "USA USA USA" ~ "USA",
    country == "USA USA USA USA" ~ "USA",
    country == "USA!" ~ "USA",
    country == "USA! USA!" ~ "USA",
    country == "USA!!!!!!" ~ "USA",
    country == "United  States of America" ~ "USA",
    country == "United Sates" ~ "USA",
    country == "United State" ~ "USA",
    country == "United Stetes" ~ "USA",
    country == "Units States" ~ "USA",
    country == "america" ~ "USA",
    country == "the best one - usa" ~ "USA",
    country == "uSA" ~ "USA",
    country == "USSA" ~ "USA",
    country == "United states" ~ "USA",
    country == "54.0" ~ NA,
    country == "Sub-Canadian North America... 'Merica" ~ NA,
    country == "30.0" ~ NA,
    country == "44.0" ~ NA,
    country == "45.0" ~ NA,
    country == "47.0" ~ NA,
    country == "51.0" ~ NA,
    country == "A tropical island south of the equator" ~ NA,
    country == "Cascadia" ~ NA,
    country == "EUA" ~ NA,
    country == "Not the USA or Canada" ~ NA,
    country == "See above" ~ NA,
    country == "Somewhere" ~ NA,
    country == "The Yoo Ess of Aaayyyyyy" ~ NA,
    country == "The republic of Cascadia" ~ NA,
    country == "Trumpistan" ~ NA,
    country == "god's country" ~ NA,
    country == "there isn't one for old men" ~ NA,
    country == "this one" ~ NA,
    country == "one of the best ones" ~ NA,
    country == "Neverland" ~ NA,
    country == "Denial" ~ NA,
    country == "canada" ~ "Canada",
    country == "United Kingdom" ~ "UK",
    country == "uk" ~ "UK",
    country == "England" ~ "UK",
    country == "england" ~ "UK",
    country == "United Kindom" ~ "UK",
    country == "Australia" ~ "Other",
    country == "Germany" ~ "Other",
    country == "Japan" ~ "Other",
    country == "New Zealand" ~ "Other",
    country == "Mexico" ~ "Other",
    country == "france" ~ "Other",
    country == "Austria" ~ "Other",
    country == "Brasil" ~ "Other",
    country == "China" ~ "Other",
    country == "Finland" ~ "Other",
    country == "France" ~ "Other",
    country == "Korea" ~ "Other",
    country == "Netherlands" ~ "Other",
    country == "Panama" ~ "Other",
    country == "Philippines" ~ "Other",
    country == "Portugal" ~ "Other",
    country == "South Korea" ~ "Other",
    country == "Switzerland" ~ "Other",
    country == "The Netherlands" ~ "Other",
    country == "belgium" ~ "Other",
    country == "croatia" ~ "Other",
    country == "españa" ~ "Other",
    country == "germany" ~ "Other",
    country == "hungary" ~ "Other",
    country == "kenya" ~ "Other",
    country == "netherlands" ~ "Other",
    country == "sweden" ~ "Other",
    .default = country)) %>% 
  clean_names() %>% 
  select(-starts_with("bonkers_the_board")) %>% 
  select(-starts_with("broken_")) %>% 
  select(-starts_with("cash_")) %>% 
  select(-starts_with("chick_o")) %>% 
  select(-starts_with("creepy_")) %>% 
  select(-starts_with("dental_")) %>% 
  select(-starts_with("glow_")) %>% 
  select(-starts_with("hugs_")) %>% 
  select(-starts_with("kale_")) %>% 
  select(-starts_with("pencils")) %>% 
  select(-starts_with("person_of")) %>% 
  select(-starts_with("spotted_")) %>% 
  select(-starts_with("vials_")) %>% 
  select(-starts_with("vicodin")) %>% 
  select(-starts_with("white_")) %>% 
  select(-starts_with("state")) %>% 
  rename("bonkers" = "bonkers_the_candy", "box_o_raisins" = "boxo_raisins", "dark_chocolate_hershey" = "hersheys_dark_chocolate")
  
  
  mutate(country = recode(country, "USA" = "USA", "United States" = "USA", 
       "us" = "USA", "US" = "USA", .default = "Other")

boing_boing_2016_count <- boing_boing_2016_cleaning %>% 
  group_by(country) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

boing_boing_2016_cleaning %>% 
  glimpse()

?case_when

write_csv(boing_boing_2016_cleaning, "../task_4/clean_data/boing_boing_2016_cleaning.csv")
