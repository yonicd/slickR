Tests and Coverage
================
12 December, 2020 20:19:47

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| slickR                              |    87.43     |
| [R/deprecated.R](../R/deprecated.R) |     0.00     |
| [R/slick\_div.R](../R/slick_div.R)  |    72.22     |
| [R/slickR.R](../R/slickR.R)         |    76.00     |
| [R/dom\_utils.R](../R/dom_utils.R)  |    96.97     |
| [R/methods.R](../R/methods.R)       |    97.06     |
| [R/readImage.R](../R/readImage.R)   |    100.00    |
| [R/settings.R](../R/settings.R)     |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                             |  n |  time | error | failed | skipped | warning |
| :----------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-div\_method.R](testthat/test-div_method.R) |  4 | 0.085 |     0 |      0 |       0 |       0 |
| [test-div.R](testthat/test-div.R)                |  9 | 0.050 |     0 |      0 |       0 |       0 |
| [test-readimage.R](testthat/test-readimage.R)    |  3 | 0.032 |     0 |      0 |       0 |       0 |
| [test-widget.R](testthat/test-widget.R)          | 11 | 0.073 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                     | context     | test                                       | status | n |  time |
| :------------------------------------------------------- | :---------- | :----------------------------------------- | :----- | -: | ----: |
| [test-div\_method.R](testthat/test-div_method.R#L8_L11)  | div methods | slick div method: shiny.tag                | PASS   | 1 | 0.003 |
| [test-div\_method.R](testthat/test-div_method.R#L15_L18) | div methods | slick div method: list                     | PASS   | 1 | 0.002 |
| [test-div\_method.R](testthat/test-div_method.R#L22_L29) | div methods | slick div method: list with link           | PASS   | 1 | 0.076 |
| [test-div\_method.R](testthat/test-div_method.R#L33_L39) | div methods | slick div method: xml                      | PASS   | 1 | 0.004 |
| [test-div.R](testthat/test-div.R#L8_L11)                 | divs        | slick div types: img default               | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L15_L18)                | divs        | slick div types: img vector                | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L22_L25)                | divs        | slick div types: img file                  | PASS   | 1 | 0.024 |
| [test-div.R](testthat/test-div.R#L29_L36)                | divs        | slick div types: img link                  | PASS   | 1 | 0.003 |
| [test-div.R](testthat/test-div.R#L40_L43)                | divs        | slick div types: p                         | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L47_L50)                | divs        | slick div types: iframe                    | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L58_L71)                | divs        | slick list: dots                           | PASS   | 1 | 0.004 |
| [test-div.R](testthat/test-div.R#L75_L88)                | divs        | slick list: list                           | PASS   | 1 | 0.004 |
| [test-div.R](testthat/test-div.R#L94_L98)                | divs        | slick outer div: wrap div                  | PASS   | 1 | 0.007 |
| [test-readimage.R](testthat/test-readimage.R#L6_L9)      | read images | slick div method: png                      | PASS   | 1 | 0.015 |
| [test-readimage.R](testthat/test-readimage.R#L13_L16)    | read images | slick div method: svg                      | PASS   | 1 | 0.003 |
| [test-readimage.R](testthat/test-readimage.R#L21_L23)    | read images | slick div method: svg not standalone       | PASS   | 1 | 0.014 |
| [test-widget.R](testthat/test-widget.R#L20_L24)          | widget      | slickR widget: default                     | PASS   | 1 | 0.005 |
| [test-widget.R](testthat/test-widget.R#L28_L32)          | widget      | slickR widget: shiny.tag                   | PASS   | 1 | 0.005 |
| [test-widget.R](testthat/test-widget.R#L36_L40)          | widget      | slickR widget: css height                  | PASS   | 1 | 0.006 |
| [test-widget.R](testthat/test-widget.R#L48_L50)          | widget      | combining slickR: stack                    | PASS   | 1 | 0.004 |
| [test-widget.R](testthat/test-widget.R#L54_L56)          | widget      | combining slickR: synch                    | PASS   | 1 | 0.004 |
| [test-widget.R](testthat/test-widget.R#L60_L64)          | widget      | combining slickR: same name                | PASS   | 1 | 0.003 |
| [test-widget.R](testthat/test-widget.R#L68_L72)          | widget      | combining slickR: stack with setting       | PASS   | 1 | 0.004 |
| [test-widget.R](testthat/test-widget.R#L80)              | widget      | slickR settings: add dots                  | PASS   | 1 | 0.004 |
| [test-widget.R](testthat/test-widget.R#L84_L86)          | widget      | slickR settings: add setting to wrong side | PASS   | 1 | 0.022 |
| [test-widget.R](testthat/test-widget.R#L90_L93)          | widget      | slickR settings: bad name                  | PASS   | 1 | 0.008 |
| [test-widget.R](testthat/test-widget.R#L97_L100)         | widget      | slickR settings: bad class                 | PASS   | 1 | 0.008 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                             |
| :------- | :-------------------------------- |
| Version  | R version 4.0.3 (2020-10-10)      |
| Platform | x86\_64-apple-darwin17.0 (64-bit) |
| Running  | macOS Catalina 10.15.7            |
| Language | en\_US                            |
| Timezone | UTC                               |

| Package  | Version |
| :------- | :------ |
| testthat | 3.0.0   |
| covr     | 3.3.2   |
| covrpage | 0.1     |

</details>

<!--- Final Status : pass --->
