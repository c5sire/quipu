
quipu_uiAddin <- function(title = "Khipu"){
  
  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Khipu Creator"),
    miniUI::miniTabstripPanel(selected = "Data",
                              
            miniUI::miniTabPanel("Data", icon = shiny::icon("table"),
                   miniUI::miniContentPanel(
                    quipuFile_ui()                         
                   )),
            miniUI::miniTabPanel("Layout", icon = shiny::icon("image"),
                                 miniUI::miniContentPanel(
                                   shiny::fluidRow(
                                     shiny::column(width = 6, 
                                      quipuLayout_ui()
                                     ), 
                                     shiny::column(width = 6, 
                                      shiny::plotOutput("quipuPlot"),
                                      shiny::verbatimTextOutput("quipuOutFiles")
                                     )
                                   )
                                 )),
                              
            miniUI::miniTabPanel("Additional", icon = shiny::icon("list-alt"),
                  miniUI::miniContentPanel(
                  paramsNode()                         
              ))
            ,
            miniUI::miniTabPanel("About", icon = shiny::icon("info"),
                                 miniUI::miniContentPanel(
                                   htmlOutput('quipuAbout')
                                 )
            )
            
            )
  )
  
  server <- function(input, output, session) {
    
    quipu::quipu_sv(input, output, session)
    
    observeEvent(input$cancel, {
      msg = c("Khipu Creator cancelled. Bye!")
      stopApp(msg)
    })
    
    observeEvent(input$done, {
      msg = c("Khipu Creator closed. Bye!")
      
      stopApp(msg)
    })
    
  }
  
  viewer <- paneViewer(300)
  
  runGadget(ui, server, viewer = viewer)
  
}