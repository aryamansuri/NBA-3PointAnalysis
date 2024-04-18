# Beyond the Arc: The Impact of  3 point Shooting in the Modern NBA

## Overview

This paper analyzes data from nba.com to determine if a team's increase in 3 point shooting can predict if the team has an increase in wins.

## File Structure

The repo is structured as:

-   `data` contains the data sources used in analysis including the raw data. Additional information about the data can be found in `other/datasheet`.
-   `model` contains the Bayesian Generalized Linear model.
-   `other` contains the sketch of the dataset and graph. This also contains the datasheet and the chat history for the LLM usage.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download, clean and test data and build the model.


## Statement on LLM usage

Parts of the datasheet were written using ChatGPT 3.5 and the entire chat history can be found in `other/llm/usage.txt`

## How to Run

1. The raw data was obtained from NBA.com from the regular season team stats for the seasons from 2014-15 to 2022-23 excluding the 2019-20 season
2. Each of these tables was combined and then stored in raw_data.xlsx
3. Run scripts/02-data_cleaning.R to generate cleaned data
4. Run scripts/03-test_data.R to validate the cleaned data
5. Run scripts/04-model.R to fit models
6. Run outputs/paper/paper.qmd to generate the PDF of the paper
