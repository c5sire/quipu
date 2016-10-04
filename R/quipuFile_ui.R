quipuFile_ui <- function(){
shiny::tagList(  
  shiny::fluidRow(
    shiny::column(width = 3,
     shinyFiles::shinyFilesButton('quipuFile', label='Data file', title='Please select a file', 
                     multiple=FALSE)
    ),
    shiny::column(width = 3,
     shinyFiles::shinyDirButton('quipuDir', label = 'Output directory', title = 'Select a directory'),
     shiny::textOutput("quipuGraphs")
    ),
    
    shiny::column(width = 6,
      shiny::selectInput("quipuAccId", "Choose an accession for display:", choices = NA)
    )
  )
  # ,
  # shiny::fluidRow(
  #   shiny::column(width = 12,    
  #                 shiny::textOutput("quipuGraphs")
  #   )
  # )
)
}