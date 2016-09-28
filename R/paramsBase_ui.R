quipuLayout_ui <- function(ids = paste0("sample.", 1:3)){

  tagList(
  fluidRow(
    column(width = 6,
           radioButtons("quipuLayout", "Layout",list("full","no text"), "full", inline = TRUE)
           ),
    column(width = 6,
           conditionalPanel("input.quipuLayout == 'full'",
                            textInput("quipuIdLabel","Identifier label","ID label")
           )
    )
  ),
  fluidRow(
    column(width = 6,
           conditionalPanel("input.quipuLayout == 'full'",
            checkboxInput("quipuShowTextBox", "Show legend textbox",value = TRUE)
           )
           ),
    column(width = 6,
           conditionalPanel("input.quipuShowTextBox == true & input.quipuLayout == 'full'",
                            textInput("quipuSpeciesName","Species name","Sample species"),
                            textInput("quipuSetName","Set name","Sample set"),
                            checkboxInput("quipuShowAccsTotal", "Show total of accesions", TRUE)
           )
    )
  )
  )
}
  