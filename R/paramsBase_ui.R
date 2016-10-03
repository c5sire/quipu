quipuLayout_ui <- function(ids = paste0("sample.", 1:3)){

  shiny::tagList(
  shiny::fluidRow(
    shiny::column(width = 6,
           shiny::radioButtons("quipuLayout", "Layout",list("full","no text"), "full", inline = TRUE)
           ),
    shiny::column(width = 6,
           shiny::conditionalPanel("input.quipuLayout == 'full'",
                            shiny::textInput("quipuIdLabel","Identifier label","ID label")
           )
    )
  ),
  shiny::fluidRow(
    shiny::column(width = 6,
           shiny::conditionalPanel("input.quipuLayout == 'full'",
            shiny::checkboxInput("quipuShowTextBox", "Show legend textbox",value = TRUE)
           )
           ),
    shiny::column(width = 6,
           shiny::conditionalPanel("input.quipuShowTextBox == true & input.quipuLayout == 'full'",
                            shiny::textInput("quipuSpeciesName","Species name","Sample species"),
                            shiny::textInput("quipuSetName","Set name","Sample set"),
                            shiny::checkboxInput("quipuShowAccsTotal", "Show total of accesions", TRUE)
           )
    )
  )
  )
}
  