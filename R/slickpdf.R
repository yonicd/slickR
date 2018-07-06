#' @title convert pdf to slick
#' @description convert multiple pdfs or a multipage pdf to a slick carousel 
#' @param obj path to pdf(s)
#' @param img_format format of image to convert to, Default: 'png'
#' @param ... arguments passed to \code{\link[slickR]{slickR}}
#' @return slick
#' @examples 
#' if(interactive()){
#' slickpdf('https://cran.r-project.org/web/packages/slickR/slickR.pdf')
#' 
#' slickpdf('https://cran.r-project.org/web/packages/slickR/slickR.pdf',imgFormat = 'svg')
#' }
#'  
#'  
#' @details \href{https://github.com/ropensci/pdftools}{pdftools} must be installed for function to work 
#' @rdname slickpdf
#' @export 
#' @seealso 
#'  \code{\link[magick]{image_read_pdf}}
#' @importFrom magick image_read_pdf image_convert image_write
slickpdf <- function(obj, img_format = 'png', ...){
  
  td <- file.path(tempdir(),'slick')
  if(!dir.exists(td))
    dir.create(td)
  
  on.exit(unlink(td,recursive = TRUE,force = TRUE),add = TRUE)
  
  invisible(lapply(seq_along(obj),FUN = function(x){
    
    image <- magick::image_read_pdf(path = obj[x],density = 150)
    
    image_c <- lapply(image, magick::image_convert,format = img_format, depth = 16)
    
    tf <- file.path(td,basename(tempfile(fileext = sprintf('_%03d',x))))
    
    lapply(seq_along(image_c),
           FUN = function(img){ 
             magick::image_write(
               image_c[[img]],
               format = img_format,
               path = sprintf('%s_%03d.%s',tf,img,img_format)
             )
           })
    
  }))
  
  slickR(list.files(td,full.names = TRUE), ... )
  
}