# score data frame must have an attribut called map containing the mapping to chromosomes
scores2list <- function(scores){
  map = attr(scores, "map")
  primer = NULL
  bp = NULL
  x = tidyr::gather(scores,key = primer, value = bp, 2:ncol(scores))
  x = x[!is.na(x$bp), ]
  x = x[x$bp != 0, ]
  x = as.data.frame(x, stringsAsFactors = FALSE)
  x[, 1] = as.character(x[, 1])
  m = stringr::str_split(x$primer, "\\.") #%>% unlist %>% matrix(ncol = 2, byrow = TRUE)
  m = unlist(m)
  m = matrix(m, ncol = 2, byrow = TRUE)
  x = as.data.frame(cbind(x$accession_id, m), stringsAsFactors = FALSE)
  x[, 3] = as.integer(x[, 3])
  names(x) = c("accession_id", "primer", "marker_size")
  y=dplyr::full_join(x, map, by="primer")
  names(y) = c("accession_id", "primer_name", "marker_size", "map_location")
  y
}