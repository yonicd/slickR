#' @title List of elements for slickR
#' @description Convert a list of [tags][htmltools::tags] into a list
#' that slickR can render
#' @param \dots Elements to convert
#' @return tagList
#' @examples 
#' 
#' img1 <- htmltools::img(src = nba_player_logo$uri[1])
#' img2 <- htmltools::img(src = nba_player_logo$uri[2])
#' 
#' slick_list(img1,img2)
#' 
#' @seealso 
#'  [tagList][htmltools::tagList], [tags][htmltools::tags]
#' @rdname slick_list
#' @export 
#' @importFrom htmltools tagList tags
slick_list <- function(...){
  
  dots <- list(...)
  
  if(length(dots)==1)
    if(inherits(dots[[1]],'list'))
      dots <- dots[[1]]
  
  htmltools::tagList(
    lapply(dots,htmltools::tags$div)
  )
  
}

#' @importFrom htmltools tag
slick_tag <- function(tag, varArgs, .noWS = NULL){
  htmltools::tag(tag,varArgs,.noWS)
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

