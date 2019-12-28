slick_tag <- function(tag, varArgs, .noWS = NULL){
  htmltools::tag(tag,varArgs,.noWS)
}

#' @importFrom htmltools tagList tags
#' @export
slick_list <- function(...){
  
  if(inherits(...,'list')){
    dots <- c(...)
  }else{
    dots <- list(...)  
  }

  htmltools::tagList(
    lapply(dots,htmltools::tags$div)
  )
  
}

#' @export
slick_div <- function(x, css, type = 'img', links = NULL){
  
  UseMethod('slick_div')
  
}

#' @importFrom htmltools css
#' @export
slick_div.list <- function(
  x,
  css = htmltools::css(`marginLeft`='auto',`marginRight`='auto'),
  type = 'img',
  links = NULL
){
  
  if(is.null(links)){
    lapply(x, slick_div, css = css, type = type)  
  }else{
    mapply(slick_div,x,link,
           MoreArgs = list(css = css, type = type),
           SIMPLIFY = FALSE,USE.NAMES = FALSE)
  }
  
}

#' @importFrom htmlwidgets saveWidget
#' @importFrom htmltools css
#' @export
slick_div.htmlwidget <- function(
  x,
  css = htmltools::css(`marginLeft`='auto',`marginRight`='auto'),
  links = NULL
){
  
  tf <- tempfile(fileext = '.html') 
  on.exit(unlink(tf,force = TRUE))
  htmlwidgets::saveWidget(a,file = tf)
  x_chr <- paste0(readLines(tf),collapse='\n')
  slick_tag('iframe',varArgs = list(srcdoc = x_chr, style = css))
}

#' @export
slick_div.character <- function(
  x,
  css = htmltools::css(`marginLeft`='auto',`marginRight`='auto'),
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
  css = htmltools::css(`marginLeft`='auto',`marginRight`='auto'),
  type = 'img',
  links = NULL){
  
  slick_div(as_svg_character(x), css = css, type = type,links = links)
  
}

#' @importFrom utils file_test
slick_div_chr <- function(x, css, type = 'img', links = NULL){
  
    if(utils::file_test('-f',x)){
      
      ext <- tools::file_ext(x)
      
      x_img <- readImage(x)
      
      ret_tag <- slick_tag(type,varArgs = list(src = x_img, style = css))
      
    }else{
      
      ret_tag <-  switch(type,
             'p'= {
        
        ret_tag <- slick_tag(type,varArgs = list(x, style = css))
        
      },
      'iframe' = {
        
        slick_tag(type,varArgs = list(srcdoc = x, style = css))
        
      },
      {
        
        slick_tag(type,varArgs = list(src = x, style = css))
        
      })
      
    }
  
  if(length(links)>0){
    
    ret_tag <- htmltools::tags$a(ret_tag,href = links, target="_blank")
    
  }
  
  ret_tag
}

outer_div <- function(obj, id){
  
  new_id <- bump_name(id)  
  
  this_div <- htmltools::div(class = new_id, obj)
  
  ret <- htmltools::renderTags(this_div)
  
  attr(ret,'id') <- new_id
  
  ret
  
}

