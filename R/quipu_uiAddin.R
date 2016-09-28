
quipu_uiAddin <- function(title = "Khipu"){
  
  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Khipu Creator"),
    miniUI::miniTabstripPanel(selected = "Data",
                              
            miniUI::miniTabPanel("Data", icon = icon("table"),
                   miniUI::miniContentPanel(
                    quipuFile_ui()                         
                   )),                  
                              
            miniUI::miniTabPanel("Layout", icon = icon("list-alt"),
                  miniUI::miniContentPanel(
                  quipuLayout_ui()                         
              )))
  )
  
  server <- function(input, output, session) {
    
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