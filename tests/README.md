Tests and Coverage
================
19 December, 2022 13:11:59

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| slickR                              |    84.52     |
| [R/deprecated.R](../R/deprecated.R) |     0.00     |
| [R/slick\_div.R](../R/slick_div.R)  |    66.67     |
| [R/readImage.R](../R/readImage.R)   |    73.33     |
| [R/slickR.R](../R/slickR.R)         |    76.92     |
| [R/dom\_utils.R](../R/dom_utils.R)  |    96.97     |
| [R/methods.R](../R/methods.R)       |    96.97     |
| [R/settings.R](../R/settings.R)     |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                             |  n |  time | error | failed | skipped | warning | icon |
| :----------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: | :--- |
| [test-div\_method.R](testthat/test-div_method.R) |  5 | 0.025 |     0 |      0 |       0 |       1 | ⚠️   |
| [test-div.R](testthat/test-div.R)                |  9 | 0.044 |     0 |      0 |       0 |       0 |      |
| [test-readimage.R](testthat/test-readimage.R)    |  3 | 0.020 |     0 |      0 |       0 |       0 |      |
| [test-widget.R](testthat/test-widget.R)          | 11 | 0.051 |     0 |      0 |       0 |       0 |      |

<details open>

<summary> Show Detailed Test Results </summary>

| file                                                     | context     | test                                       | status  | n |  time | icon |
| :------------------------------------------------------- | :---------- | :----------------------------------------- | :------ | -: | ----: | :--- |
| [test-div\_method.R](testthat/test-div_method.R#L8_L11)  | div methods | slick div method: shiny.tag                | PASS    | 1 | 0.004 |      |
| [test-div\_method.R](testthat/test-div_method.R#L15_L18) | div methods | slick div method: list                     | PASS    | 1 | 0.003 |      |
| [test-div\_method.R](testthat/test-div_method.R#L22_L29) | div methods | slick div method: list with link           | PASS    | 1 | 0.005 |      |
| [test-div\_method.R](testthat/test-div_method.R#L33_L39) | div methods | slick div method: xml                      | WARNING | 2 | 0.013 | ⚠️   |
| [test-div.R](testthat/test-div.R#L8_L11)                 | divs        | slick div types: img default               | PASS    | 1 | 0.002 |      |
| [test-div.R](testthat/test-div.R#L15_L18)                | divs        | slick div types: img vector                | PASS    | 1 | 0.002 |      |
| [test-div.R](testthat/test-div.R#L22_L25)                | divs        | slick div types: img file                  | PASS    | 1 | 0.020 |      |
| [test-div.R](testthat/test-div.R#L29_L36)                | divs        | slick div types: img link                  | PASS    | 1 | 0.002 |      |
| [test-div.R](testthat/test-div.R#L40_L43)                | divs        | slick div types: p                         | PASS    | 1 | 0.002 |      |
| [test-div.R](testthat/test-div.R#L47_L50)                | divs        | slick div types: iframe                    | PASS    | 1 | 0.002 |      |
| [test-div.R](testthat/test-div.R#L58_L71)                | divs        | slick list: dots                           | PASS    | 1 | 0.004 |      |
| [test-div.R](testthat/test-div.R#L75_L88)                | divs        | slick list: list                           | PASS    | 1 | 0.004 |      |
| [test-div.R](testthat/test-div.R#L94_L98)                | divs        | slick outer div: wrap div                  | PASS    | 1 | 0.006 |      |
| [test-readimage.R](testthat/test-readimage.R#L6_L9)      | read images | slick div method: png                      | PASS    | 1 | 0.010 |      |
| [test-readimage.R](testthat/test-readimage.R#L13_L16)    | read images | slick div method: svg                      | PASS    | 1 | 0.002 |      |
| [test-readimage.R](testthat/test-readimage.R#L21_L23)    | read images | slick div method: svg not standalone       | PASS    | 1 | 0.008 |      |
| [test-widget.R](testthat/test-widget.R#L22_L26)          | widget      | slickR widget: default                     | PASS    | 1 | 0.004 |      |
| [test-widget.R](testthat/test-widget.R#L30_L34)          | widget      | slickR widget: shiny.tag                   | PASS    | 1 | 0.003 |      |
| [test-widget.R](testthat/test-widget.R#L38_L42)          | widget      | slickR widget: css height                  | PASS    | 1 | 0.004 |      |
| [test-widget.R](testthat/test-widget.R#L50_L52)          | widget      | combining slickR: stack                    | PASS    | 1 | 0.003 |      |
| [test-widget.R](testthat/test-widget.R#L56_L58)          | widget      | combining slickR: synch                    | PASS    | 1 | 0.003 |      |
| [test-widget.R](testthat/test-widget.R#L62_L66)          | widget      | combining slickR: same name                | PASS    | 1 | 0.003 |      |
| [test-widget.R](testthat/test-widget.R#L70_L74)          | widget      | combining slickR: stack with setting       | PASS    | 1 | 0.003 |      |
| [test-widget.R](testthat/test-widget.R#L84)              | widget      | slickR settings: add dots                  | PASS    | 1 | 0.007 |      |
| [test-widget.R](testthat/test-widget.R#L88_L90)          | widget      | slickR settings: add setting to wrong side | PASS    | 1 | 0.007 |      |
| [test-widget.R](testthat/test-widget.R#L94_L97)          | widget      | slickR settings: bad name                  | PASS    | 1 | 0.007 |      |
| [test-widget.R](testthat/test-widget.R#L101_L104)        | widget      | slickR settings: bad class                 | PASS    | 1 | 0.007 |      |

| Failed | Warning | Skipped |
| :----- | :------ | :------ |
| 🛑      | ⚠️      | 🔶       |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |                                                                                                                                                                                                                                                                |
| :------- | :---------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.2.2 (2022-10-31)  |                                                                                                                                                                                                                                                                |
| Platform | x86\_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/slickR/commit/05e88ad950925e3243bc2580ad30547dec29ee88/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.1 LTS            |                                                                                                                                                                                                                                                                |
| Language | C                             |                                                                                                                                                                                                                                                                |
| Timezone | UTC                           |                                                                                                                                                                                                                                                                |

| Package  | Version |
| :------- | :------ |
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.1     |

</details>

<!--- Final Status : skipped/warning --->
