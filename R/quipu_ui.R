
#' quipu_ui
#'
#' @param title a name for the view
#' @author Reinhard Simon
#'
#' @return shiny object
#' @export
quipu_ui <- function(title = "Khipu") {
  shinydashboard::tabItem(tabName = title,
    shiny::fluidRow(
      shiny::column(width = 12,
       # box(width = NULL, collapsible = TRUE,
       #   title = "Data",
         shinydashboard::tabBox("Details", width = 12,
            shiny::tabPanel("Source",
               shiny::fluidRow(
                 shiny::column(width = 6,     
                   quipuFile_ui(),
                   quipuLayout_ui()
                ),
                shiny::column(width = 6,
                    shiny::plotOutput("quipuPlot"),
                    shiny::verbatimTextOutput("quipuOutFiles")
                )
               )
            ),
            shiny::tabPanel("Additional Parameters",
                            shiny::fluidRow(
                              shiny::column(width = 12,     
                                            paramsNode()
                              )
                            )
            ),
            
            shiny::tabPanel("Data",
                     shiny::fluidRow(
                       shiny::column(width = 3,     
                                     shiny::dataTableOutput("quipuTable")
                       )
                     )
            ),
            
            shiny::tabPanel("Tutorial",
                     #shiny::includeHTML(system.file("vignette"))
                     # shiny::fluidRow(
                     #    column(width = 12,
                               htmlOutput('quipuHelp')
                      # )
                      # )
                     ),
            shiny::tabPanel("About",
                            htmlOutput('quipuAbout')
                            )
         )
       )
      
    ) 
  )
}