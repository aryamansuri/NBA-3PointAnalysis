#### Preamble ####
# Purpose: Cleans the raw data to only include columns of interest for the study
# Author: Aryaman Suri
# Date: 30 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

library(dplyr)
library(openxlsx)
# Read raw data
raw_data <- read_excel("data/raw_data/raw_data2.xlsx")

# Filter data to only include wins and 3 point shooting stats
analysis_data <- raw_data[, c("TEAM", "GP", "W", "L", "WIN%", "3PM", "3PA", "3P%", "+/-")]

# Write cleaned data to CSV
write.csv(analysis_data, "data/analysis_data/analysis_data.csv", row.names = FALSE)
