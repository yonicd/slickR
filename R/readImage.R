#' @importFrom base64enc dataURI
#' @importFrom xml2 read_xml
readImage <- function(fL) {
  
  m_type <- substring(fL, first = regexpr("\\.[^\\.]*$", fL) + 1)
  
  if (m_type == "svg") {
    
    checkStandalone(fL)
    
    paste0(
      "data:image/svg+xml;utf8,"
      , as.character(xml2::read_xml(fL))
    )
    
  } else {
    
    base64enc::dataURI(file = fL, mime = sprintf("image/%s", m_type))
    
  }
}

#' @importFrom xml2 xml_ns read_xml
checkStandalone <- function(x){

  if(!inherits(x,c('xml_document','xml_node')))
    x <- xml2::read_xml(x)
  
  if(!length(xml2::xml_ns(x))){
    stop('SVG not standalone')
  }else{
    TRUE
  } 
}

hash_encode_url <- function(url){
  gsub("#", "%23", url)
}

as_svg_character <- function(x,...){
  x <- as.character(x)
  x <- paste0("data:image/svg+xml;utf8,", x)
  hash_encode_url(x)
}
