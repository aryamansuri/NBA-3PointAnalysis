#### Preamble ####
# Purpose: Cleans the raw data to only include columns of interest for the study
# Author: Aryaman Suri
# Date: 30 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

library(dplyr)
library(readxl)
library(openxlsx)
# Read raw data
raw_data <- read_excel("data/raw_data/raw_data2.xlsx")

# Filter data to only include wins and 3 point shooting stats
analysis_data <- raw_data[, c("TEAM", "GP", "W", "L", "WIN%", "3PM", "3PA", "3P%", "+/-")]

# Group the stats by team for all the seasons
grouped_data <- analysis_data %>%
  group_by(TEAM) %>%
  summarize(
    Total_GP = sum(GP),
    Total_Wins = sum(W),
    Total_3PM = sum(`3PM`),
    Total_3PA = sum(`3PA`),
    Average_Wins = round(mean(W), 2),
    Average_3PM = round(mean(`3PM`), 2)
  )
# Write cleaned data to CSV
write.csv(analysis_data, "data/analysis_data/analysis_data.csv", row.names = FALSE)
write.csv(grouped_data, "data/analysis_data/grouped_data.csv", row.names = FALSE)
