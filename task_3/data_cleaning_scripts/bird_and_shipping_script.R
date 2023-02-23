library(tidyverse)
library(janitor)
library(readxl)

shipping_data <- read_xls("../task_3/raw_data/seabirds.xls", sheet = "Ship data by record ID")

bird_data <- read_xls("../task_3/raw_data/seabirds.xls", sheet = "Bird data by record ID")


shipping_data_cleaning <- shipping_data %>% 
  clean_names()%>% 
  select(record, record_id, lat, long)
  

bird_data_cleaning <- bird_data %>% 
  clean_names() %>% 
  rename("species_common_name" = "species_common_name_taxon_age_sex_plumage_phase",
         "species_scientific_name" = "species_scientific_name_taxon_age_sex_plumage_phase") %>% 
  select(record, record_id, species_common_name, species_scientific_name, species_abbreviation, count)

seabird_count <- left_join(bird_data_cleaning, shipping_data_cleaning, by='record_id')
