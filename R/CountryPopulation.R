#' The CountryPopulation Function
#'
#' A function that when given a Country's name produces
#' a graph of the population from 1950 to 2020
#'
#' @param CountryInput Name of the country to plot
#' @return A graph of the country's population from 1950 to 2020.
#'
#' @examples
#' {
#' CountryPopulation("China")
#' CountryPopulation("Brazil")
#' }
#'@export
CountryPopulation <- function(CountryInput)
{
  library(tidyverse)
  library(ChristophWorldPopulation)

  if (!(CountryInput %in% ChristophWorldPopulation::WorldPopulation$Country_Name))
  {
    stop(paste("Error: The country", CountryInput, "does not exist in the WorldPopulation dataset."))
  }
  ChristophWorldPopulation::WorldPopulation %>%
    filter(Country_Name == CountryInput) %>%
    ggplot(aes(x = Year, y = Population)) +
    geom_point() +
    geom_line() +
    labs(
      title = paste("Population of", CountryInput),
      x = 'Year',
      y = 'Population'
    )
}

