#' @export
getHelp=function(fn,pkg){
  paste0(
    capture.output({
      tools::Rd2HTML(
        Rd = utils:::.getHelpFile(utils:::index.search(fn, find.package(pkg), TRUE))
        )
      }),
    collapse='\n')
}