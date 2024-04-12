#### Preamble ####
# Purpose: Model to predict wins based on season-wise 3-point shots made (3PM) in the NBA.
# Author: Aryaman Suri
# Date: 30 March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(readr)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")
grouped_data <- read_csv("data/analysis_data/grouped_data.csv")

### Model data ####
# Assuming 'analysis_data' contains columns: 'Season', 'TEAM', 'GP', 'W', 'L', '3PM', '3PA', '3P%'
# For this analysis, we'll focus on 'W' (wins) and '3PM' (3-point shots made)

# Season-wise model
nba_model <- stan_glm(
  formula = W ~ `3PM`,
  data = analysis_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 853
)

# Cumulative model based on each Team
# Season-wise model
nba_model2 <- stan_glm(
  formula = Average_Wins ~ Average_3PM,
  data = grouped_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 853
)

#### Save models ####
saveRDS(
  nba_model,
  file = "model/nba_model.rds"
)

saveRDS(
  nba_model2,
  file = "model/nba_model_team.rds"
)
