#' @export
slick_magick <- function(obj, dest = file.path(tempdir(),'slick','pdf'), img_format = 'png'){
  
  if(!dir.exists(dest))
    dir.create(dest,recursive = TRUE)
  
  invisible(lapply(seq_along(obj),FUN = convert_images, obj, dest, img_format))
  
  list.files(dest,full.names = TRUE)
  
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
