# Injuries in the NBA: Analyzing the Long Term Effects of Sports Injuries

#### Code Name: `Stay_Ballin`

#### Authors and Contact Information
* Joshua Taylor (jtay25@uw.edu)
* Youseph Taffal (ymtaffal@uw.edu)
* Jah Chen (jah0311@uw.edu)

#### Affiliations
* INFO-201: Technical Foundations of Informatics - The Information School - University of Washington  

#### Date
* Autumn 2022

#### Keywords
* physical health
* life expectancy
* sports injuries
* NBA

## **Abstract**
The primary question being asked in this project is how sports injures in the NBA can affect a given player's career and thus the impact on their long term health by measurement of life expectancy. It is important to conduct research and analyze data about the well-beings of competitive sports players to push overall medical incentives for sports medicine development and attention to creating better health plans. We plan to address this question by conducting a thorough analysis on NBA players who have been reported to suffer some form of injuries or illness that affected their participation in their careers as well as effects on their life expectancy.

## **Introduction**
  Basketball has always been an essential part of American sports. The National Basketball Association, NBA, has always been part of the top 3 big sports organization in attaining an ever growing popularity amongst pop culture and promotion of brands and industries in the U.S. However, with that much monetization and public support, risks in player safety and implications on health and wellness arise when it comes to contact sports like basketball. In the world of NBA, players suffering from physical minor injuries are quite common. To an extent, the type of injuries can vary in a broad spectrum of fatality, resulting in shortening of life or imminent death. NBA players deserve better medical treatments and services for the risk they are willing to take for the show and the positive impact on the U.S. economy. By developing this project, we hope to incentivize medical research in sports medicine and push for better health plans for NBA players as well as other players in prevalent sports in the U.S.

## **Problem Domain**
#### Project framing
  Our project is framed to link datasets regarding NBA injuries, and their consequences together in order to gauge how likely certain injuries are to result in long term and career ending ailments. This knowledge is meant to be used to understand certain injuries and give insights on how to best approach these injuries to prevent long term damage.
#### Direct Stakeholders
  The overall issue we are planning to address with this project effects a variety of people. Direct stakeholders include past athletes, current athletes and future athletes at all competitive levels and not necessarily just the NBA. In the article "In that Instant It was Over" the author states that nearly a third of career athletes will experience a career - ending injury (Loberg, 2009). Many of the injuries that will be addressed in our project span not just basketball but various sports as well. Furthermore, team owners are also direct stakeholders. Knowing how best to approach certain injuries and knowing which injuries will take their players out for an extensive period of time is vital knowledge to maintaining a team.
#### Indirect Stakeholders  
  Indirect stakeholders include but are not limited to, medical practitioners, their patients, and other people whose health can be positively or negatively effected by any discoveries made in this research.
#### Human Values  
  As humans we all value our health. According to John Hopkins Medicine, sports and recreational activity are responsible for nearly 21% of traumatic brain injuries among American children (2019). Clearly, by becoming an athlete one is putting their physical health at risk. Researching and understanding how certain injuries effect an athlete's career and long - term health can help point towards the direction treatments need to go in order to mitigate the damage of certain injuries.
#### Harms and Benefits
  The benefits of this project come from the insights that can be drawn from analyzing and understanding how certain sports injuries effect people in the long term. The harms however, lie in the fact that the NBA consists of mostly males. Male and female anatomy are different in a many ways, meaning certain injuries that effect a male may effect a female differently. Since this research is limited to tracking NBA injuries, this could be of harm to female athletes. For example, due to women having about 52% of the average upper body-strength of a male, females often receive more sports-related injuries than males (Gombera, 2020).  

## **Research Questions**

  * **"To what extent does the average sports injury result into a career - ending injury for NBA athletes"** This question seeks to address the how behind career - ending injuries, such as the types of injuries. This question is motivated by the need to identify which injuries will most likely be career ending.

  * **"In what ways does career - ending injuries affect NBA players and their long term physical health"** This question is important in identifying how specific injuries effect a person over the long term. This is motivated by the project's goal in identifying treatments for these kind of long - term injuries.

  * **"How can career - ending sports injuries best be treated to prevent further long - term physical damage"** The final research question is meant to find a medical understanding of how to use the prior information of which injuries are most dangerous, in order to develop ways to counteract the predetermined long-term effects.

## **The Dataset**
The datasets we will be using for this project are compromised by two different discussions. One type of dataset will explore the player career status in relations to the severity and types of injuries or illness. Another type of dataset will visualize the life expectancies of former NBA players as well as give insights to current players' life expectancy. By understanding the trend of injured players affecting their career and life expectancy, we can offer more insights on what injuries should be more concerned with and what can the medical faculties do to help prevent and treat these long term physical damage from affecting players' wellness and longevity. _Table 1_ concludes a list of datasets used in this project.

_Table 1. Summary of Datasets_

| Datasets | Observations | Variables | Citations |
|----------|--------------|-----------|-----------|
| injuries |     9784     |     5     | jaseziv83. “Extensive NBA Injuries Deep Dive Eda.” Kaggle, Kaggle, 23 Nov. 2018, https://www.kaggle.com/code/jaseziv83/extensive-nba-injuries-deep-dive-eda/report |
| nba-injury-report | 89  |     5     | Roto Sports, Inc. NBA Injury Report, 2022, https://www.rotowire.com/basketball/injury-report.php |
| NBA_raw_data2019 |  4375|     21    | Martínez, Jose A., et al. “Data Set on Mortality of National Basketball Association (NBA) Players.” Data in Brief, Elsevier, 17 Sept. 2022, https://www.sciencedirect.com/science/article/pii/S2352340922008216 |
| MortalityUSA2000to2018 | 85 |   9   | Martínez, Jose A., et al. “Data Set on Mortality of National Basketball Association (NBA) Players.” Data in Brief, Elsevier, 17 Sept. 2022, https://www.sciencedirect.com/science/article/pii/S2352340922008216 |

#### Provenance
 * **injuries** was collected by Randall Hopkins and further modified by Jason Zivkovic. The questions held accountable focused on the frequency of injuries due to teams and time of the year. This dataset was completed and up to date by 11/23/18. Because it was created on a data science social platform, it was not funded or put up for monetization. The source of the data was based off of a sports transaction database which is to document every transaction, such as trades, waiving, and injuries, in popular American sports leagues. Because the source of the dataset was an official documentation tracker and the collectors collaborated on a data science oriented social platform, the contents can be deemed accurate and trustworthy. This dataset was permitted for use by the creators with an incorporated download option.

 * **nba-injury-report** was collected by Roto Sports, Inc., a fantasy sports news website that often give useful insights and conduct sports betting on concurrent games. Many of its contents, such as the last column in this dataset, are locked behind subscriptions of funds from the users. Because this dataset was sourced from a corporation, credibility can be given to a certain extent. The audience of this data is targeted to the general public which allows a downloadable csv or excel file.

 * **NBA_raw_data2019** and **MortalityUSA2000to2018** were collected by a collaboration of creators of Hispanic origin on Sciencedirect, a website providing large bibliographic database of scientific and medical publications. With similar goals in mind, their project focused on tallying mortality rate to serve as information for NBA-related-associations and medical practitioners. Because this project was between private collaborators, it was not funded or returned any monetary values. The source was used from an official basketball statistic and history website for NBA and other sports associations. The dataset was given many references, author descriptions, and also provision of an open Github link, giving this dataset its utmost credibility.  

## **Limitations**
 With the data provided alongside the research questions we wish to answer and analyze, we must also identify the limitations prior to starting our analysis in order to consciously account for the possible constraints or impediments when drawing out conclusions based on our research. As previously stated, one of the biggest limitations would be the fact that a majority of the data provided was accounting male athletes. With noteworthy differences in anatomy between male and female athletes respectively, we may not be able to accurately summarize the proposed mitigation of sports injuries and increased physical health amongst the population as a whole as more data specific to female athletes could prove to show that different precautions or health side effects are at play depending on the sex of the athlete.
 Another potential limitation would be the idea of correlation v.s. causation when looking at the data of mortality amongst NBA players. We know that the majority of the athletes who are able to make it professional, not just within basketball, are genetically gifted. While this genetic component of the physical body may prove advantageous in the sport they play, there could be certain health defects that come alongside some of these traits, in basketball one in particular being the height of the athlete. So while we will attempt to analyze the extent to which these NBA athletes’ injuries affect their long term physical health, it is very possible that most of these gifted individuals were born with preexisting health concerns that would impact their lifelong fitness regardless of whether or not they participated in the sport, let alone faced injury.

## **Implications**
  Assuming we were able to accurately analyze the data provided and answer the research questions we created, our thoughts within this analysis could have many implications in the world outside the NBA for many different people such as technologists, designers, and policymakers. 
  For example, assuming we found a clear correlation between certain factors and their respective implications on the health and wellbeing of the athletes, current or future technologists and designers would be able to design strategic precautions within future projects, whether that be better equipment for the athletes to use during training to minimize chances of injuries, to shoe companies constructing better designs for ankle support and mobility to keep players injury free.
  The implications could go as far as outside the realms of the court and make its appearance as potential factors of consideration for policy makers when considering current or future policies on not just the health and wellbeing of NBA athletes, but all humans partaking in similar activities such as running, jumping, and athletic movements. By answering these key questions, we will hopefully be able to impact not only the health of our favorite NBA athletes, but also those partaking in any physical activity on or off the court.
