

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
#' @param file_name a path for a data file
#' @author Reinhard Simon
#' @return a scores data frame with the map as attribute; or NULL if it cannot be read
#' @export
read_scores <- function(file_name = NULL){
  assert(file.exists(file_name), paste0("File '", file_name,"' does not exist."))
  out = NULL
  scores = NULL
  try({
  shts = readxl::excel_sheets(file_name)
  
  assert(all(c("scores", "map", "frequencies") %in% shts), "Excel sheet must contain two sheets names: 'scores' and 'map'")
  
  
  scores = readxl::read_excel(file_name, "scores")  
  map = readxl::read_excel(file_name, "map")
  frq = readxl::read_excel(file_name, "frequencies")
  
  attr(scores, "map") = map
  attr(scores, "frequencies") = frq
  
  # TODO consistency checks: all map names in score matrix, etc
  mp = marker2primer(names(scores)[-1])
  pr = unique(mp[, 1])
  assert(all(pr %in% map$primer), "All marker names must have corresponding primer names in the map sheet.")
  assert(all(!is.na(map$chromosome)), "The map file must not have a missing value for the chromosome.")
  
  pm = paste0(frq[, 1],".", frq[, 2])
  assert(all(names(scores)[-1] %in% pm), 
         paste("All marker names must have corresponding primer names in the frequencies sheet. Check:",
               paste(pm[!names(scores)[-1] %in% pm]), collapse = ", ")) 
  assert(all(!is.na(frq[, 3])), "The frequency table must not have any missing values. Check:")
  assert(all(0 < frq[, 3] & frq[, 3] < 1), "The frequency values must be between 0 and 1.")
  
  out = scores
  })

  out
}