#1.Using count, get the number of cities in the USA
SELECT city.CountryCode, COUNT(city.Name) AS Number_of_cities_in_the_usa
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'North America'
AND country.Name = 'United States'
GROUP BY city.CountryCode;



#4.Select 25 cities around the world that start with the letter 'F' in a single SQL query.
select name as cities_beginning_with_f
from city
where name like 'F%'
limit 25;

#5.Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.
select ID,Name,population 
from city 
limit 10 ;

#6.Create a SQL statement to find only those cities from city table whose population is larger than 2000000.
select population,name
from city
where population > 2000000;
#7.	Create a SQL statement to find all city names from city table whose name begins with “Be” prefix.
SELECT Name as cities_beginning_with_be
FROM city 
WHERE Name LIKE 'Be%';
#8.Create a SQL statement to find only those cities from city table whose population is between 500000-1000000.
SELECT Name, Population 
FROM city 
WHERE Population BETWEEN 500000 AND 1000000;

#9.Create a SQL statement to find a city with the lowest population in the city table.
SELECT Name, Population 
FROM city 
ORDER BY Population ASC 
LIMIT 1;

#10.Create a SQL statement to show the population of Switzerland and all the languages spoken there.
SELECT country.Population, countrylanguage.Language 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE country.Name = 'Switzerland';

#13: Create a SQL statement to find the capital of Spain (ESP).
SELECT city.name 
FROM city
JOIN country ON city.id = country.capital
WHERE country.code = 'ESP';

#14: Create a SQL statement to find the country with the highest life expectancy.
SELECT Name, lifeExpectancy 
FROM country
ORDER BY lifeExpectancy DESC
LIMIT 1;

#15: Create a SQL statement to find all cities from the Europe continent.
SELECT city.Name, country.Continent
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Continent = 'Europe';

#16: Create a SQL statement to find the most populated city in the city table.
SELECT name,population
from city
order by Population DESC
limit 1;
#17: Create a SQL statement to find the total population of each continent
select sum(population) as total_population,continent
from country
group by continent;

#18: Create a SQL statement to find the average life expectancy by continent 
select continent,avg(lifeExpectancy) as avergae_lifeExpectancy
from country
group by continent;
#19: Create a SQL statement to list the number of cities in each country
SELECT country.Name AS CountryName, COUNT(city.Name) AS NumberOfCities
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name;
#20: Create a SQL statement to find the total population of each country based on its cities
SELECT country.Name, SUM(city.Population) AS Total_Population
FROM city
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name;
#21: Create a SQL statement to find the most spoken language in each continent
SELECT 
    continent_counts.Continent,
    continent_counts.Language,
    continent_counts.language_count AS most_spoken
FROM (
    SELECT Continent,Language,COUNT(*) AS language_count
    FROM 
        countrylanguage
    JOIN 
        country ON countrylanguage.CountryCode = country.Code
    GROUP BY 
        country.Continent, countrylanguage.Language
) AS continent_counts
JOIN (
    SELECT 
        Continent,
        MAX(language_count) AS max_count
    FROM (
        SELECT 
            country.Continent,
            countrylanguage.Language,
            COUNT(*) AS language_count
        FROM 
            countrylanguage
        JOIN 
            country ON countrylanguage.CountryCode = country.Code
        GROUP BY 
            country.Continent, countrylanguage.Language
    ) AS counts
    GROUP BY 
        Continent
) AS max_counts
ON continent_counts.Continent = max_counts.Continent 
   AND continent_counts.language_count = max_counts.max_count;

select * from country;
#22: Create a SQL statement to find countries where the official language is either 'English', 'Spanish', or 'French'
SELECT country.Name,countrylanguage.Language

FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language IN ('English', 'Spanish', 'French') AND countrylanguage.IsOfficial = 'T';

#23: Write a query to display the total population for each continent.
SELECT Continent, SUM(Population) AS TotalPopulation
FROM country
GROUP BY Continent;

#24: Write a query to list countries that have more than three official languages. (joins, group by, having)
SELECT country.Name, COUNT(*) AS num_languages
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY country.Name
HAVING COUNT(*) > 3;

#25: Find countries whose population is greater than the average population of all countries.
SELECT Name, Population
FROM country
WHERE Population > (SELECT AVG(Population) FROM country);

select * from country;
select * from country;



