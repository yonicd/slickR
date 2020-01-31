library(slickR)

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

saveRDS(w1, 'tests/assets/widget1.Rds')
saveRDS(w2, 'tests/assets/widget2.Rds')

set.seed(123)
w <- slick_div(w1)
saveRDS(w,'tests/assets/slick_div_widget.Rds')


set.seed(123)
w <- slickR::slickR(nba_player_logo$uri[1],elementId = 'abc')
saveRDS(w, 'tests/assets/widget.Rds')

set.seed(123)
w <- slickR::slickR(slick_list(img),elementId = 'abc')
saveRDS(w,'tests/assets/widget_shiny_tag.Rds')

set.seed(123)
w <- slickR::slickR(nba_player_logo$uri[1],height = 100,width = 200, elementId = 'abc')
saveRDS(w,'tests/assets/widget_css_height.Rds')

w <- (w1 %stack% w2)
saveRDS(w,'tests/assets/widget_stack.Rds')

w <- (w1 %synch% w2)
saveRDS(w,'tests/assets/widget_synch.Rds')

set.seed(456)
w <- w1 %stack% w1
saveRDS(w,'tests/assets/widget_bumpname.Rds')

set.seed(456)
w <- (w1 + settings(dots = TRUE)) %stack% w1
saveRDS(w,'tests/assets/widget_stacksetting.Rds')

w <- w1 + settings(dots = TRUE)
saveRDS(w,'tests/assets/widget_settings.Rds')
