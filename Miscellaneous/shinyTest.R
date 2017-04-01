library(slickR)
library(svglite)
library(lattice)
library(ggplot2)
library(shiny)


server <- function(input, output) {
  output$distPlot <- renderSlickR({
    slickR(s.in())
  })
  
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
      sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
    ),
    mainPanel(slickROutput("distPlot",width='400px',height='400px'))
  )
)

shinyApp(ui = ui, server = server)
