skip_on_windows <- function () {
  if (identical(.Platform$OS.type, "unix")) {
    return(invisible(TRUE))
  }
  skip("Non Unix")
}