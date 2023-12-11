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

## ------------------------------------------------------------------------
# ggspraychart(data = correa, fill_value = "events")
spray_chart <- function(...) {
  ggplot(...) + 
    geom_curve(x = 33, xend = 223, y = -100, yend = -100,
               curvature = -.65) +
    geom_segment(x = 128, xend = 33, y = -208, yend = -100) +
    geom_segment(x = 128, xend = 223, y = -208, yend = -100) +
    geom_curve(x = 83, xend = 173, y = -155, yend = -156,
               curvature = -.65, linetype = "dotted") +
    coord_fixed() + 
    scale_x_continuous(NULL, limits = c(25, 225)) + 
    scale_y_continuous(NULL, limits = c(-225, -25))
}

## ----spray_chart, warning=FALSE, fig.cap="Spray chart of balls in play hit by Carlos Correa in May, 2017."----
spray_chart(Raleigh_bip, aes(x = hc_x, y = -hc_y, color = events)) + 
  geom_point() + 
  scale_color_grey()
