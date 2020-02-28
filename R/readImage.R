#' @importFrom base64enc dataURI
readImage <- function(fL) {
  
  m_type <- substring(fL, first = regexpr("\\.[^\\.]*$", fL) + 1)
  
  if (m_type == "svg") {
    
    as_svg_character(svg_setup(fL))

  } else {
    
    base64enc::dataURI(file = fL, mime = sprintf("image/%s", m_type))
    
  }
}

#' @importFrom xml2 xml_ns read_xml
svg_setup <- function(x){

  if(!inherits(x,c('xml_document','xml_node')))
    x <- xml2::read_xml(x)
  
  if(!length(xml2::xml_ns(x))){
    xml2::xml_set_attr(x,attr = 'xmlns',value = "http://www.w3.org/2000/svg")
    xml2::xml_set_attr(x,attr = 'xmlns:xlink',value = "http://www.w3.org/1999/xlink")
  }
  
  x
  
}

hash_encode_url <- function(url){
  gsub("#", "%23", url)
}

as_svg_character <- function(x,...){
  x <- as.character(x)
  x <- paste0("data:image/svg+xml;utf8,", x)
  hash_encode_url(x)
}
