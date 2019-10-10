# source http://www.buildingwidgets.com/blog/2016/9/7/custom-styling-for-htmlwidgets
#' @importFrom htmltools tags
#' @importFrom htmlwidgets prependContent
style_widget <- function(hw=NULL, style="", addl_selector="") {
  
  stopifnot(!is.null(hw), inherits(hw, "htmlwidget"))
  
  if('shiny'%in%loadedNamespaces()){
    if(!is.null(get('getDefaultReactiveDomain',envir = asNamespace('shiny'))())){
      return(hw)
    }  
  }
  
  # use current id of htmlwidget if already specified
  elementId <- hw$elementId
  
  if(is.null(elementId)) {
    # borrow htmlwidgets unique id creator
    elementId <- sprintf(
      'htmlwidget-%s',
      get('createWidgetId',envir = asNamespace('htmlwidgets'))()
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

