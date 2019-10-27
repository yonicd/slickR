div_content <- function(this, this_link = NULL, this_type = 'img', width, height){
  
  div_css <- htmltools::css(
    `width` = width,
    `height` = height,
    `style.marginLeft`='auto',
    `style.marginRight`='auto')
  
  ret <- switch(this_type,
                'p' = {htmltools::tags[[this_type]](innerText = this, style = div_css)},
                'iframe' = {
                  htmltools::tags[[this_type]](src = this,style = div_css)
                 },{
                  htmltools::tags[[this_type]](src = this, style = div_css)
                 })
  
  if(length(this_link)>0){
    ret <- htmltools::a(ret,href = this_link, target="_blank")
  }
  
  htmltools::div(ret)
}

outer_div <- function(obj, id){

this_div <- htmltools::div(class = bump_name(id), obj)
  
htmltools::renderTags(this_div)

}
