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
  
  it('img link',{
    testthat::expect_equal(
      slick_div(nba_player_logo$uri[1],links = nba_player_logo$player_home[1]),
      list(
        htmltools::a(
          htmltools::img(src =  nba_player_logo$uri[1], style = test_css),
          href = nba_player_logo$player_home[1], target="_blank"
        ))
    )
  })
  
  it('p',{
    testthat::expect_equal(
      slick_div('1234',type = 'p'),
      list(htmltools::p('1234', style = test_css))
    )
  })
  
  it('iframe',{
    testthat::expect_equal(
      slick_div('1234',type = 'iframe'),
      list(htmltools::tags$iframe(srcdoc = '1234', style = test_css))
    )
  })
  
})

testthat::describe('slick list',{
  
  it('dots',{
    testthat::expect_equal(
      slick_list(slick_div(nba_player_logo$uri[1],type = 'img'),
                 slick_div(nba_player_logo$uri[2],type = 'img')
                ),
      htmltools::tagList(
        list(htmltools::div(
          list(htmltools::img(src =  as.character(nba_player_logo$uri[1]), style = test_css))
          ),
        htmltools::div(
          list(htmltools::img(src =  as.character(nba_player_logo$uri[2]), style = test_css))
          )
        )
      )
    )
  })
  
  it('list',{
    testthat::expect_equal(
      slick_list(list(slick_div(nba_player_logo$uri[1],type = 'img'),
                 slick_div(nba_player_logo$uri[2],type = 'img'))
      ),
      htmltools::tagList(
        list(htmltools::div(
          list(htmltools::img(src =  as.character(nba_player_logo$uri[1]), style = test_css))
        ),
        htmltools::div(
          list(htmltools::img(src =  as.character(nba_player_logo$uri[2]), style = test_css))
        )
        )
      )
    )
  })
})

testthat::describe('slick outer div',{
  it('wrap div',{
    testthat::expect_equal(
      {set.seed(123)
      outer_div(slick_div(nba_team_logo$uri[1]),id = '123')},
      readRDS('../assets/outer_div.Rds')
    )
  })
})
