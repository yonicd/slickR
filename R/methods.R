#' @title Combine slickR carousels
#' @description Synchronize or Stack carousels
#' @param e1 slickR htmlwidget to place on top
#' @param e2 slickR htmlwidget to place on bottom
#' @return htmlwidget
#' @examples 
#' 
#' if(interactive()){
#' 
#' # working with multiple slicks
#' 
#' sets <- split(
#'   sample(nba_team_logo$uri, size = 28, replace = FALSE),
#'   rep(c(1,2,3,4),each=7)
#' )
#' 
#' slicks <- lapply(sets,FUN = function(x,...){
#'   slickR(obj = x,...)
#' },height = 100)
#' 
#' # independent slicks
#' 
#' Reduce(`%stack%`,slicks)
#' 
#' # 1,2 synch stacked on 3,4 synch
#' 
#'  (slicks[[1]] %synch% slicks[[2]]) %stack% (slicks[[3]]%synch%slicks[[4]])
#'  
#'}
#' @rdname slick_combine
#' @family methods
#' @export 

`%synch%` <- function(e1,e2){
  
  e2 <- e1%bump%e2
  
  for(i in length(e1$x)){
    
    if(is.null(e1$x[[i]]$slickOpts))
      e1$x[[i]]$slickOpts <- list()
    
    e1$x[[i]]$slickOpts[['asNavFor']] <- nav_name(e2)
  }
  for(i in length(e2$x)){
    
    if(is.null(e2$x[[i]]$slickOpts))
      e2$x[[i]]$slickOpts <- list()
    
    e2$x[[i]]$slickOpts[['asNavFor']] <- nav_name(e1)
  }
  
  e1 %stack% e2
  
}

#' @export
#' @rdname slick_combine
'%stack%' <- function(e1,e2){
  
  if(inherits(e1,'setting')&inherits(e2,'slickR')){
    
    err_txt    <- 'slick setting is being appended to a slick slide from the left hand side,'
    reason_txt <- '  it can only be added as a right hand side input.'
    help_txt   <- '  You probably need to add parenthesis to the prior ( slickR(...) + setting(...) )'
    return(stop(paste(err_txt,reason_txt,help_txt,sep = '\n')))
    
  }
  
  e2 <- e1%bump%e2
  
  e1$x <- append(e1$x,e2$x)  
  
  return(e1)
  
}

#' @export
#' @importFrom utils hasName
'+.slickR' <- function(e1,e2){
  
  if(!utils::hasName(e1$x[[1]],'slickOpts'))
    e1$x[[1]]$slickOpts <- list()  
  
  for(i in names(e2)){
    e1$x[[1]]$slickOpts[[i]] <- e2[[i]]
  }
  
  
  return(e1)
  
}

'%bump%' <- function(e1,e2){
  
  if(inherits(e1,'setting')){
    return(e2)
  }
  
  if(e1$x[[1]]$divName == e2$x[[1]]$divName)
    e2$x[[1]]$divName <- bump_name(e2$x[[1]]$divName)
  
  e2
}

bump_name <- function(e1){
  
  sprintf('%s_%s',
          gsub('_bump(.*?)$','',e1),
          rbump()
          )

}

#' @importFrom stats runif
rbump <- function(){
  gsub('0\\.','bump_',stats::runif(1))
}

nav_name <- function(e1){
  paste0(sprintf(".%s",sapply(e1$x,function(x) x$divName)),collapse = ',')
}