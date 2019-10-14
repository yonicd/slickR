#' @title slick.js image carousel htmlwidget
#'
#' @description use slick.js library in R
#' @param obj character, vector of path or url to images
#' @param slideId character, id of slide, Default: 'baseDiv'
#' @param objLinks character, links to attach to images in slide, Default: NULL
#' @param slideType character, type of object to put in slide, Default: 'img'
#' @param dotObj character, urls or images to replace dots with (see details), 
#'   Default: NULL
#' @param padding numeric, percent of width between each image in the carousel 
#'   for each slider, Default: 1
#' @param width character, width of htmlwidget, Default: '95\%'
#' @param height character, height of htmlwidget, Default: NULL
#' @param elementId character, id tag of htmlwidget, Default: NULL
#' @import htmlwidgets
#' @details 
#' 
#' slick.js \url{http://kenwheeler.github.io/slick/} is an image carousel javascript library. 
#' 
#' To find all the attributes that can be used please refer to the link. 
#' 
#' It is possible to stack slides through the `+` operator. 
#' 
#' It is possible to synchronize slides through the `*` operator. 
#' 
#' To replace the dots with icons use the dotObj argument to pass in the icon
#' images and in the slickOpts add a customPaging attribute with the appropriate JS(.) function call. 
#' 
#' The slideType accepts the type of html DOM you want to be in the slide, eg img, iframe.  
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
#' @export
slickR <- function( obj ,
                    slideId   = 'baseDiv',
                    objLinks  = NULL,
                    slideType = 'img',
                    padding   = 1,
                    dotObj    = NULL,
                    width     = '95%', 
                    height    = NULL,
                    elementId = NULL) {
  
  
  if(inherits(obj,'list')){
      if(all(sapply(obj,inherits, what = 'xml_document'))){
        obj <- unlist(lapply(obj,as_svg_character)) 
      }
  }
  
  if(inherits(obj, what = 'xml_document')){
    obj <- as_svg_character(obj)
  }
  
  # checks for input type
  checkmate::expect_class(obj,c('character'))
  
  img_str <- 'www[.]|http|https|data:image/|body|^<p'
  
  obj <- lapply(obj,function(x){
    if(!grepl(img_str,x)) x <- readImage(x)
    x
  })
  
  x <- list()
  
  if(slideType=='p')
    obj <- gsub('^<p>|</p>$','',obj)
  
  # populate elements to construct slick
  x$obj <- obj
  
  x$divName <- bump_name(slideId)
  
  if(!is.null(objLinks))
    x$links   <- objLinks
  
  x$divType <- slideType
  
  #padding around each element in obj
  
  if(length(padding)==1)
    padding <- rep(padding,length(obj))
  
  x$padding <- sprintf("%s%%",100 - padding)
  
  # replace dots with a different DOM/JS  
  
  if(!is.null(dotObj)) 
    x$dotObj <- dotObj
  
  htmlwidgets::createWidget(
    name = 'slickR',
    list(x),
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