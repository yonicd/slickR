#' @title slick.js image carousel htmlwidget
#' @description use slick.js library in R
#' @param obj character, vector of path or url to images
#' @param slideId character, id of slide, Default: 'baseDiv'
#' @param objLinks character, links to attach to images in slide, Default: NULL
#' @param slideType character, type of object to put in slide, Default: 'img'
#' @param slickOpts  \lifecycle{deprecated}
#' @param dotObj \lifecycle{deprecated}
#' @param synchSlides \lifecycle{deprecated}
#' @param padding numeric, percent of width between each image in the carousel 
#'   for each slider, Default: 1
#' @param width character, width of htmlwidget, Default: '95%'
#' @param height character, height of htmlwidget, Default: NULL
#' @param elementId character, id tag of htmlwidget, Default: NULL
#' @import htmlwidgets
#' @details 
#' 
#' [slick.js](http://kenwheeler.github.io/slick/) is an image carousel javascript library. 
#' 
#' To find all the attributes that can be used please refer to the link. 
#' 
#' It is possible to stack slides through the `%stack%` operator. 
#' 
#' It is possible to synchronize slides through the `%synch%` operator. 
#' 
#' To replace the dots with icons use the settings to define the  customPaging 
#' attribute with the appropriate JS(.) function call. 
#' 
#' The slideType accepts the type of html DOM you want to be in the slide, eg img, iframe.
#' 
#' The combination of slideType = 'img-lazy' and settings(lazyLoad = 'ondemand') will
#' inform the htmlwidget that the images are to be loaded lazily. 
#' For more information see the slickjs [documentation](http://kenwheeler.github.io/slick/).
#' 
#' @examples 
#' 
#' 
#' if(interactive()){
#' 
#' slick <- slickR(obj=nba_team_logo$uri)
#' 
#' slick
#'
#' # add dots to the first slick and autoplay at 1 second a slide
#'  
#' slick + settings(dots = TRUE, autoplay = TRUE, autoplaySpeed = 1000)
#'
#' 
#' # working with multiple slicks
#' 
#' sets <- split(
#'   sample(nba_team_logo$uri, size = 28, replace = FALSE),
#'   rep(c(1,2,3,4),each=7)
#' )
#' 
#' slicks <- lapply(sets,FUN = function(x,...){
#'   slickR(obj = x,...)
#' },height = 100)
#' 
#' # independent slicks
#' 
#' Reduce(`%stack%`,slicks)
#' 
#' # 1,2 synch stacked on 3,4 synch
#' 
#'  (slicks[[1]] %synch% slicks[[2]]) %stack% (slicks[[3]]%synch%slicks[[4]])
#'
#' }
#' @import htmlwidgets
#' @importFrom lifecycle deprecate_stop
#' @family invoke
#' @export
slickR <- function( obj ,
                    slideId   = 'baseDiv',
                    slideType = 'img',                    
                    objLinks  = NULL,
                    padding   = 1,
                    width     = '95%', 
                    height    = NULL,
                    elementId = NULL,
                    slickOpts = NULL,
                    synchSlides = NULL,
                    dotObj    = NULL) {
  
  # Deprecations
  
  if(!is.null(slickOpts)){
    lifecycle::deprecate_stop(when = "0.4.6", 
                              what = "slickR::slickR(slickOpts = )",
                              with = 'slickR::settings()')
  }
  
  if(!is.null(synchSlides)){
    lifecycle::deprecate_stop(when = "0.4.6", 
                              what = "slickR::slickR(synchSlides = )",
                              with = "slickR::`%synch%`()")
  }
  
  if(!is.null(dotObj)){
    lifecycle::deprecate_stop(when = "0.4.6", 
                              what = "slickR::slickR(dotObj = )",
                              with = "slickR::settings()")
  }
  
  checkmate::checkCharacter(height, null.ok = TRUE)
  checkmate::checkCharacter(width, null.ok = TRUE)
  
  if(is.null(height))
    height <- sprintf("%s%%",100 - padding)
  
  
  
  # If obj is not already DOM then convert to it
  
  if(!inherits(obj,'shiny.tag.list')){

    css_height <- height
    css_width <- width
    
    if(is.numeric(css_height))
      css_height <- sprintf('%spx',css_height)
    
    if(is.numeric(css_width))
      css_width <- sprintf('%spx',css_width)
    
    slick_css <- htmltools::css(
      width      = css_width, 
      height     = css_height,
      marginLeft ='auto',
      marginRight='auto')
        
    html_obj <- slick_div(
      x     = obj,
      css   = slick_css,
      type  = slideType,
      links = objLinks
    )
    
    obj <- slick_list(html_obj)
      
  }
  
  outer_obj <- outer_div(obj, id = slideId)
  
  # Populate list to pass to JS
  
  x <- list()
  
  x$obj     <- outer_obj$html
  
  x$divName <- attr(outer_obj,'id')
  
  x$slideh  <- height
  
  x$slidew  <- width
  
  htmlwidgets::createWidget(
    name      = 'slickR',
    x         = list(x),
    width     = width,
    height    = NULL,
    package   = 'slickR',
    elementId = elementId
  )

}
