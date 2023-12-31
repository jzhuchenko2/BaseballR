knitr::opts_chunk$set(tidy = FALSE, highlight = TRUE, comment = NA, 
                      prompt = FALSE, fig.width = 6, fig.height = 3.5,
                      message = FALSE)
options(digits = 3)
options(width = 64)
options(continue = " ")
library(tidyverse)
#crcblue <- c(0.7453, 0.9689, 0, 0.3686)
# Pantone blue 072
crcblue <- "#2905a1"

# continuous color palette
# https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2
crc_pal <- colorRampPalette(c(crcblue, "white"))

crc_2 <- crc_pal(3)[1:2]
crc_3 <- crc_pal(4)[1:3]

crc_2 <- c(crcblue, "gray70")
crc_3 <- c(crcblue, "gray70", "gray10")

# https://mycolor.space/?hex=%232905A1&sub=1
# discrete palette
crc_4 <- c(crcblue, "#9b89b4", "#fdf7ff", "#362b48")

crc_d <- c(crcblue, "gray94", "#9b89b4", "gray50")

#ggplot(mtcars, aes(x = disp, y = mpg, color = factor(gear))) +
#  geom_point() + 
#  scale_color_manual(values = crc_d)

library(tidyverse)
library(Lahman)
tail(Teams, 3)

my_teams <- Teams %>%
  filter(yearID > 2000) %>%
  select(teamID, yearID, lgID, G, W, L, R, RA)
my_teams %>%
  tail()
#1a.) 
Teams %>% filter(yearID >= 1961, yearID <= 2000) %>%
  mutate(Era = ifelse(yearID <= 1990, "1971-1980" "1981-1990", "1991-2000"),
         WinPct = W / (W + L)) ->
Eras

one_fit <- function(years){
  lm(WinPct ~ I(R - RA), 
     data = filter(Eras, Era == years))
}

eras <- c("1991-2000")
f_fit <- lapply(eras, one_fit)
names(f_fit) <- eras

sapply(f_fit, coef)

#THE
merge(x = df1, y = df2, by = "CustomerId", all = TRUE)
People %>% 
  inner_join(top_closers) %>% 
  pull(residuals_pyt) %>% 
  summary()

stuff_ <- People %>% filter (birthYear > 1950) %>% select(playerID)
stuff2_ <- Batting %>% filter (V2 > 1950) %>% select(V1)
stuff3_ <- Pitching %>% filter (yearID > 1950) %>% select(playerID)

stuff4_ <- merge(Pitching, Batting, by="playerID")
stuff4.1_ <- merge(People, mlb_rosters_1_with_playerid, by="playerID")
stuff5_ <- merge(stuff4.1_, stuff4_, by="playerID")

library(tidyverse)
library(Lahman)
library(readr)


#Run Expectancy Matrix
fields <- read_xlsx("fields.xlsx")
all2016 <- read_csv("all2016.csv",
      # pull the specific fields and header
col_names = pull(fields, Header),
na = character())

