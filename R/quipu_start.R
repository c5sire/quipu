#' quipu_stquipu_start
#' @author Reinhard Simon
#' @export
quipu_start <- function(){
  shiny::runApp(system.file("khipu", package = "quipu"))
}