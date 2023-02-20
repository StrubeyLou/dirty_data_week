library(tidyverse)
library(janitor)

decathlon_dirty <- read_rds("dirty_data_week/task_1/raw_data/decathlon.rds")

decathlon_dirty %>% 
  glimpse()

decathlon_dirty %>% 
  names()

decathlon_finish <- decathlon_dirty %>% 
  clean_names() %>% 
  rownames_to_column("name") %>% 
  mutate(name = str_to_title(name))

write_csv(decathlon_finish, "dirty_data_week/task_1/clean_data/decathlon_finish.csv")
