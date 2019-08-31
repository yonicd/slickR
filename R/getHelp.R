#' @title getHelp
#' @description return rd help file as html
#' @param fn character of function name
#' @param pkg name of package that contains fn
#' @return chracter
#' @importFrom  lifecycle deprecate_soft
#' @export
getHelp <- function(fn,pkg){
  
  lifecycle::deprecate_soft(when = "0.5.0", what = "slickR::getHelp()")
  
  ff <- get('index.search',envir = asNamespace('utils'))(
    topic = fn, 
    paths = find.package(pkg),
    TRUE)
  
  path    <- dirname(ff)
  dirpath <- dirname(path)
  pkgname <- basename(dirpath)
  RdDB    <- file.path(path, pkgname)
  
  paste0(
    utils::capture.output({
      tools::Rd2HTML(Rd = get('fetchRdDB', envir = asNamespace('tools'))(RdDB, basename(ff)))
    }),
  collapse='\n')
  
}


