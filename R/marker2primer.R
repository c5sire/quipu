marker2primer <- function(x) {
  m = stringr::str_split(x, "\\.") #%>% unlist %>% matrix(ncol = 2, byrow = TRUE)
  m = unlist(m)
  m = matrix(m, ncol = 2, byrow = TRUE)
  m
}