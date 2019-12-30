Tests and Coverage
================
30 December, 2019 17:21:04

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                             | Coverage (%) |
| :--------------------------------- | :----------: |
| slickR                             |    27.67     |
| [R/getHelp.R](../R/getHelp.R)      |     0.00     |
| [R/settings.R](../R/settings.R)    |     0.00     |
| [R/slickR.R](../R/slickR.R)        |     0.00     |
| [R/methods.R](../R/methods.R)      |    14.71     |
| [R/readImage.R](../R/readImage.R)  |    20.00     |
| [R/slick\_div.R](../R/slick_div.R) |    35.29     |
| [R/dom\_utils.R](../R/dom_utils.R) |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                              | n |  time | error | failed | skipped | warning |
| :-------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-div.R](testthat/test-div.R) | 9 | 0.042 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                      | context | test                         | status | n |  time |
| :---------------------------------------- | :------ | :--------------------------- | :----- | -: | ----: |
| [test-div.R](testthat/test-div.R#L8_L11)  | divs    | slick div types: img default | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L15_L18) | divs    | slick div types: img vector  | PASS   | 1 | 0.003 |
| [test-div.R](testthat/test-div.R#L22_L25) | divs    | slick div types: img file    | PASS   | 1 | 0.018 |
| [test-div.R](testthat/test-div.R#L29_L36) | divs    | slick div types: img link    | PASS   | 1 | 0.003 |
| [test-div.R](testthat/test-div.R#L40_L43) | divs    | slick div types: p           | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L47_L50) | divs    | slick div types: iframe      | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L57_L70) | divs    | slick list: dots             | PASS   | 1 | 0.006 |
| [test-div.R](testthat/test-div.R#L74_L87) | divs    | slick list: list             | PASS   | 1 | 0.003 |
| [test-div.R](testthat/test-div.R#L93_L97) | divs    | slick outer div: wrap div    | PASS   | 1 | 0.003 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.6.1 (2019-07-05)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS Mojave 10.14.5                |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.2.1   |
| covr     | 3.3.0   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
