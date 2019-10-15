# slickR 0.4.6

* Add new settings functions to control the settings of a slick object
* Add new methods to stack and synch slick objects
* Deprecate slickOpts and synchSlides arguments in slickR
* Deprecate getHelp function
* Update underlying js libraries to current builds
* Update vignettes to the new functions and methods
* Refactor pkgdown site for documentation

# slickR 0.4.4

* Fix bug in htmlwidget to handle empty object links
* Change default of objLinks in slickR function to NULL

# slickR 0.4.3

* Soft deprecate arguments `slickOpts` and `synchSlides` in the function `slickR`
* Soft deprecate the function `getHelp`

# slickR 0.4.2

* Create package data for NBA logo data: `nba_team_logo` and `nba_player_logo`
* Rewrite usage vignette to use less imports in the `DESCRIPTION` file
* Split up the usage vignette to 3 vignettes: basics, plots, iframes

# slickR 0.4.1

* Added a `NEWS.md` file to track changes to the package.
* Convert gitbook of the package to pkgdown with vignettes
* Allow for user defined slideId in `slickpdf` instead of hardcoding it in the function
* Change how user inputs `synchSlides` option in `slickR` from a character to a data.frame, see [documentation](https://metrumresearchgroup.github.io/slickR/reference/slickR.html)
