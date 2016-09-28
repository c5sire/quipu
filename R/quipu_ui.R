
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
      paramsBase_ui()
    )  
  )
}