#' @title Create a DOM element for slickR
#' @description Wraps an R object in slickR compatible DOM
#' @param x object
#' @param css [css][htmltools::css] object, 
#' Default: htmltools::css(marginLeft='auto',marginRight='auto')
#' @param type character, type of DOM, Default: 'img'
#' @param links character, links to use on the input object, Default: NULL
#' @details 
#'  Method converts xml_document, htmlwidget, character, or list of objects
#'  to a compatible DOM
#' @return list of [tag][shiny::tag] objects
#' @examples 
#' 
#' # image
#' slick_div(nba_team_logo$uri[1])
#' 
#' # vector of images
#' slick_div(nba_team_logo$uri[c(1:5)])
#' 
#' # text
#' slick_div('abc',type = 'p')
#' 
#' @family html
#' @rdname slick_div
#' @export
slick_div <- function(x, css = htmltools::css(marginLeft='auto',marginRight='auto'), type = 'img', links = NULL){
  
  UseMethod('slick_div')
  
}

#' @importFrom htmltools css
#' @export
slick_div.list <- function(
  x,
  css = htmltools::css(marginLeft='auto',marginRight='auto'),
  type = 'img',
  links = NULL
){
  
  if(is.null(links)){
    lapply(x, slick_div, css = css, type = type)  
  }else{
    mapply(slick_div,x,links,
           MoreArgs = list(css = css, type = type),
           SIMPLIFY = FALSE,USE.NAMES = FALSE)
  }
  
}

#' @importFrom htmlwidgets saveWidget
#' @importFrom htmltools css
#' @export
slick_div.htmlwidget <- function(
  x,
  css = htmltools::css(marginLeft='auto',marginRight='auto'),
  type = 'iframe',
  links = NULL
){
  
  tf <- tempfile(fileext = '.html') 
  on.exit(unlink(tf,force = TRUE))
  htmlwidgets::saveWidget(x,file = tf)
  x_chr <- paste0(readLines(tf),collapse='\n')
  slick_tag(type,varArgs = list(srcdoc = x_chr, style = css))
}

#' @export
slick_div.character <- function(
  x,
  css = htmltools::css(marginLeft='auto',marginRight='auto'),
  type = 'img',
  links = NULL){
 
  if(is.null(links)){
    lapply(x, slick_div_chr, css = css, type = type)  
  }else{
    mapply(slick_div_chr,x,links,
           MoreArgs = list(css = css, type = type),
           SIMPLIFY = FALSE,USE.NAMES = FALSE)
  }
  
}

#' @export
slick_div.xml_document <- function(
  x,
  css = htmltools::css(marginLeft='auto',marginRight='auto'),
  type = 'img',
  links = NULL){
  
  slick_div(as_svg_character(x), css = css, type = type,links = links)
  
}
