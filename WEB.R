#IMPORTING LIBRABRIES
library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)
#SCRAPPING WEBSITE
url<- 'https://www.icc-cricket.com/rankings/mens/player-rankings/t20i/bowling'
#ALLOWABILITY
path = paths_allowed(url)

#HTML ELEMENT FROM WEBSITE
web<- read_html(url)
View(web)

#NO OF PLAYERS
no.=web%>% html_nodes("td:nth-child(1) > div > span")%>% html_text()
View(no.)

#NAMES
PLAY_names= web%>% html_nodes(".rankings-block__banner--name-large , .name a")%>% html_text()
View(PLAY_names)

#TEAMS
TEAM= web%>% html_nodes(".rankings-table__team , .rankings-block__banner--nationality")%>% html_text()
View(TEAM)

#RATING
RATING= web%>% html_nodes(".rating , .rankings-block__banner--rating")%>% html_text()
View(RATING)

#CARRER_RATE
CARRER_RATE= web%>% html_nodes(".table-body__cell.u-hide-phablet , .rankings-block__career-best-text")%>% html_text()
View(CARRER_RATE)

#DATAFRAME
PLAY_PROF= data.frame(no.,PLAY_names,TEAM,RATING,CARRER_RATE)
View(PLAY_PROF)

#WRITING CSV
write.csv(PLAY_PROF,"player profile.csv")
str(PLAY_PROF)
