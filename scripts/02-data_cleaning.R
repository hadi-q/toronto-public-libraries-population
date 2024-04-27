#### Preamble ####
# Purpose: Cleans the Toronto library and census data based on the needed parameters
# Author: Hadi Ahmad
# Date: 24 April 2024
# Contact: hadiq.ahmad@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A

#### Workspace setup ####

# install.packages("tidyverse")
# install.packages("janitor")
# install.packages("arrow")
library(tidyverse)
library(janitor)
library(arrow)

#### Clean data ####
library_raw_data <- read_csv("data/raw_data/library_raw_data.csv")
library_clean_data <- clean_names(library_raw_data)

# Selected rows needed for analysis
library_clean_data <-
  library_clean_data |>
  select(
    physical_branch, branch_name, square_footage, ward_no, ward_name, present_site_year
  )

# Get rid of non-physical locations e.g. phone answering line
library_clean_data <-
  library_clean_data |>
  filter(physical_branch > 0)
head(library_clean_data)

# Remove physical_branch column
library_clean_data <-
  library_clean_data |>
  select(
    branch_name, square_footage, ward_no, ward_name, present_site_year
  )

library_clean_data
# Test cases

# Ensure that each ward is randomly assigned >1 library branch
# Wherein false = >1 library branch in this ward
library_clean_data$Ward |>
  unique() == c("Beaches-East York", "Davenport", "Don Valley East", 
                "Don Valley North", "Don Valley West", "Eglinton-Lawrence", 
                "Etobicoke Centre", "Etobicoke North", "Etobicoke-Lakeshore", 
                "Humber River-Black Creek", "Parkdale-High Park", 
                "Scarborough Centre", "Scarborough North", "Scarborough Southwest", 
                "Scarborough-Agincourt", "Scarborough-Guildwood", 
                "Scarborough-Rouge Park", "Spadina-Fort York", "Toronto Centre", 
                "Toronto-Danforth", "Toronto-St. Paul's", "University-Rosedale", 
                "Willowdale", "York Centre", "York South-Weston")
# Ensure that 25 wards are represented
# Wherein true = 25 unique wards are present in the actual data
library_clean_data$Ward |>
  unique() |>
  length() == 25

# Ward data no longer included in dataset
# WARD DATA
# read.xlsx() format obtained from https://stackoverflow.com/questions/51930684/read-excel-file-and-select-specific-rows-and-columns
# read.xlsx("inputs/data/wards_raw_data.xlsx", "sheet_name", rowIndex = 5:700, colIndex = 1:10)

#### Save data ####
write_csv(library_clean_data, "outputs/data/analysis_data.csv")

# Clean census data

# Read the CSV file and select specific rows and columns
census_data <- read.csv("data/raw_data/CensusProfile2021BeachesEastYork.csv")
selected_rows <- census_data[c(5:12), ]  # Select specific rows by index
selected_cols <- selected_rows[, c("B","D")]  # Select specific columns by name or index

# Write the selected rows and columns to a Parquet file
write_parquet(selected_cols, "selected_data.parquet")

# NOT WORKING FOR CENSUS DATA
