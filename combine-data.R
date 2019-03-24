library(readr)
library(dplyr)

files <- list.files('data')
files

# load all files to a dataframe (tibble)
dfs <- files %>% (function(filenames) {
    paste("data", filenames, sep = "/")
  }) %>% lapply(read_csv)

# check if all files have the same features
same.features <- dfs %>% lapply(names) %>% unique %>% length

if (same.features == 1) print("Data features are same") else print("Data features are different")

# combine multiple dataset into one
new_df <- dfs %>% bind_rows

# save combined dataset
write_csv(new_df, "data/cicids17.csv")
