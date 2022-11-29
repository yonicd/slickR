testthat::context("widget")

test_dots <- htmlwidgets::JS("function(slick,index) {return '<a>'+(index+1)+'</a>';}")

img <- htmltools::tags$img(
  src = nba_player_logo$uri[1],
  style = htmltools::css(
    height = '100px', 
    marginLeft ='auto', 
    marginRight='auto')
)

set.seed(123)
w1 <- slickR::slickR(nba_player_logo$uri[1],elementId = 'abc')
w2 <- slickR::slickR(nba_player_logo$uri[1],elementId = 'def')

testthat::describe('slickR widget',{
  
  testthat::skip_if_not_installed("htmlwidgets", "1.6")
  
  it('default',{
    testthat::expect_equal(
      {set.seed(123)
      slickR::slickR(nba_player_logo$uri[1],elementId = 'abc')},
      readRDS('../assets/widget.Rds')
      )
  })
  
  it('shiny.tag',{
    testthat::expect_equal(
      {set.seed(123)
       slickR::slickR(slick_list(img),elementId = 'abc')},
      readRDS('../assets/widget_shiny_tag.Rds')
    )
  })
  
  it('css height',{
    testthat::expect_equal(
      {set.seed(123)
      slickR::slickR(nba_player_logo$uri[1],height = 100,width = 200, elementId = 'abc')},
      readRDS('../assets/widget_css_height.Rds')
    )
  })
  
})

testthat::describe('combining slickR',{
  
  it('stack',{
    testthat::expect_equal(
      (w1 %stack% w2),expected = readRDS('../assets/widget_stack.Rds')
    )
  })
  
  it('synch',{
    testthat::expect_equal(
      (w1 %synch% w2),expected = readRDS('../assets/widget_synch.Rds')
    )
  })
  
  it('same name',{
    testthat::expect_equal({
      set.seed(456)
      w1 %stack% w1
    },expected = readRDS('../assets/widget_bumpname.Rds')
    )
  })
  
  it('stack with setting',{
    testthat::expect_equal({
      set.seed(456)
      (w1 + settings(dots = TRUE)) %stack% w1
    },expected = readRDS('../assets/widget_stacksetting.Rds')
    )
  })
  
})

testthat::describe('slickR settings',{
  
  testthat::skip_if_not_installed("htmlwidgets", "1.6")
  
  it('add dots',{
    testthat::expect_equal(w1 + settings(dots = TRUE),readRDS('../assets/widget_settings.Rds'))  
  })
  
  it('add setting to wrong side',{
    testthat::expect_error(
      settings(dots = TRUE) %stack% w1,
      'right hand side')
  })
  
  it('bad name',{
    testthat::expect_error(
      settings(abc = TRUE),
      'not a valid element'
    )
  })
  
  it('bad class',{
    testthat::expect_error(
      settings(dots = 1),
      'must be of class'
    )
  })
})
