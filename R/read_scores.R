

#' read_scores
#'
#' Reads data from an Excel file. The file must have two sheets named 'scores' and 'map'.
#' 
#' The 'scores' sheet contains a matrix where the first column is named 'accession_id', and the 
#' following columns of the header row have marker names in the format: 'PRIMERID.123' where
#' PRIMERID is the name of the SSR primer and the 123 is a place holder for the base pair value.
#' The rows contain then scoring for each accession. These must be either 0 (absent), 1 (present)
#' or NA (no data).
#' 
#' TODO: accept more missing data values: -9, 9, -, ., ?
#' 
#' The 'map' sheet must have a table with two columns named 'primer' and 'chromosome'. The rows then
#' contain for each primer the corresponding chromosome id (in Roman numbers).
#'
#' @param file_name 
#' @author Reinhard Simon
#' @return a scores data frame with the map as attribute; or NULL if it cannot be read
#' @export
read_scores <- function(file_name = NULL){
  assert(file.exists(file_name), paste0("File '", file_name,"' does not exist."))
  scores = NULL
  try({
  shts = readxl::excel_sheets(file_name)
  
  assert(all(c("scores", "map") %in% shts), "Excel sheet must contain two sheets names: 'scores' and 'map'")
  
  
  scores = readxl::read_excel(file_name, "scores")  
  attr(scores, "map") = readxl::read_excel(file_name, "map")
  })

  scores
}