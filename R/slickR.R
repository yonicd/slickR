#' @title slick.js image carousel htmlwidget
#'
#' @description use slick.js library in R
#' @param images character, vector of path or url to images
#' @param ... arguments to pass to slickjs, see details
#' @param width character, width of htmlwidget
#' @param height character, height of htmlwidget
#' @param elementId character, id tag of htmlwidget
#' @import htmlwidgets
#' @details slick.js \url{http://kenwheeler.github.io/slick/} is an image carousel javascript library.
#' to create more than one carousel input a a character vector `divName` and 
#' to control the width of images of the carousel use `imgWidth` (see example 2).
#' @examples 
#' require(rvest)
#' a=c("ATL","BKN","BOS","CHA","CHI","CLE","DAL","DEN","DET","GSW",
#' "HOU","IND","LAC","LAL","MEM","MIA","MIL","MIN","NOP","NYK",
#' "OKC","ORL","PHI","PHX","POR","SAC","SAS","TOR","UTA","WAS")
#' x=sprintf("https://i.cdn.turner.com/nba/nba/.element/img/4.0/global/logos/512x512/bg.white/svg/%s.svg",a)
#' slickR(images=x)
#' slickR(images = x,divName=c('slider-for','slider-nav'),imgWidth=c('50%','20%'))
#' 
#' @export
slickR <- function(images, ... , width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(...)
  x$images=images
  
  
  # create widget
  htmlwidgets::createWidget(
    name = 'slickR',
    x,
    width = width,
    height = height,
    package = 'slickR',
    elementId = elementId
  )
}

#' Shiny bindings for slickR
#'
#' Output and render functions for using slickR within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a slickR
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name slickR-shiny
#'
#' @export
slickROutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'slickR', width, height, package = 'slickR')
}

#' @rdname slickR-shiny
#' @export
renderSlickR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, slickROutput, env, quoted = TRUE)
}
