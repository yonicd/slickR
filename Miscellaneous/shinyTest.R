library(slickR)
library(svglite)
library(lattice)
library(ggplot2)
library(shiny)


server <- function(input, output) {
  
  output$slick <- renderSlickR({
    slickR(s.in())
  })
  
  network <- shiny::reactiveValues()
  
  shiny::observeEvent(input$slick_update,{
    current_selection <- input$slick_update$.current_index
    current_slide <- input$slick_update$.current_slide
    
    if(!is.null(current_selection)){
      network$index <- current_selection
      network$slide <- current_slide
      }
  })
  
  output$index <- renderText(sprintf('slide: %s, object %s',network$slide,network$index))    
  
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
      shiny::verbatimTextOutput('index')
    ),
    mainPanel(slickROutput("slick",width='400px',height='400px'))
  )
)

shinyApp(ui = ui, server = server)
