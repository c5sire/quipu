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
  
  dataInDir <- reactive({
    req(input$quipuFile)
    quDf = parseFilePaths(vols, input$quipuFile)
    quDp = as.character(quDf$datapath[1] )
    quDp
  })
  
  dataInput <- reactive({
    quDp <- dataInDir()
    
    dat = withProgress({
      #tryCatchWE({
        read_scores(quDp)  
      #})
      
    }, message = "Loading scoring data ...")
    dat  
  })
  
  dataOutput <- reactive({
    #req(input$quipuDir)
    if(is.null(input$quipuDir)){
      quDrp = dirname(dataInDir())
    } else {
      quDrp = parseDirPath(vols, input$quipuDir)
    }
    quDrp
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
    
    yLimW = as.integer(input$quipuWidth)
    yLimH = yLimW / 5 * 4
    
    ltrSz = as.numeric(input$quipuTextSize)
    vLinW = as.integer(input$quipuVerLineSize)
    nSize = c(as.integer(input$quipuNodeG1Size),
              as.integer(input$quipuNodeG2Size), 
              as.integer(input$quipuNodeG3Size), 
              as.integer(input$quipuNodeG4Size) )
    nColr = c(input$quipuNodeG1Color,
              input$quipuNodeG2Color, 
              input$quipuNodeG3Color, 
              input$quipuNodeG4Color )
    
    # TODO when image format other than screen then redirect to directory and cycle through all accs
    nc = nrow(dataInput())
    ix = input$quipuAccId
    ft = input$quipuChartFormat
    if(input$quipuChartFormat != "screen") {
      ft = input$quipuChartFormat
      ix = "all"
    } else{
      nc = 1
    }
    # dt = dataOutput()
    # print(dt)
    # if(is.null(dt)){
    #   dt = getwd()
    # }

    withProgress({
      incProgress(1/nc)
      rquipu(dataInput(), ix, img.format = ft,
             layout = input$quipuLayout,
             id.label = input$quipuIdLabel,
             show.desc = input$quipuShowTextBox,
             show.accs.total = input$quipuShowAccsTotal,
             set.name = input$quipuSetName,
             species.name = input$quipuSpeciesName,
             res = c(yLimW, yLimH),
             ltr.size = ltrSz,
             vertical.lines.width = vLinW,
             show.horizontal.lines = input$quipuShowHorLines,
             show.size.range = input$quipuShowAlleleRange,
             node.size = nSize,
             col.node = nColr,
             dir.print = dataOutput()
             )  
    }, message = "Creating plot ...")
  })
  
  output$quipuOutFiles <- renderText({
    message(dataOutput())
    nmax = 10
    nx = length(list.files(dataOutput(), pattern = input$quipuChartFormat, full.names = TRUE))
    m = min(nmax, nx)
    paste("Chart image files (only first 10 files are listed):\n\n", 
          paste("\n",
            list.files(dataOutput(), pattern = input$quipuChartFormat, full.names = TRUE)[1:m], 
                collapse = "\n"))
          
  })
  
  observe({
    chc = dataInput()
    updateSelectInput(session, "quipuAccId", choices = chc$accession_id) #choices = chc$accession_id)
  })
  
  
  output$quipuHelp <- renderText({
    paste('<iframe style="height:600px; width:100%" src="',
          #system.file("doc/Quipu_tutorial.pdf", package = "quipu"),
          "Quipu_tutorial.pdf",
          '"></iframe>', sep = "")
    
  })
  
  output$quipuAbout <- renderUI({
    out = paste("R packages used:\n\n",
      paste0(names(utils::sessionInfo()$otherPkgs), collapse = ", "))
    
    x = utils::citation("quipu")
    tagList(
      p(paste0("Please cite:\n\n", x$`textVersion`)),
      p(out)
    )
  })
  
}