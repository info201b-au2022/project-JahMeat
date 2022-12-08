# app_ui

library(shiny)

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

injury_widget <- checkboxGroupInput(
  inputId = "injury", 
  label = h3("Types of Injuries"), 
  choices = list("bruised", 
                 "fractured", 
                 "illness",
                 "rest",
                 "right",
                 "sore",
                 "sprained",
                 "strained",
                 "surgery"
                 ),
  selected = "bruised"
  )

position_widget <- selectInput(
  inputId = "position", 
  label = h3("Comparisons?"), 
  choices = list("Stacked" = "fill", 
                 "Side-by-Side" = "dodge" 
                ), 
  selected = "dodge"
  )

page_two <- tabPanel(
  "Career Injuries",
  sidebarLayout(
    sidebarPanel(
      position_widget,
      injury_widget
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
