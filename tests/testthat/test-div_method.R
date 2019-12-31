testthat::context("div methods")

test_css <- htmltools::css(marginLeft='auto',marginRight='auto')

testthat::describe('slick div method',{
  
  it('list',{
    testthat::expect_equal(
      slick_div(list(nba_team_logo$uri[1])),
      list(list(htmltools::img(src =  as.character(nba_team_logo$uri[1]), style = test_css)))
    )
  })
  
  it('list with link',{
    testthat::expect_equal(
      slick_div(list(nba_player_logo$uri[1]),links = nba_player_logo$player_home[1]),
      list(list(
        htmltools::a(
          htmltools::img(src =  nba_player_logo$uri[1], style = test_css),
          href = nba_player_logo$player_home[1], target="_blank"
        )))
    )
  })

  it('xml',{
    testthat::expect_equal({
      # set.seed(123)
      # svglite::xmlSVG({plot(1:10)}, standalone = TRUE)
      slick_div(xml2::read_xml('../assets/method_test.xml'))
    },
      readRDS('../assets/xml_plot.Rds')
    )
  })

  it('widget',{
    testthat::expect_equal({
      slick_div(readRDS('../assets/widget1.Rds'))
      },
      readRDS('../assets/slick_div_widget.Rds')
    )
  })
})
