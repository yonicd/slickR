#' @title Convert PDF into Images
#' @description Convert PDF document into images to pass into slickR
#' @param obj character, path to PDF document. Can be local or URL address.
#' @param dest character, local directory to write images to,  
#'   Default: file.path(tempdir(), "slick", "pdf")
#' @param img_format character, image format to convert to, Default: 'png'
#' @return character vector of files in destination directory
#' @examples 
#' if(interactive()){
#'   pdf_file <- system.file('examples/slickR.pdf',package = 'slickR')
#'   imgs <- slick_magick(pdf_file)
#'   slickR(imgs,height = 500)
#'  }
#' @rdname slick_magick
#' @export 

slick_magick <- function(obj, dest = file.path(tempdir(),'slick','pdf'), img_format = 'png'){
  
  if(!dir.exists(dest))
    dir.create(dest,recursive = TRUE)
  
  invisible(convert_images(obj, dest, img_format))
  
  list.files(dest,full.names = TRUE)
  
}

#' @importFrom magick image_read_pdf image_convert image_write
convert_images <- function(this_obj, this_td, img_format){
  
  image <- magick::image_read_pdf(path = this_obj, density = 150)
  
  image_c <- lapply(image, magick::image_convert,format = img_format, depth = 16)
  
  tf <- tempfile(tmpdir = this_td)
  
  lapply(seq_along(image_c),
         FUN = function(img){ 
           magick::image_write(
             image_c[[img]],
             format = img_format,
             path = sprintf('%s_%03d.%s',tf,img,img_format)
           )
         })
  
}
