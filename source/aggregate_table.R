# Compute Summary Table of Extracted Information

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
View(nba_table)

# This table was created to summarize important data that serves as crucial evidence
# for answering research questions in the problem domain. With these extracted 
# information formatted in an organized table, the answers to the problems become 
# much more transparent. This table will reveal information on the measure of NBA
# athlete's life expectancy through standardized mortality rate (SMR), pin point 
# the most common injury as a cause to the end of an athlete's career, and contextualize
# historical death records of former NBA athletes. 
