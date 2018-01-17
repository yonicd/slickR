# source http://www.buildingwidgets.com/blog/2016/9/7/custom-styling-for-htmlwidgets
#' @importFrom htmltools tags
#' @importFrom htmlwidgets prependContent
style_widget <- function(hw=NULL, style="", addl_selector="") {
  stopifnot(!is.null(hw), inherits(hw, "htmlwidget"))
  
  # use current id of htmlwidget if already specified
  elementId <- hw$elementId
  if(is.null(elementId)) {
    # borrow htmlwidgets unique id creator
    elementId <- sprintf(
      'htmlwidget-%s',
      createWidgetId()
    )
    hw$elementId <- elementId
  }
  htmlwidgets::prependContent(
    hw,
    htmltools::tags$style(
      sprintf(
        "#%s %s {%s}",
        elementId,
        addl_selector,
        style
      )
    )
  )
}

createWidgetId <- 
function (bytes = 10) 
{
  sysSeed <- .GlobalEnv$.Random.seed
  if (!is.null(.globals$idSeed)) {
    .GlobalEnv$.Random.seed <- .globals$idSeed
  }
  on.exit({
    .globals$idSeed <- .GlobalEnv$.Random.seed
    .GlobalEnv$.Random.seed <- sysSeed
  })
  paste(format(as.hexmode(sample(256, bytes, replace = TRUE) - 
                            1), width = 2), collapse = "")
}

environment(createWidgetId)=asNamespace('htmlwidgets')