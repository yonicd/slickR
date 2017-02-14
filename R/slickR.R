#' @title slick.js image carousel htmlwidget
#'
#' @description use slick.js library in R
#' @param images character, vector of path or url to images
#' @param slideId character, id of slide
#' @param slideIdx list, numeric indices which images are mapped to which slider
#' @param synchSlides character, slideId names of sliders are synchronized
#' @param slickOpts list, list of attributes for each slider, see details
#' @param width character, width of htmlwidget
#' @param height character, height of htmlwidget
#' @param elementId character, id tag of htmlwidget
#' @import htmlwidgets
#' @details slick.js \url{http://kenwheeler.github.io/slick/} is an image carousel javascript library. To find all the attributes
#' that can be used please refer to the link. To create more than one carousel input the attributes into a nested list eg 
#' slickOpts=list(list(slidesToShow=1,slidestoScroll=1,arrows=F,fade=T),
#' list(slidesToShow=3,slidesToScroll=1,dots=T,focusOnSelect=T,centerMode=T)). It is possible to synchronize the slides
#' through the slickOpts calls, using asNavFor attribute. 
#' @examples 
#' a=c("ATL","BKN","BOS","CHA","CHI","CLE","DAL","DEN","DET","GSW",
#' "HOU","IND","LAC","LAL","MEM","MIA","MIL","MIN","NOP","NYK",
#' "OKC","ORL","PHI","PHX","POR","SAC","SAS","TOR","UTA","WAS")
#' x=sprintf("https://i.cdn.turner.com/nba/nba/.element/img/4.0/global/logos/512x512/bg.white/svg/%s.svg",a)
#' slickR(images=x)
#' 
#' @export
slickR <- function(images ,
                   slideId='baseDiv',
                   slideIdx=list(1:length(images)),
                   slickOpts=list(),
                   synchSlides=NULL,
                   width = NULL, 
                   height = NULL, 
                   elementId = NULL) {

  
  if(!is.character(images)) break('images must be a character vector')
  
  if(length(slideId)!=length(slideIdx)) slideId[xId]=paste0('baseDiv',xId)
  
  x = vector('list',length(slideIdx))
  
  for(xId in 1:length(x)){
    
    x[[xId]]$divName=tolower(slideId[xId])

    x[[xId]]$images=images[slideIdx[[xId]]]

    if(all(sapply(slickOpts,class)=='list')){
      sOL=slickOpts[[xId]]
    }else{
      sOL=slickOpts
    } 
   

    sO=lapply(sOL,function(x){
      if(inherits(x,'character')) x=sprintf('"%s"',x)
      x
    })

     if(!is.null(synchSlides)){
       sO$asNavFor=sprintf('".%s"',synchSlides[!(synchSlides%in%slideId[xId])])
     }
    
    if(!is.null(sO[[1]])) x[[xId]]$slickOpts = sprintf("{%s}",paste(sprintf('"%s"',names(sO)),tolower(as.character(sO)),sep=":",collapse = ","))

  }

  # forward options using x
  
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
