#### Preamble ####
# Purpose: Downloads and saves the data from the nba.com
# Author: Aryaman Suri
# Date: 30 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

# Install and load the read and open xlsx package
library(readxl)
library(openxlsx)

# Download the season wise data from nba.com for the seasin from 2014-15 to 2022-23
# Store this data in raw_data.xlsx
raw_data <- read_excel("data/raw_data/raw_data.xlsx")
# Remove all the rows that are empty and make the data more presentable
raw_data$TEAM <- c(raw_data$TEAM[-1], NA)
raw_data <- raw_data[complete.cases(raw_data), ]
#### Save this new raw_data file in raw_data2.xlsx ####
write.xlsx(raw_data, file = "data/raw_data/raw_data2.xlsx", rowNames = FALSE)
