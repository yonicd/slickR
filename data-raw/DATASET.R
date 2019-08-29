library(rvest)
library(tidyr)
library(dplyr)
library(purrr)
library(xml2)

# NBA Team Logos
nba_teams <- c(
  "ATL", "BOS", "BKN", "CHA", "CHI", "CLE", "DAL", "DEN", "DET", "GSW",
  "HOU", "IND", "LAC", "LAL", "MEM", "MIA", "MIL", "MIN", "NOP", "NYK",
  "OKC", "ORL", "PHI", "PHX", "POR", "SAC", "SAS", "TOR", "UTA", "WAS"
)

nba_team_logo <- glue::glue("https://i.cdn.turner.com/nba/nba/.element/img/4.0/global/logos/512x512/bg.white/svg/{nba_teams}.svg")

# Player Images
a1 <- xml2::read_html("http://www.espn.com/nba/depth") %>% 
  rvest::html_nodes(css = "#my-teams-table a")

a2 <- a1 %>%
  rvest::html_attr("href")

a3 <- a1 %>% 
  rvest::html_text()

team_table <- xml2::read_html("http://www.espn.com/nba/depth") %>% 
  rvest::html_table()%>%
  purrr::flatten_df()%>%
  dplyr::slice(-c(1,2))

nba_player_logo <- team_table %>% 
  tidyr::gather('variable','value',-X1)%>%
  dplyr::arrange(X1, variable)

player_name <- a2[grepl('[0-9]/', a2)]

player_id <- gsub('\\/(.*?)$','',gsub('^(.*?)/id/','',player_name))

root <- 'http://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full'

nba_player_logo$img <- glue::glue("{root}/{player_id}.png&w=350&h=254")

names(nba_player_logo) <- c('team','position','name','uri')

nba_player_logo$position <- factor(nba_player_logo$position,labels = c('PG','SG','SF','PF','C'))

names(nba_team_logo) <- unique(nba_player_logo$team)

nba_team_logo <- tibble::enframe(nba_team_logo,name = 'team',value = 'uri')

usethis::use_data(nba_team_logo,overwrite = TRUE)
usethis::use_data(nba_player_logo,overwrite = TRUE)
