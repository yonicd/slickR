Tests and Coverage
================
26 April, 2019 20:35:24

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr)
package.

| Object                                                    | Coverage (%) |
| :-------------------------------------------------------- | :----------: |
| texPreview                                                |    46.37     |
| [R/opts\_complete.R](../R/opts_complete.R)                |     0.00     |
| [R/texPreview-deprecated.R](../R/texPreview-deprecated.R) |     0.00     |
| [R/opts.R](../R/opts.R)                                   |     5.88     |
| [R/tex\_addin.R](../R/tex_addin.R)                        |    12.50     |
| [R/zzz.R](../R/zzz.R)                                     |    29.41     |
| [R/tex\_viewer.R](../R/tex_viewer.R)                      |    40.91     |
| [R/get\_texpackages.R](../R/get_texpackages.R)            |    50.00     |
| [R/tex\_dir\_setup.R](../R/tex_dir_setup.R)               |    78.95     |
| [R/tex\_image.R](../R/tex_image.R)                        |    80.00     |
| [R/tex\_return.R](../R/tex_return.R)                      |    80.00     |
| [R/build\_usepackage.R](../R/build_usepackage.R)          |    84.62     |
| [R/build\_lines.R](../R/build_lines.R)                    |    100.00    |
| [R/tex\_build.R](../R/tex_build.R)                        |    100.00    |
| [R/tex\_cleanup.R](../R/tex_cleanup.R)                    |    100.00    |
| [R/tex\_preview.R](../R/tex_preview.R)                    |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                          | n |  time | error | failed | skipped | warning |
| :-------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-tex.R](testthat/test-tex.R)             | 9 | 0.670 |     0 |      0 |       0 |       0 |
| [test-utilities.R](testthat/test-utilities.R) | 9 | 0.301 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                              | context                      | test                                              | status | n |  time |
| :------------------------------------------------ | :--------------------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-tex.R](testthat/test-tex.R#L31)             | core tex function            | porting to tex: files generated                   | PASS   | 1 | 0.017 |
| [test-tex.R](testthat/test-tex.R#L35)             | core tex function            | porting to tex: class of output                   | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L49)             | core tex function            | porting to tex no filedir: no files generated     | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L53)             | core tex function            | porting to tex no filedir: class of output        | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L67)             | core tex function            | keep pdf as an output: files generated            | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L71)             | core tex function            | keep pdf as an output: class of output            | PASS   | 1 | 0.001 |
| [test-tex.R](testthat/test-tex.R#L86)             | core tex function            | html output: return magick object                 | PASS   | 1 | 0.641 |
| [test-tex.R](testthat/test-tex.R#L115)            | core tex function            | tex lines directly input: validate benchmark      | PASS   | 1 | 0.002 |
| [test-tex.R](testthat/test-tex.R#L129)            | core tex function            | use svg device: check if file created             | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L10) | utility functions of package | build usepackage call: basic call                 | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L14) | utility functions of package | build usepackage call: check library is installed | PASS   | 1 | 0.138 |
| [test-utilities.R](testthat/test-utilities.R#L18) | utility functions of package | build usepackage call: add options                | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L22) | utility functions of package | build usepackage call: use bad library name       | PASS   | 1 | 0.140 |
| [test-utilities.R](testthat/test-utilities.R#L40) | utility functions of package | build usepackage multiple calls: class            | PASS   | 1 | 0.001 |
| [test-utilities.R](testthat/test-utilities.R#L44) | utility functions of package | build usepackage multiple calls: dimension        | PASS   | 1 | 0.002 |
| [test-utilities.R](testthat/test-utilities.R#L56) | utility functions of package | find packages: check class                        | PASS   | 2 | 0.003 |
| [test-utilities.R](testthat/test-utilities.R#L73) | utility functions of package | empty call to addin: cause addin to crash         | PASS   | 1 | 0.013 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS 10.14.4                       |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.1   |
| covr     | 3.2.1   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
