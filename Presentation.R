# R presentation

devtools::install_github("BillPetti/baseballr")

library(tidyverse)
library(baseballr)
Raleigh <- scrape_statcast_savant(start_date = "2023-05-01", 
                                 end_date = "2023-05-31",
                                 playerid = 663728,
                                 player_type = "batter")

## ----hc------------------------------------------------------------------
Raleigh %>%
  select(events, hc_x, hc_y) %>%
  head()

## ----correa_bip----------------------------------------------------------
Raleigh_bip <- Raleigh %>%
  filter(type == "X")
Raleigh_bip %>%
  select(events, hc_x, hc_y) %>%
  head()
