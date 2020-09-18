<!-- badges: start -->
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/slickR)](https://cran.r-project.org/package=slickR)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) 
[![downloads](http://cranlogs.r-pkg.org/badges/slickR)](http://cranlogs.r-pkg.org/badges/slickR)
[![R-win build status](https://github.com/yonicd/slickR/workflows/R-win/badge.svg)](https://github.com/yonicd/slickR)
[![R-mac build status](https://github.com/yonicd/slickR/workflows/R-mac/badge.svg)](https://github.com/yonicd/slickR)
[![R-linux build status](https://github.com/yonicd/slickR/workflows/R-linux/badge.svg)](https://github.com/yonicd/slickR)
[![Codecov test coverage](https://codecov.io/gh/yonicd/slickR/branch/master/graph/badge.svg)](https://codecov.io/gh/yonicd/slickR?branch=master)
[![Covrpage Summary](https://img.shields.io/badge/covrpage-Last_Build_2020_09_18-brightgreen.svg)](http://tinyurl.com/tbqmb47)
<!-- badges: end -->

# slickR <img src="https://github.com/yonicd/slickR/raw/master/man/figures/logo.png" align="right"  class="logo"/>

__The last carousel you’ll ever need__

We are happy to bring the [slick](http://kenwheeler.github.io/slick/) JavaScript library to R. It is self described as "the last carousel you'll ever need". This carousel is based on putting the elements of the carousel in a [div](https://www.w3schools.com/tags/tag_div.asp) HTML tag. This makes the carousel very versatile in what can be placed inside. Regular objects that are placed in a carousel can be for example: images, plots, tables, gifs, videos and objects embedded in iframes.

![](https://raw.githubusercontent.com/yonicd/slickR/multimedia/Multimedia/slickRnestingWidgets.gif)

This tool helps review multiple outputs in an efficient manner and saves much needed space in documents and Shiny applications, while creating a user friendly experience.

These carousels can be used directly from the R console, from RStudio, in Shiny apps and R Markdown documents.

### Installation
[CRAN](https://cran.r-project.org/package=slickR)
```r
install.packages('slickR')
```

[Github](https://github.com/yonicd/slickR) (dev)
```r
remotes::install_github('yonicd/slickR')
```
