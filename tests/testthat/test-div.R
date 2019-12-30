testthat::context("divs")

test_css <- htmltools::css(marginLeft='auto',marginRight='auto')

testthat::describe('slick div types',{
  
  it('img default',{
    testthat::expect_equal(
      slick_div(nba_team_logo$uri[1]),
      list(htmltools::img(src =  as.character(nba_team_logo$uri[1]), style = test_css))
    )
  })
  
  it('img vector',{
    testthat::expect_equal(
      slick_div(nba_team_logo$uri[c(1,2)]),
      lapply(nba_team_logo$uri[c(1,2)], function(x,css) htmltools::img(src =  x, style = css),css = test_css)
    )
  })
  
  
  it('img file',{
    testthat::expect_equal(
      slick_div('../assets/img1.png'),
      list(htmltools::img(src =  readImage('../assets/img1.png'), style = test_css))
    )
  })
  
})
