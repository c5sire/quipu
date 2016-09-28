
quipu_uiAddin <- function(title = "Khipu"){
  
  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Khipu Creator"),
    miniUI::miniTabstripPanel(selected = "Data",
                              
            miniUI::miniTabPanel("Data", icon = shiny::icon("table"),
                   miniUI::miniContentPanel(
                    quipuFile_ui()                         
                   )),
            miniUI::miniTabPanel("Layout", icon = shiny::icon("table"),
                                 miniUI::miniContentPanel(
                                   quipuLayout_ui()                         
                                 )),
                              
            miniUI::miniTabPanel("Alleles", icon = shiny::icon("list-alt"),
                  miniUI::miniContentPanel(
                  #quipuLayout_ui()                         
              )))
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