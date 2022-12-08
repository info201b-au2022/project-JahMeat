library(shiny)
library(markdown)

source("app_server.R")
source("app_ui.R")

# Run the application 
shinyApp(ui = ui, server = server)
