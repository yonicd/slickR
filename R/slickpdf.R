#' @title convert pdf to slick
#' @description convert multiple pdfs or a multipage pdf to a slick carousel 
#' @param obj character, path to pdf(s)
#' @param obj2 character, path to pdf(s) to compare to obj, Default: NULL
#' @param synch boolean, if TRUE then obj and obj2 images are synchronized, Default: TRUE
#' @param img_format format of image to convert to, Default: 'png'
#' @param ... arguments passed to \code{\link[slickR]{slickR}}
#' @return slick
#' @examples 
#' if(interactive()){
#' 
#' url <- 'https://cran.r-project.org/web/packages/slickR/slickR.pdf'
#' 
#' slickpdf(url)
#' 
#' slickpdf(url,img_format = 'svg')
#' 
#' slickpdf(url, url, img_format = 'svg')
#' 
#' slickpdf(url, url, img_format = 'svg', height = 400, width ='90%')
#' 
#' slickpdf(url, url, synch = FALSE, img_format = 'svg', height = 400, width ='90%')
#' 
#' }
#'  
#'  
#' @details \href{https://github.com/ropensci/pdftools}{pdftools} must be installed for function to work. 
#' @rdname slickpdf
#' @export 
#' @seealso 
#'  \code{\link[magick]{image_read_pdf}}
slickpdf <- function(obj, obj2 = NULL, synch = TRUE, img_format = 'png', ...){
  
  td <- file.path(tempdir(),'slick','up')
  
  if(!dir.exists(td))
    dir.create(td,recursive = TRUE)
  
  if(!is.null(obj2)){
    td2 <- file.path(tempdir(),'slick','down')  
    
    if(!dir.exists(td2))
      dir.create(td2,recursive = TRUE)
  }
  
  
  on.exit(unlink(dirname(td),recursive = TRUE,force = TRUE),add = TRUE)
  
  invisible(lapply(seq_along(obj),FUN = convert_images, obj, td, img_format))
  
  if(!is.null(obj2)){
    invisible(lapply(seq_along(obj2),FUN = convert_images, obj2, td2, img_format))
    
    td_1 <- list.files(td,full.names = TRUE)
    td_2 <- list.files(td2,full.names = TRUE)
    
    slicks <- lapply(list(td_1,td_2),slickR,...)
    
    if(synch){
      Reduce(`%synch%`,slicks)
    }else{
      Reduce(`%stack%`,slicks)
    }
    
    
  }else{
    
    slickR(list.files(td,full.names = TRUE),...)
    
  }
  
  
  
}

#' @importFrom magick image_read_pdf image_convert image_write
convert_images <- function(x, this_obj, this_td, img_format){
  
  image <- magick::image_read_pdf(path = this_obj[x],density = 150)
  
  image_c <- lapply(image, magick::image_convert,format = img_format, depth = 16)
  
  tf <- file.path(this_td,basename(tempfile(fileext = sprintf('_%03d',x))))
  
  lapply(seq_along(image_c),
         FUN = function(img){ 
           magick::image_write(
             image_c[[img]],
             format = img_format,
             path = sprintf('%s_%03d.%s',tf,img,img_format)
           )
         })
  
}
