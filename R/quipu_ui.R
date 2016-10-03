
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
                    shiny::plotOutput("quipuPlot")
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
                     shiny::fluidRow(
                     #   column(width = 12,
                     # tags$iframe(style="height:600px; width:100%",
                     #             src=paste0("file:///", system.file("doc/Quipu_tutorial.pdf",  package = "quipu")))
                     # )
                      )
                     ),
            shiny::tabPanel("About")
         )
       )
      
    ) 
  )
}