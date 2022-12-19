#' @title Shiny bindings for slickR
#'
#' @description Output and render functions for using slickR within Shiny
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
#' @family invoke
#' @importFrom htmlwidgets shinyWidgetOutput
#' @export
slickROutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'slickR', width, height, package = 'slickR')
}

#' @rdname slickR-shiny
#' @importFrom htmlwidgets shinyRenderWidget
#' @export
renderSlickR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, slickROutput, env, quoted = TRUE)
}
