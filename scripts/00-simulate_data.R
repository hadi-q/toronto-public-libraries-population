#### Preamble ####
# Purpose: Simulates the neighbourhood corresponding to each branch of the 
#          Toronto Public Library, along with neighbourhood statistics ie income
# Author: Hadi Ahmad
# Date: 24 April 2024
# Contact: hadiq.ahmad@mail.utoronto.ca
# License: MIT
# Pre-requisites: Know where to get Toronto open data, StatCan data

#### Workspace setup ####
# install.packages("tidyverse")
library(tidyverse)

#### Simulate data ####
simulated_data <-
  tibble(
    "Ward" = c("Beaches-East York", "Davenport", "Don Valley East", 
            "Don Valley North", "Don Valley West", "Eglinton-Lawrence", 
            "Etobicoke Centre", "Etobicoke North", "Etobicoke-Lakeshore", 
            "Humber River-Black Creek", "Parkdale-High Park", 
            "Scarborough Centre", "Scarborough North", "Scarborough Southwest", 
            "Scarborough-Agincourt", "Scarborough-Guildwood", 
            "Scarborough-Rouge Park", "Spadina-Fort York", "Toronto Centre", 
            "Toronto-Danforth", "Toronto-St. Paul's", "University-Rosedale", 
            "Willowdale", "York Centre", "York South-Weston"),
    "Branches" = sample(1:7, 25, replace = TRUE),
    "Income" = sample(20000:200000, 25, replace = TRUE)
  )

simulated_data

# Ensure correct column name selected from simulated data
names(simulated_data)

# Test cases

# Ensure that each ward appears once
simulated_data$Ward |>
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
simulated_data$Ward |>
  unique() |>
  length() == 25

# Ensure that 1-7 branches appear per ward
all(simulated_data$Branches >= 1 & simulated_data$Branches <= 7)

# Ensure that ward income is from $20,000-200,000
all(simulated_data$Income >= 20000 & simulated_data$Income <= 200000)

simulated_data
