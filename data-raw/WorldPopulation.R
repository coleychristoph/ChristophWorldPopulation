library(tidyverse)
library(stringr)
library(lubridate)
library(dplyr)
library(readxl)

WorldPopulation <- read_excel('data-raw/World_Population.xlsx', sheet="ESTIMATES") %>%
  slice(-1 * c(1:11) )

colnames(WorldPopulation)[3] <- "Country_Name"

colnames(WorldPopulation)[8:78] <- as.character(1950:2020)

colnames(WorldPopulation)[6] <- "type"

WorldPopulation <- WorldPopulation %>%
  filter(!str_detect(type, "Region|region|subregion|Income|Group|Label|other")) %>%
  select('Country_Name', `1950`:`2020`) %>%
  slice(-1 * c(1,2) )

WorldPopulation <- WorldPopulation %>%
  pivot_longer(
    cols = `1950`:`2020`,
    names_to = "Year",
    values_to = "Population") %>%
  mutate(Year = as.numeric(Year),
         Population = as.numeric(Population))

