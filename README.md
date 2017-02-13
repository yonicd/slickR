# slickR
slick carousel htmlwidget for R

![](https://raw.githubusercontent.com/yonicd/slickR/master/slickRexample.gif)

## Examples for script generated plots

```r
library(slickR)
library(svglite)
library(lattice)
library(ggplot2)


s.in=sapply(
  list(
     xmlSVG({plot(1:10)},standalone=TRUE)
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
  

slickR(s.in)
slickR(s.in,divName=c('Up','Down'),imgWidth=c('100%','50%'))
  
```