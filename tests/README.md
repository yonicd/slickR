Tests and Coverage
================
30 December, 2019 16:02:13

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                             | Coverage (%) |
| :--------------------------------- | :----------: |
| slickR                             |    13.21     |
| [R/getHelp.R](../R/getHelp.R)      |     0.00     |
| [R/methods.R](../R/methods.R)      |     0.00     |
| [R/settings.R](../R/settings.R)    |     0.00     |
| [R/slickR.R](../R/slickR.R)        |     0.00     |
| [R/slick\_div.R](../R/slick_div.R) |    17.65     |
| [R/readImage.R](../R/readImage.R)  |    20.00     |
| [R/dom\_utils.R](../R/dom_utils.R) |    50.00     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                              | n |  time | error | failed | skipped | warning |
| :-------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-div.R](testthat/test-div.R) | 3 | 0.025 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                      | context | test                         | status | n |  time |
| :---------------------------------------- | :------ | :--------------------------- | :----- | -: | ----: |
| [test-div.R](testthat/test-div.R#L8_L11)  | divs    | slick div types: img default | PASS   | 1 | 0.002 |
| [test-div.R](testthat/test-div.R#L15_L18) | divs    | slick div types: img vector  | PASS   | 1 | 0.003 |
| [test-div.R](testthat/test-div.R#L23_L26) | divs    | slick div types: img file    | PASS   | 1 | 0.020 |

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
