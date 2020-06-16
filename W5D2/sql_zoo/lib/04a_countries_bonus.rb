# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      countries.name
    FROM
      countries
    WHERE
      countries.gdp > (
        SELECT
          MAX(countries2.gdp)
        FROM
          countries AS "countries2"
        WHERE
          countries2.continent = 'Europe'
      );
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      countries.continent, countries.name, countries.area
    FROM
      countries
    WHERE
      countries.area = (
        SELECT
          MAX(countries2.area)
        FROM
          countries AS "countries2"
        WHERE
          countries.continent = countries2.continent
      );
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
      countries.name, countries.continent
    FROM
      countries
    WHERE
      countries.population > 3 * (
        SELECT
          MAX(countries2.population)
        FROM
          countries AS "countries2"
        WHERE
          countries.continent = countries2.continent AND countries.name != countries2.name 
      );
  SQL
  #you want to exclude comparing the country's population with itself because it's going to return nothing
  # because its population willn never be > 3* of its own population
end
