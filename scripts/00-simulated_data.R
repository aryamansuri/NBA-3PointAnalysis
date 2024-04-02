#### Preamble ####
# Purpose: Simulates data for NBA team statistics, including three-point shooting metrics and win percentage, for analysis of the relationship between three-point shooting and team success.
# Author: Aryaman Suri
# Date: 27th March 2024
# Contact: aryaman.suri@mail.utoronto.ca
# License: MIT
# Pre-requisites: tidyverse, janitor packages required

#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("janitor")
library(tidyverse)
library(janitor)

#### Data expectations ####
# Three-point shooting performance is expected to positively correlate with team win percentage.

#### Simulate data ####

# Number of teams and seasons
num_teams <- 5  # Adjusted to 5 teams
num_seasons <- 3

# NBA team names
team_names <- c("Atlanta Hawks", "Boston Celtics", "Brooklyn Nets", "Charlotte Hornets", "Chicago Bulls",
                "Cleveland Cavaliers", "Dallas Mavericks", "Denver Nuggets", "Detroit Pistons", "Golden State Warriors",
                "Houston Rockets", "Indiana Pacers", "LA Clippers", "Los Angeles Lakers", "Memphis Grizzlies",
                "Miami Heat", "Milwaukee Bucks", "Minnesota Timberwolves", "New Orleans Pelicans", "New York Knicks",
                "Oklahoma City Thunder", "Orlando Magic", "Philadelphia 76ers", "Phoenix Suns", "Portland Trail Blazers",
                "Sacramento Kings", "San Antonio Spurs", "Toronto Raptors", "Utah Jazz", "Washington Wizards")

# Use first 5 NBA team names
team_names <- team_names[1:num_teams]

# Create empty data frame to store simulated data
simulated_data <- tibble(
  Team = character(),
  Season = numeric(),
  ThreePM_per_game = numeric(),
  ThreeP_percentage = numeric(),
  Win_Percentage = numeric()
)

# Generate simulated data
for (season in 1:num_seasons) {
  for (team in 1:num_teams) {
    # Generate random values for three-point shooting metrics
    three_point_made <- rnorm(1, mean = 10, sd = 2)
    three_point_attempts <- rnorm(1, mean = 28, sd = 5)
    three_point_percentage <- three_point_made / three_point_attempts
    
    # Generate random win percentage
    win_percentage <- runif(1, min = 0.3, max = 0.8)
    
    # Add data to the data frame
    simulated_data <- simulated_data %>% 
      add_row(
        Team = team_names[team],
        Season = 2018 + season - 1,
        ThreePM_per_game = three_point_made,
        ThreeP_percentage = three_point_percentage,
        Win_Percentage = win_percentage
      )
  }
}

# Output the first few rows of the simulated data
simulated_data |> head()

#### Data Validation ####

# Check for missing values
sum(is.na(simulated_data))

# Scatterplot of Three-Pointers Made per Game vs. Win Percentage
ggplot(simulated_data, aes(x = ThreePM_per_game, y = Win_Percentage)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Three-Pointers Made per Game", y = "Win Percentage") +
  ggtitle("Scatterplot of Three-Pointers Made per Game vs. Win Percentage")
