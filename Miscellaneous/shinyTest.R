library(slickR)
library(svglite)
library(lattice)
library(ggplot2)
library(shiny)


server <- function(input, output) {
  
  output$slick <- renderSlickR({
    slickR(s.in(),slickOpts = list(slidesToShow=3, centerMode=TRUE))
  })
  
  network <- shiny::reactiveValues()
  
  shiny::observeEvent(input$slick_active,{
    active_selection <- input$slick_active$.active_index
    active_slide <- input$slick_active$.active_slide
    
    if(!is.null(active_selection)){
      network$active_index <- active_selection
      network$active_slide <- active_slide
      }
  })
  
  shiny::observeEvent(input$slick_clicked,{
    clicked_selection <- input$slick_clicked$.clicked_index
    clicked_slide <- input$slick_clicked$.clicked_slide
    
    if(!is.null(clicked_selection)){
      network$clicked_index <- clicked_selection
      network$clicked_slide <- clicked_slide
    }
  })
  
  output$active <- renderText(sprintf('active slide: %s, active object %s',
                                     network$active_slide,network$active_index))
  
  output$clicked <- renderText(sprintf('clicked slide: %s, clicked object %s',
                                        network$clicked_slide,network$clicked_index))
  
  s.in=reactive({
    sapply(
      list(
        xmlSVG({hist(rnorm(input$obs), col = 'darkgray', border = 'white')},standalone=TRUE)
        ,xmlSVG({print(xyplot(x~x,data.frame(x=1:10),type="l"))},standalone=TRUE)
        ,xmlSVG({show(ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,colour=Species))+geom_point())},standalone=TRUE)
        ,xmlSVG({
          print(
            dotplot(variety ~ yield | site , data = barley, groups = year,
                    key = simpleKey(levels(barley$year), space = "right"),
                    xlab = "Barley Yield (bushels/acre) ",
                    aspect=0.5, layout = c(1,6), ylab=NULL)        
          )
        },standalone=TRUE
        )
      )
      ,function(sv){
        paste0(
          "data:image/svg+xml;utf8,"
          ,as.character(sv)
        )
      }
    )
  })

}

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100),
      shiny::verbatimTextOutput('active'),
      shiny::verbatimTextOutput('clicked')
    ),
    mainPanel(slickROutput("slick",width='400px',height='400px'))
  )
)

shinyApp(ui = ui, server = server)
