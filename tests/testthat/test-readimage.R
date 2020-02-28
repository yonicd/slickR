testthat::context("read images")

testthat::describe('slick div method',{

  it('png',{
    testthat::expect_equal(
      readImage('../assets/img1.png'),
      readRDS('../assets/img1.Rds')
    )
  })
  
  it('svg',{
    testthat::expect_equal(
      slickR:::readImage('../assets/img2.svg'),
      readRDS('../assets/img2.Rds')
    )
  })
  
  it('svg not standalone',{
    testthat::expect_length(
      xml2::xml_ns(slickR:::svg_setup('../assets/not_standalone.svg')),
      2L)
  })
  
})