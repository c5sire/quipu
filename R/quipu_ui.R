
#' quipu_ui
#'
#' @param title a name for the view
#' @author Reinhard Simon
#'
#' @return shiny object
#' @export
quipu_ui <- function(title = "Khipu") {
  shinydashboard::tabItem(tabName = title,
    fluidRow(
      column(width = 12,
       # box(width = NULL, collapsible = TRUE,
       #   title = "Data",
         tabBox("Details", width = 12,
            tabPanel("Source",
               fluidRow(
                 column(width = 6,     
                   quipuFile_ui(),
                   quipuLayout_ui()
                )
               )
            ),
            
            tabPanel("Data",
                     fluidRow(
                       column(width = 3,     
                          dataTableOutput("quipuTable")
                       )
                     )
            ),
            
            tabPanel("Tutorial",
                     #shiny::includeHTML(system.file("vignette"))
                     fluidRow(
                     #   column(width = 12,
                     # tags$iframe(style="height:600px; width:100%",
                     #             src=paste0("file:///", system.file("doc/Quipu_tutorial.pdf",  package = "quipu")))
                     # )
                      )
                     ),
            tabPanel("About")
         )
       )
      
    ) 
  )
}