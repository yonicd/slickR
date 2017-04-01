#' @title getHelp
#' @description return rd help file as html
#' @param fn character of function name
#' @param pkg name of package that contains fn
#' @return chracter
#' @export
getHelp=function(fn,pkg){
  paste0(
    utils::capture.output({
      tools::Rd2HTML(
        Rd = getHelpFile(index.search(fn, find.package(pkg), TRUE))
        )
      }),
    collapse='\n')
}

getHelpFile<-function (file) 
{
  path <- dirname(file)
  dirpath <- dirname(path)
  if (!file.exists(dirpath)) 
    stop(gettextf("invalid %s argument", sQuote("file")), 
         domain = NA)
  pkgname <- basename(dirpath)
  RdDB <- file.path(path, pkgname)
  if (!file.exists(paste(RdDB, "rdx", sep = "."))) 
    stop(gettextf("package %s exists but was not installed under R >= 2.10.0 so help cannot be accessed", 
                  sQuote(pkgname)), domain = NA)
  fetchRdDB(RdDB, basename(file))
}

fetchRdDB<-function (filebase, key = NULL) 
{
  fun <- function(db) {
    vals <- db$vals
    vars <- db$vars
    datafile <- db$datafile
    compressed <- db$compressed
    envhook <- db$envhook
    fetch <- function(key) lazyLoadDBfetch(vals[key][[1L]], 
                                           datafile, compressed, envhook)
    if (length(key)) {
      if (!key %in% vars) 
        stop(gettextf("No help on %s found in RdDB %s", 
                      sQuote(key), sQuote(filebase)), domain = NA)
      fetch(key)
    }
    else {
      res <- lapply(vars, fetch)
      names(res) <- vars
      res
    }
  }
  res <- lazyLoadDBexec(filebase, fun)
  if (length(key)) 
    res
  else invisible(res)
}

index.search<-function (topic, paths, firstOnly = FALSE) 
{
  res <- character()
  for (p in paths) {
    if (file.exists(f <- file.path(p, "help", "aliases.rds"))) 
      al <- readRDS(f)
    else if (file.exists(f <- file.path(p, "help", "AnIndex"))) {
      foo <- scan(f, what = list(a = "", b = ""), sep = "\t", 
                  quote = "", na.strings = "", quiet = TRUE)
      al <- structure(foo$b, names = foo$a)
    }
    else next
    f <- al[topic]
    if (is.na(f)) 
      next
    res <- c(res, file.path(p, "help", f))
    if (firstOnly) 
      break
  }
  res
}