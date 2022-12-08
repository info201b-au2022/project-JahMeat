# app_server

library(shiny)
library(tidyverse)
library(plotly)

source("chart_nba_injuries.R")
source("chart_nba_raw.R")

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

takeaway <- p("Each of these graphs address various takeaways. Firstly, the kinds of injuries
              that result in permanent, career ending damage. For example, surgery often leads to 
              players being out indefinitely. We can takeaway from this data the extent to which injuries are
              ending careers. For the most part, only surgery requiring injuries will damage a player for good.
              These kinds of injuries are relatively rare, implying that career ending injuries are rare. The 
              second takeaway our data gives is the extent to which under-age deaths occur in NBA players. Only 30
              players died under age 30 within our dataset. That being said, that is a very minimal 
              number of players. However, within those 30 players only 2 of them weighed above 110 kilograms,
              the other 28 below 110 kilograms. This implicates the possibility of weight being a factor in 
              death rates. Finally, the third takeaway from our data is that for the most part, the NBA does
              take proper protocol to ensure the safety of their players. All though injury is still common, 
              for the most part it is highly treatable.")


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
  
  observeEvent(input$submit, {
    
  if(input$vis == 1){
    output$visplot <- renderPlotly({
      nba_status <- nba_injuries %>% 
        group_by(Status, Injuries) %>% 
        mutate(frequency = length(Status)) %>% 
        filter(Status %in% status_frequency == TRUE) %>% 
        filter(Injuries %in% injury_frequency == TRUE)
      
      injury_plot <- ggplot(data = nba_status) +
        geom_col(
          aes(x = Status, y = frequency, fill = Injuries),
          position = "dodge"
        ) +
        labs( 
          title = "Most Common NBA Career Status caused by Types of Injuries 2010 - 2018",
          x = "NBA Career Status",
          y = "Number of Injuries"
        )
      return(injury_plot)
    })
      
  }
  
  if(input$vis == 2){
    output$visplot <- renderPlotly({
      table_under_30 <- nba_raw %>%
        filter(death == "Yes") %>%
        filter(ageevent <= 30) %>%
        summarise(ageevent, kilos ) 
      
      chart_under_30 <- table_under_30 %>%
        ggplot(aes(ageevent, kilos,
        )) +
        geom_point(size = 3, alpha = 0.5) +
        geom_line(size = 1)+
        labs(x = "Age", y = "Kilograms", title = "Weight and Age of NBA Players Who Died Below 30")
      theme_bw() 
      
      return(chart_under_30) 
    })
  }
    
})

}