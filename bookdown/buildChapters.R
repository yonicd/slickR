TOC=queryChapter(pattern = c('^geom_'),field = 'name',pkg='ggplot2')
TOC$output='figure'
createChapter('Figures','01',funs = list(name=TOC$Name[TOC$output=='figure'][-24],pkg='ggplot2',type='figure'))
