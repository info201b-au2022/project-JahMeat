# app_server

library(shiny)
library(tidyverse)
library(plotly)

source("../source/chart_nba_injuries.R")
source("../source/chart_nba_raw.R")

background <- p("This project is dedicated on incentivizing health well-being
                on injuries occuring in the NBA as well as giving additional
                insights what this could mean for the future of competitive
                sports. We are asking questions on", em("which types of injuries
                are the most detrimental to a player's career"), "in order to
                acknowledge the possible of in game risks. We are also seeking
                information on", em("how can injuries and player attributes affect
                their livelihood"), "to bring attention to the current state of their
                well-being.")

picture <- img( 
               src = "https://static01.nyt.com/images/2013/04/14/sports/subLAKERS/subLAKERS-superJumbo.jpg",
               width = 500, height = 300
               )

action <- p("We are tackling these questions by presenting some interative charts
            on NBA injuries, career status, and livelihoods based on data found on
            official records from the NBA that has been collected by the data science
            communities with similar goals as us. These data are utilized to inform
            medical practioners, NBA associations, and the public like you and me to
            better understand the seriousness of injuries in competitive sports in order
            to create better health plans and implement safety guidelines for these 
            passionate athletes.")


server <- function(input, output) {
  output$injuries <- renderPlotly({
    
    nba_status <- nba_injuries %>% 
      group_by(Status, Injuries) %>% 
      mutate(Population = length(Status)) %>% 
      filter(Status %in% status_frequency == TRUE) %>% 
      filter(Injuries %in% injury_frequency == TRUE) %>% 
      filter(Injuries %in% input$injury)

    injury_plot <- ggplot(data = nba_status) +
      geom_col(
        aes_string(x = "Status", y = "Population", fill = "Injuries"),
        position = input$position
      ) +
      labs( 
        title = "Most Common NBA Career Status caused by Types of Injuries 2010 - 2018",
        x = "NBA Career Status",
        y = if (input$position == "dodge") {
                "Number of Injuries"
        } else if (input$position == "fill") {
            "Frequency of Injuries"
          }
      )
    
    p <- ggplotly(injury_plot)
    return(p)
  })
  
  output$deaths <- renderPlotly({
    table_under_30 <- nba_raw %>%
      filter(death == "Yes") %>%
      filter(ageevent <= 30) %>%
      filter(kilos > input$kilo[1] & kilos < input$kilo[2]) %>% 
      summarise(ageevent, kilos ) 
    
    chart_under_30 <- table_under_30 %>%
      ggplot(aes(ageevent, kilos,
      )) +
      geom_line(size = 1)+
      labs(x = "Age", y = "Kilograms", title = "Weight and Age of NBA Players Who Died Below 30")
    
    if(input$dots == TRUE){
      chart_under_30 <- table_under_30 %>%
        ggplot(aes(ageevent, kilos,
        )) +
        geom_point(size = 3, alpha = 0.5) +
        labs(x = "Age", y = "Kilograms", title = "Weight and Age of NBA Players Who Died Below 30")
      
    }
    
    plot <- ggplotly(chart_under_30)
    return(plot)
  })

}