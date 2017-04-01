devtools::install()
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
  

slickR(s.in,slideId = 'baseDiv',slideIdx = list(1:4))

slickR(s.in,slideId = c('up','down'),
       slideIdx = list(1:4,1:4),
       synchSlides = c('up','down'),
       slideType = c('img','img'),
       slickOpts = list(list(slidesToShow=1,slidesToScroll=1),
                        list(dots=T,slidesToScroll=1,slidesToShow=3,
                             centerMode=T,focusOnSelect=T)
                        )
       )

slickR(s.in,
       slideId = c('up','down'),
       slideIdx = list(1:3,1:3),
       slickOpts = list(list(slidesToShow=1,slidesToScroll=1,arrows=F,fade=T,asNavFor=".down"),
                        list(slidesToShow=3,slidesToScroll=1,asNavFor=".up",dots=T,centerMode=T,focusOnSelect=T)
       )
)
  

patchImg=function(patch,imgCh) paste0(patch,as.character(imgCh))

library(svglite)
svglite('./img/plot.svg',standalone = T)
plot(1:10)
dev.off()

xmlSVG(,standalone=TRUE)

x=paste0("data:image/svg+xml;utf8,",)
x.in=sapply(
  list(
     xmlSVG({plot(1:10)},standalone=TRUE),
     as.character(xml2::read_xml('./img/plot.svg')),
  )
  ,function(sv){
    paste0(
      "data:image/svg+xml;utf8,"
      ,as.character(sv)
    )
  }
)

x.in=sapply(c('img/plot.png','img/plot.jpeg'),function(fL){
  sf=strsplit(fL,'[.]')[[1]]
  ext=sprintf('image/%s',sf[[length(sf)]])
  base64enc::dataURI(file = fL,mime = ext) 
},simplify = T)


slickR(images=readImage('img/plot.png'))

png('img/plot.png')
plot(1:10)
dev.off()

jpeg('img/plot.jpeg')
plot(1:10)
dev.off()

tiff('img/plot.tiff')
plot(1:10)
dev.off()


