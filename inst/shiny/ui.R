library(shiny)
library(quipu)

data(potato.quipu)
dat = potato.quipu

sort(unique(dat$accession_id))
ids = sort(unique(dat$accession_id))
# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title.
  headerPanel("Quipu demo"),
  
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view. The helpText function is also used to 
  # include clarifying text. Most notably, the inclusion of a 
  # submitButton defers the rendering of output until the user 
  # explicitly clicks the button (rather than doing it immediately
  # when inputs change). This is useful if the computations required
  # to render output are inordinately time-consuming.
  sidebarPanel(
   selectInput("acc_id", "Choose an accession:", 
                choices = ids ),
    
    
    helpText("Note: ")#,
    
    #submitButton("Update View")
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations. Note the use of the h4 function to provide
  # an additional header above each output section.
  mainPanel(
    
    plotOutput("quipuPlot")#,
    
    #h4("Observations")
  )
))
