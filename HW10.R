library(readxl)
#1.) 
hofpitching <- read_csv("hofpitching (1).csv")
hofpitching <- hofpitching %>%
     mutate(BF.group = cut(BF,
                           c(0, 10000, 15000, 20000, 30000),
            labels = c("Less than 10000", "(10000, 15000)",
                  "(15000, 20000)", "more than 20000")))
hof_eras <- summarize(group_by(hofpitching, ERA), N = n())
hof_eras

(hofpitching %>% 
    group_by(BF.group) %>%
    summarize(N=n()) ->S)

ggplot(S, aes(BF.group, N)) + geom_col()

ggplot(hofpitching, aes(x = ERA)) + geom_bar()
#I would say based off this bar graph, there's about 70% of pitchers


ggplot(hofpitching, aes(ERA)) +
   geom_bar() +
   xlab("Baseball Era") +
     ylab("Frequency") +
     ggtitle("Era of the Nonpitching Hall of Famers")
  ggsave("bargraph.png")
  # this is the alternative graph that provides a more specialized extension
  #6.) 
  
  batting <- read_csv("Batting.csv")
  bdates <- bind_rows(get_birthyear(prose),
                          get_birthyear(tcobb),
                          get_birthyear(twilliams)
  )
  get_birthyear <- function(Name) {
    Names <- unlist(strsplit(Name, " "))
    people %>%
      filter(nameFirst == Names[1],
             nameLast == Names[2])  %>%
      mutate(birthyear = ifelse(birthMonth >= 7,
                                birthyear + 1, birthyear),
             Player = paste(nameFirst, nameLast)) %>%
      select(playerID, Player, birthyear)
  }
  
  
  df %>% 
    inner_join(bdates, by = "playerID") %>%
    mutate(Age = yearID - birthyear) %>%
    select(playerID, Age, H) %>%
    group_by(playerID) %>%
    mutate(CHR = cumsum(HR)) -> df
  
  #using geom_line function, line graph
  ggplot(filter(df, playerID == prose), aes(Age, CH)) + geom_line
  
  ggplot(df, aes(Age, CH, group == playerID, color = playerID)) + geom_line
  
people <- read_csv("People.csv")
tcobb <- people %>%
  filter(nameFirst == "Ty", nameLast == "Cobb") %>%
  pull(retroID)
twilliams <- people %>%
  filter(nameFirst == "Ted", nameLast == "Williams") %>%
  pull(retroID)
prose <- people %>%
  filter(nameFirst == "Pete", nameLast == "Rose", birthYear == 1941) %>%
  pull(retroID)

ggplot(HRdata, aes(x = Age, y = CHR, linetype = Player)) +
  geom_line()

Batting %>% filter(playerID %in%
                     c(tcobb, twilliams, prose)) -> df
  
  