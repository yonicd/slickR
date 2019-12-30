library(magick)
library(bunny)
library(ggplot2)


mask <- image_blank(500,500)%>%
  image_annotate("R",
                 gravity = "center",
                 size=400,
                 font="Pacifico",
                 color = '#db3a34',
                 weight = 400)

slick_hex <- image_canvas_hex(
      fill_color = '#f6f3f9', 
      border_color = '#3498db', 
      border_size = 5
    ) %>%
    image_annotate("slick", 
                   gravity = "center", 
                   location = "-225+0", 
                   size=500, 
                   font="Pacifico", 
                   color = '#3498db', 
                   weight = 400)%>%
  image_compose(image_composite(
    image_blank(500, 500, pseudo_image = "gradient:#3498db-#db3a34")%>%
      image_rotate(degrees = 270),
      mask, operator = "CopyOpacity"),
                gravity = "center",
                offset = "+410+0")

text_color <- '#3498db'
R_color <- '#db3a34'

slick_hex_gh <- slick_hex %>%
  image_scale("400x400")

gh_logo <- bunny::github %>%
  image_scale("40x40")

slick_ghcard <- image_canvas_ghcard(fill_color = "#f6f3f9") %>%
  image_composite(slick_hex_gh, gravity = "East", offset = "+100+0") %>%
  image_annotate("The last carousel", gravity = "West",
                 location = "+0-60", size=75, font="Volkhov", weight = 500) %>%
  image_annotate("you'll ever need", gravity = "West",
                 location = "+0+20", size=75, font="Volkhov", weight = 500) %>%
  image_compose(gh_logo, gravity="West", offset = "+60+100") %>%
  image_annotate("metrumresearchgroup/slickR", gravity="West", 
                 location="+110+100", size=38, font="Ubuntu Mono") %>%
  image_border_ghcard("#f6f3f9")

slick_ghcard%>%
  image_scale('20%')

slick_hex %>%
  image_scale("1200x1200") %>%
  image_write("data-raw/slick_hex.png", density = 600)

slick_hex %>%
  image_scale("200x200") %>%
  image_write("man/figures/logo.png", density = 600)

slick_ghcard %>%
  image_write("data-raw/slick_ghcard.png", density = 600)


