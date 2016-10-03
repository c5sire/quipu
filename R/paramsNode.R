paramsNode <- function(){
  shiny::tagList(
    shiny::sliderInput("nodeG1", "Node color (group 1)", 0.4, 2, 1.5, 0.1),
    shiny::sliderInput("nodeG2", "Node color (group 2)", 0.4, 2, 1.2, 0.1),
    shiny::sliderInput("nodeG3", "Node color (group 3)", 0.4, 2, 0.9, 0.1),
    shiny::sliderInput("nodeG4", "Node color (group 4)", 0.4, 2, 0.6, 0.1),
    
    shiny::selectInput("colorG1", "Choose a color for group 1", choices = grDevices::colors(), "red3"),
    shiny::selectInput("colorG2", "Choose a color for group 2", choices = grDevices::colors(), "green"),
    shiny::selectInput("colorG3", "Choose a color for group 3", choices = grDevices::colors(), "blue"),
    shiny::selectInput("colorG4", "Choose a color for group 4", choices = grDevices::colors(), "grey50")
  )
}

