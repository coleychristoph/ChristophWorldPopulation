#'Unit test to check if the function Country Populationn returns an error.
test_that('CountryPopulation prints an error if the Country is not present in the data set',
          {
            expect_error(CountryPopulation("Hawaii"))
            expect_error(CountryPopulation("Pizza"))
          })
