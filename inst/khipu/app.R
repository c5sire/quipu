library(shiny)
library(shinydashboard)
library(rhandsontable)
library(shinyFiles)

ui <- dashboardPage(skin = "yellow",
                    dashboardHeader(title = "Khipu"),
                    dashboardSidebar(disable = TRUE),
                    
                    body = dashboardBody(
                      includeCSS("www/bootstrap.min.css"),
                      includeCSS("www/custom.css"),
                      quipu::quipu_ui("Khipu")
                    )
)

############################################################

sv <- function(input, output, session) ({
   quipu::quipu_sv(input, output, session)
})

shinyApp(ui, sv)
