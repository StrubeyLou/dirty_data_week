library(tidyverse)
library(janitor)

cake_ingredients <- read_csv("../task_2/raw_data/cake/cake_ingredient_code.csv")

cake_recipes <- read_csv("../task_2/raw_data/cake/cake-ingredients-1961.csv")

cake_recipes_pivot <- cake_recipes %>% 
  pivot_longer(cols = -(1), names_to = "code", values_to = "portion")

cake_full <- full_join(cake_recipes_pivot, cake_ingredients, by='code')

cake_clean <- cake_full %>% 
  janitor::clean_names() %>% 
  relocate(ingredient, .after = code) %>% 
  select(-code)

write_csv(cake_clean, "../task_2/clean_data/cake_clean.csv")
