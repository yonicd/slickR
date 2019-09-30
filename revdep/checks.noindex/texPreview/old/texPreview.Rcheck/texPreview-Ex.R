pkgname <- "texPreview"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('texPreview')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("build_usepackage")
### * build_usepackage

flush(stderr()); flush(stdout())

### Name: build_usepackage
### Title: Build usepackage command for TeX document
### Aliases: build_usepackage buildUsepackage

### ** Examples

build_usepackage(pkg = 'xcolor')
build_usepackage(pkg = 'xcolor',options = 'usenames')

#build many at once using mapply

geom.opts=c('paperwidth=35cm','paperheight=35cm','left=2.5cm','top=2.5cm')
use.opts="\\usetikzlibrary{mindmap,backgrounds}"

unlist(mapply(build_usepackage,
pkg =        list('times','geometry','tikz'),
options=     list(NULL   ,geom.opts ,NULL),
uselibrary = list(NULL   ,NULL      ,use.opts)
))



cleanEx()
nameEx("get_texpackages")
### * get_texpackages

flush(stderr()); flush(stdout())

### Name: get_texpackages
### Title: Get list of TeX packages installed on System
### Aliases: get_texpackages getTexPackages

### ** Examples

## Not run: head(get_texpackages())



cleanEx()
nameEx("tex_opts")
### * tex_opts

flush(stderr()); flush(stdout())

### Name: tex_opts
### Title: Default and current tex options
### Aliases: tex_opts tex_opts_current
### Keywords: datasets

### ** Examples

tex_opts$get('margin')



cleanEx()
nameEx("tex_preview")
### * tex_preview

flush(stderr()); flush(stdout())

### Name: tex_preview
### Title: Render and Preview snippets of TeX in R Viewer
### Aliases: tex_preview texPreview

### ** Examples

data('iris')
if(interactive()){

#use xtable to create tex output
 tex_preview(obj = xtable::xtable(head(iris,10)))

#use knitr kable to create tex output
 tex_preview(knitr::kable(mtcars, "latex"))

tex='\\begin{tabular}{llr}
\\hline
\\multicolumn{2}{c}{Item} \\\\
\\cline{1-2}
Animal    & Description & Price (\\$) \\\\
\\hline
Gnat      & per gram    & 13.65      \\\\
& each        & 0.01       \\\\
Gnu       & stuffed     & 92.50      \\\\
Emu       & stuffed     & 33.33      \\\\
Armadillo & frozen      & 8.99       \\\\
\\hline
\\end{tabular}'

tex_preview(obj = tex,stem = 'eq',imgFormat = 'svg')
tikz_example <- system.file('examples/tikz/credit-rationing.tex',package = 'texPreview')
tikzEx=readLines(tikz_example,warn = FALSE)

#use tex_lines parameter to pass full document
  tex_preview(tex_lines = tikzEx)

#use texPreview preamble to build document chunks
  usetikz <- paste(tikzEx[14:23],collapse="\n")
  bodytikz <- paste(tikzEx[25:90],collapse="\n")
  tex_preview(obj = bodytikz,usrPackages = build_usepackage(pkg = 'tikz',uselibrary = usetikz))
}



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
