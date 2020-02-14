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

#' @title slickpdf \lifecycle{deprecated}
#' @title convert pdf to slick
#' @description convert multiple pdfs or a multipage pdf to a slick carousel 
#' @param obj character, path to pdf(s)
#' @param obj2 character, path to pdf(s) to compare to obj, Default: NULL
#' @param synch boolean, if TRUE then obj and obj2 images are synchronized, Default: TRUE
#' @param img_format format of image to convert to, Default: 'png'
#' @param ... arguments passed to \code{\link[slickR]{slickR}}
#' @details This function has been replaced with the example in the PDF vignette.
#' @return slick
#' @rdname slickpdf
#' @importFrom  lifecycle deprecate_stop
#' @export 
slickpdf <- function(obj, obj2 = NULL, synch = TRUE, img_format = 'png', ...){
  lifecycle::deprecate_stop(when = "0.4.6", what = "slickR::slickpdf()")
}