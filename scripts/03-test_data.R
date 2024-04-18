#### Preamble ####
# Purpose: Tests analysis data
# Authors: Aryaman Suri
# Contact: aryaman.suri@mail.utoronto.ca
# Pre-requisites: -



#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Run the analysis data ####
analysis_data <- read.csv("data/analysis_data/analysis_data.csv")



#### Test the data ####
test_that("Check for the right class", {
  expect_type(analysis_data$W, "integer")
  expect_type(analysis_data$X3PM, "double")
  
})


test_that("Check complete", {
  expect_true(all(complete.cases(analysis_data)))
})


test_that("Check variable",{
  expect_true(analysis_data$W |> min() >= 0)
  expect_true(analysis_data$W |> max() <= 82) # Since there are only 82 games in a season
})