library(shiny)
library(quipu)

data(potato.quipu)
dat = potato.quipu

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  
  # Generate a summary of the dataset
  output$quipuPlot <- renderPlot({
    # print(input$acc_id)
    rquipu(dat, a.subset = input$acc_id)
    #plot(1:10,1:10)
  })
  
})
