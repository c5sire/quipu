#' shiny server code
#'
#' @param input shiny input
#' @param output shiny output
#' @param session shiny session
#' @import shinyFiles
#' @import shiny
#' @author Reinhard Simon
#'
#' @return shiny
#' @export
quipu_sv <- function(input, output, session){
  vols <- getVolumes(c("(E:)", "Page File (F:)"))
  shinyFileChoose(input, 'quipuFile', roots = vols , session = session, 
                  filetypes = c('', 'xlsx'))
  shinyDirChoose(input, 'quipuDir', roots = vols , session = session)
  
  dataOutput <- reactive({
    req(input$quipuDir)
    quDrp = parseDirPath(vols, input$quipuDir)
    #quDrp = as.character(quDrf$datapath[1] )
    #message(quDrp)
    quDrp
  })
  
  dataInput <- reactive({
    req(input$quipuFile)
    quDf = parseFilePaths(vols, input$quipuFile)
    quDp = as.character(quDf$datapath[1] )
    withProgress({
      read_scores(quDp)  
    }, message = "Loading scoring data ...")
  })
  
  output$quipuTable <- renderDataTable({
    req(input$quipuFile)
    dataInput()
  })
  
  output$quipuGraphs <- renderPrint({
    do = dataOutput()
    message(do)
    paste0("Output directory for khipu graphs: ", do)
  })
  
  
  output$quipuPlot <- renderPlot({
    req(input$quipuFile)
    req(input$quipuAccId)
    if(is.na(input$quipuAccId)) return(NULL)
    withProgress({
      rquipu(dataInput(), input$quipuAccId, img.format = "screen",
             layout = input$quipuLayout,
             id.label = input$quipuIdLabel,
             show.desc = input$quipuShowTextBox,
             show.accs.total = input$quipuShowAccsTotal,
             set.name = input$quipuSetName,
             species.name = input$quipuSpeciesName
             )  
    }, message = "Creating plot ...")
  })
  
  observe({
    #input$quipuFile
    chc = dataInput()
    
    updateSelectInput(session, "quipuAccId", choices = chc$accession_id) #choices = chc$accession_id)
  })
  
  
}