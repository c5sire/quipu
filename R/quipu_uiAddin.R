
#' quipu_uiAddin
#'
#' @param title a caption
#' @author Reinhard Simon
#' @return shiny
#' @export
quipu_uiAddin <- function(title = "Khipu"){
  
  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Khipu Creator"),
    miniUI::miniTabstripPanel(selected = "Parameters",
            miniUI::miniTabPanel("Parameters", icon = icon("list-alt"),
                  miniUI::miniContentPanel(padding = 0,
                  paramsBase_ui()                         
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