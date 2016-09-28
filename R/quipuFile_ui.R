quipuFile_ui <- function(){
tagList(  
  fluidRow(
    column(width = 3,
     shinyFiles::shinyFilesButton('quipuFile', label='Data file', title='Please select a file', 
                     multiple=FALSE)
    ),
    column(width = 3,
     shinyFiles::shinyDirButton('quipuDir', label = 'Output directory', title = 'Select a directory')
    ),
    
    column(width = 6,
      shiny::selectInput("quipuAccId", "Choose an accession:", choices = NA)
    )
  ),
  fluidRow(
    column(width = 12,    
           textOutput("quipuGraphs")
    )
  )
)
}