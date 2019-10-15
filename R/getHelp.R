#' @title getHelp \lifecycle{deprecated}
#' @description return rd help file as html
#' @param fn character of function name
#' @param pkg name of package that contains fn
#' @return character
#' @details This function has been moved to the iframes vignette
#' @importFrom  lifecycle deprecate_stop
#' @export
getHelp <- function(fn,pkg){
  lifecycle::deprecate_stop(when = "0.4.6", what = "slickR::getHelp()")
}