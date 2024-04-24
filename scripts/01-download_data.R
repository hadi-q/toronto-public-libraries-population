#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto about Toronto
#         Public Library branches
# Author: Hadi Ahmad
# Date: 24 April 2024
# Contact: hadiq.ahmad@mail.utoronto.ca
# License: MIT
# Pre-requisites: Know where to get Toronto library branch data

#### Workspace setup ####
# install.packages('opendatatoronto')  
# install.packages('tidyverse')
# install.packages('dplyr')  
# install.packages('xlsx')   
library(opendatatoronto)
library(tidyverse)
library(dplyr)
# library(xlsx)      

# TORONTO PUBLIC LIBRARY DATA
# Code copied from https://open.toronto.ca/dataset/library-branch-general-information/
# get package
package <- show_package("f5aa9b07-da35-45e6-b31f-d6790eb9bd9b")
package

# get all resources for this package
resources <- list_package_resources("f5aa9b07-da35-45e6-b31f-d6790eb9bd9b")

# identify datastore resources; by default, Toronto Open Data sets datastore 
# resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
library_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
library_data

#### Save data ####
# Output data to csv
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(library_data, "data/raw_data/library_raw_data.csv") 

# Previously attempted to compare against ward or neighbourhood data
# Issue #1: unable to locate the resource where the dataset is located
# Issue #2: incongruencies in number of neighbourhoods vs the libraries data

# NEIGHBOURHOOD DATA
# Code copied from https://open.toronto.ca/dataset/neighbourhood-profiles/
# get package

# package <- show_package("6678e1a6-d25f-4dff-b2b7-aa8f042bc2eb")
# package
# 
# resources <- list_package_resources("6678e1a6-d25f-4dff-b2b7-aa8f042bc2eb")
# 
# # identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
# datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
# 
# # load the first datastore resource as a sample
# # row_number()==1 provides info about the dataset, while ==2 provides the actual dataset
# data <- filter(datastore_resources, row_number()==1) %>% get_resource()
# head(data)
# 
# write_csv(data, "inputs/data/wards_raw_data.csv")
# 
# # copied from https://github.com/EthanSansom/torontocitytrees/blob/main/scripts/00_data_import.R
# raw_ward_map_data <-
#   list_package_resources("5e7a8234-f805-43ac-820f-03d7c360b588") |> 
#   filter(name == "25-ward-model-december-2018-wgs84-latitude-longitude") |> 
#   get_resource()