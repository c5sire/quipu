quipuLayout_ui <- function(ids = paste0("sample.", 1:3)){

  shiny::tagList(
    shiny::fluidRow(
      shiny::column(width = 6,
        shiny::sliderInput("quipuWidth", label = "Chart width", min = 1500, max = 6000, value = 1500, step = 300)
        
      ),
      shiny::column(width = 6,
        shiny::selectInput("quipuChartFormat", label = "Chart format", c("screen", "png", "jpg"))
      )
    ),    
  shiny::fluidRow(
    shiny::column(width = 6,
           shiny::radioButtons("quipuLayout", "Layout", list("full","no text"), "full", inline = TRUE),
           shiny::conditionalPanel("input.quipuLayout == 'full'",
                       shiny::checkboxInput("quipuShowTextBox", "Show legend textbox",value = TRUE),
                       shiny::sliderInput("quipuTextSize", "Text size", min = 0.8, max = 5, value = .6)
           ),
           shiny::checkboxInput("quipuShowHorLines", "Show horizontal lines", value = TRUE),
           shiny::sliderInput("quipuVerLineSize", "Vertical line size", min = 1, max = 5, value = 2)
           ),
    shiny::column(width = 6,
                  shiny::conditionalPanel("input.quipuShowTextBox == true & input.quipuLayout == 'full'",
                      shiny::textInput("quipuIdLabel","Identifier label","ID label"),
                      shiny::textInput("quipuSpeciesName","Species name","Sample species"),
                      shiny::textInput("quipuSetName","Set name","Sample set"),
                      shiny::checkboxInput("quipuShowAccsTotal", "Show total of accesions", TRUE)
                  )                  
    )
  )
 
  )
}
  