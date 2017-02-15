readImage=function(fL){
  mType=substring(fL,first=regexpr("\\.[^\\.]*$", fL)+1)
  if(mType=='svg'){
    if(!grepl('xml',readLines(fL,n = 1))) stop('svg not standalone')
    paste0(
      "data:image/svg+xml;utf8,"
      ,as.character(xml2::read_xml(fL))
    )
  }else{
    base64enc::dataURI(file = fL,mime = sprintf('image/%s',mType))  
  }
} 