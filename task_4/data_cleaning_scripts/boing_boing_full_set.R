library(tidyverse)
library(janitor)
library(readxl)

boing_boing_2015 <-read_csv("clean_data/boing_boing_2015_cleaning.csv")
boing_boing_2016 <-read_csv("clean_data/boing_boing_2016_cleaning.csv")
boing_boing_2017 <-read_csv("clean_data/boing_boing_2017_cleaning.csv")

boing_boing_some_merged <- bind_rows(boing_boing_2015, boing_boing_2016)

boing_boing_full_merge <- bind_rows(boing_boing_some_merged, boing_boing_2017)

boing_boing_full_cleaning <- boing_boing_full_merge %>% 
  relocate(gender, .after = age) %>% 
  relocate(country, .after = gender)

boing_boing_full_pivot <- boing_boing_full_cleaning %>% 
  pivot_longer(cols = -(1:5), names_to = "candy", values_to = "rating") 

write_csv(boing_boing_full_pivot, "clean_data/boing_boing_full.csv")
