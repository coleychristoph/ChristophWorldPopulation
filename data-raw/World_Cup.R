library(tidyverse)
library(stringr)
library(lubridate)
library(dplyr)
library(readxl)

url = "https://en.wikipedia.org/wiki/FIFA_World_Cup"

World_Cup <- read_html(url)

World_Cup %>%
  html_nodes('table')

World_Cup %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE)

World_Cup<-
  World_Cup %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE)

World_Cup <- World_Cup %>%
  slice(-1 * c(1,2,25,26,27,28) ) %>%
  select(1, 2, 4, 5, 6) %>%
  magrittr::set_colnames(c('Year', 'Hosts', 'Totalattendance', 'Matches', 'Averageattendance'))

World_Cup <- World_Cup %>%
  mutate_at(vars(matches('attendance')), str_remove_all, ',') %>%
  mutate_at( vars( matches('attendance')), as.numeric)

World_Cup$WorldCup <- paste(World_Cup$Hosts, World_Cup$Year, sep = "")

World_Cup <- World_Cup %>%
  select(3, 4, 5, 6)

