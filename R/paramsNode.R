paramsNode <- function(){
  shiny::tagList(
    
    shiny::fluidRow(
      shiny::column(width = 4,
                    shiny::checkboxInput("quipuShowAlleleRange", "Show Allele Range", TRUE), 
                    shiny::conditionalPanel("input.quipuShowAlleleRange == true",
                                            shiny::sliderInput("quipuAlleleRange", label = "Allele range", min = 0, max = 1000, 
                                                               value = c(50, 350), step = 1)           
                    )
      ),
      shiny::column(width = 4,
                    shiny::sliderInput("quipuNodeG1Size", "Node size (group 1)", 0.4, 2, 1.5, 0.1),
                    shiny::sliderInput("quipuNodeG2Size", "Node size (group 2)", 0.4, 2, 1.2, 0.1),
                    shiny::sliderInput("quipuNodeG3Size", "Node size (group 3)", 0.4, 2, 0.9, 0.1),
                    shiny::sliderInput("quipuNodeG4Size", "Node size (group 4)", 0.4, 2, 0.6, 0.1)                    
      ),
      shiny::column(width = 4,
                    shiny::selectInput("quipuNodeG1Color", "Color group 1", choices = grDevices::colors(), "red3"),
                    shiny::selectInput("quipuNodeG2Color", "Color group 2", choices = grDevices::colors(), "green"),
                    shiny::selectInput("quipuNodeG3Color", "Color group 3", choices = grDevices::colors(), "blue"),
                    shiny::selectInput("quipuNodeG4Color", "Color group 4", choices = grDevices::colors(), "grey50")                    
      )
    )
    
    
    
    
  )
}

