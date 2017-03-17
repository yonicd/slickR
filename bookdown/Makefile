pdf:
	Rscript --quiet _render.R "bookdown::pdf_book"

loadUtils:
	R --vanilla -e '.libPaths("../script/lib");suppressMessages({library("ggplot2",character.only = T,warn.conflicts = F,quietly = T,verbose = F)});source("utils.R");source("buildChapters.R");warnings()'

gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"

openBrowser:
	R --vanilla -e 'browseURL("../docs/index.html")' 
all:
	Rscript --quiet _render.R
