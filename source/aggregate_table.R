Summary <- c("Average White Athlete Standardized Mortality Rate", 
             "Average Black Athlete Standardized Mortality Rate", 
             "Most Common Athlete Career Status",
             "Proportion of Athletes out indefinitely",
             "Most Common Injury among Athletes out indefinitely",
             "More Details of Injury mentioned above",
             "Average Age when Athletes died from start of NBA to 2019",
             "Number of Deaths from Athletes born on or after 1990",
             "Number of Deaths at or below Age 30 ",
             "Percent of Deaths at or below Age 30"
             )

Values <- c( 0.062,
             0.064,
             "DNP",
             0.049,
             "surgery",
             "arthroscopic surgery on right knee ",
             69,
             3,
             23,
             0.005
            )

nba_table <- data.frame(Summary = Summary, Values = Values)
