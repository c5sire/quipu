quipuLayout_ui <- function(ids = paste0("sample.", 1:3)){

  tagList(
  selectInput("acc_id", "Choose an accession:", 
              choices = ids ),
  radioButtons("layout", "Layout",list("full","no text"), "full"),  
  textInput("idLabel","Identifier label","ID label"),
  textInput("speciesName","Species name","Sample species"),
  textInput("setName","Set name","Sample set"),
  
  sliderInput("nodeG1", "Node color (group 1)", 0.4, 2, 1.5, 0.1),
  sliderInput("nodeG2", "Node color (group 2)", 0.4, 2, 1.2, 0.1),
  sliderInput("nodeG3", "Node color (group 3)", 0.4, 2, 0.9, 0.1),
  sliderInput("nodeG4", "Node color (group 4)", 0.4, 2, 0.6, 0.1),
  
  selectInput("colorG1", "Choose a color for group 1", choices = colors(), "red3"),
  selectInput("colorG2", "Choose a color for group 2", choices = colors(), "green"),
  selectInput("colorG3", "Choose a color for group 3", choices = colors(), "blue"),
  selectInput("colorG4", "Choose a color for group 4", choices = colors(), "grey50")
  )
}
  