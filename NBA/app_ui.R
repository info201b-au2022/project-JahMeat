# app_ui

library(shiny)
library("shinythemes")

page_one <- tabPanel(
  "Introduction",
  titlePanel(
    strong("Injuries in the NBA: 
            Analyzing the Long Term Effects of Sports Injuries"),
  ),
  h4("What's Up?"),
  background,
  picture,
  p(strong("Kobe Bryant Tears Achillies' Tendon, Ending His Season in April 2013!")), 
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
      plotlyOutput(outputId = "injuries", width = "1100px", height = "700px")
    )
  )
)

slider <- range(table_under_30$kilos)
weight_widget <- sliderInput("kilo", label = h3("Weight(Kilograms)"), min = slider[1], max = slider[2], value = c(81.65,90))
  
dot_widget<- checkboxInput("dots", label = "Show Dots", value = FALSE)

page_three <- tabPanel(
  "Early Deaths", 
  sidebarLayout(
    sidebarPanel(
      weight_widget, 
      dot_widget
    ), 
    mainPanel(
      plotlyOutput(outputId = "deaths", width = "1100px", height = "700px")
    )
  )
)



ui <- fluidPage(theme = shinytheme("darkly"), 
  navbarPage(
    "Stay_Ballin",
    page_one,
    page_two, 
    page_three
  )
)
