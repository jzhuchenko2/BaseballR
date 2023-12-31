#stuff4_ <- merge(Pitching, Batting, by="playerID")
#stuff4.1_ <- merge(People, battingsala, by="playerID")
#stuff5_ <- merge(stuff4.1_, stuff4_, by="playerID")

#combine stats 
#batting stats
merged_batting$pa <- merged_batting$pa / 100
merged_batting$ab <- merged_batting$hit - merged_batting$pa
merged_batting$head(100)
merged_batting_subset <- merged_batting[order(-merged_batting$ab), ][1:100, ]

final_batting_data <- merged_batting_subset

write.csv(final_batting_data, "final_batting_data.csv", row.names = FALSE)

##pitchingsal$Name <- pitchingsal$`Name `

merged_batting <- merge(stats_1_, battingsal, by="Name")

##pitching stats

merged_pitching <- merge(stats_4_, pitchingsal, by="Name")

merged_pitching$out_zone_percent <- merged_pitching$out_zone_percent * 100
merged_pitching$ac <- merged_pitching$p_era / merged_pitching$out_zone_percent
merged_pitching$head(100)
