# app_ui

library(shiny)

# Clean Data
#----------------------------------------------------
nba_injuries <- read.csv("../data/injuries.csv")

nba_injuries <- nba_injuries %>% 
  mutate(Injuries = str_extract(Notes, "\\w+"),
         Status = str_extract(Notes, "(?<=\\()([^()]*?)(?=\\)[^()]*$)"),
         year = str_extract(Date, "....")
  )
#----------------------------------------------------

page_one <- tabPanel(
  "Introduction",
  titlePanel(
    strong("Injuries in the NBA: 
            Analyzing the Long Term Effects of Sports Injuries"),
  ),
  h4("What's Up?"),
  background,
  picture,
  h4("What's Next?"),
  action
)



page_two <- tabPanel(
  "Career Injuries",
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      plotlyOutput(outputId = "injuries")
    )
  )
)




ui <- fluidPage(
  navbarPage(
    "Stay_Ballin",
    page_one,
    page_two
  )
)
