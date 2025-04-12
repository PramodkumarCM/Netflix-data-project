create database netflixproject ;
use netflixproject ;

SELECT * FROM netflix;

# -- Distribution of titles over years

SELECT releaseyear, COUNT(*) AS title_count
FROM netflix
GROUP BY releaseyear
ORDER BY releaseyear DESC;

-- This SQL query is used to analyze the distribution of Netflix titles by release year, 
-- giving you a clear view of how many titles were released each year. 
-- It helps identify trends, growth patterns, or shifts in content production over time.
-- -----------------------------------------------------------------
# -- Ratings trend over the years
WITH yearly_avg_ratings AS (
SELECT releaseyear, AVG(rating) AS avg_rating
FROM netflix
WHERE rating IS NOT NULL
AND releaseyear IS NOT NULL
GROUP BY releaseyear ),
rating_trend AS ( SELECT releaseyear, avg_rating, AVG(avg_rating) OVER ( ORDER BY releaseyear ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ) AS moving_avg_3_year
FROM yearly_avg_ratings)
SELECT releaseyear,
ROUND(avg_rating, 2) AS average_rating,
ROUND(moving_avg_3_year, 2) AS moving_avg_3_year
FROM rating_trend
ORDER BY releaseyear;


-- This query analyzes the average rating of Netflix titles over the years and 
-- introduces average to smooth out short-term fluctuations and highlight longer-term trends.

-- 1. yearly_avg_ratings CTE:
-- Calculates the average rating per release year (excluding NULLs).

-- 2. rating_trend CTE:
-- Applies a average using a window function to show how ratings evolve more smoothly over time.

-- 3. Final Output:
-- Shows each year with:

-- The average rating of that year
-- -------------------------------------------------------------------------------------------------
# -- Finding the most popular genres 
select * from netflix.netflix ;

use netflix ;

with popl_movie as 
(select genres, rating, 
RANK() over(order by rating desc) as poplr_rank
from netflix)
select genres , rating
from popl_movie 
where poplr_rank = 1 ;
# the most popular genres is 'Action', ' Drama', ' Thriller' and the rating to the genres about 9.6

-- This query is designed to identify the most popular genre(s) on Netflix by 
-- finding the highest-rated title(s) and retrieving their associated genre(s).

-- The WITH popl_movie AS (...) Common Table Expression (CTE) first ranks all titles based on 
-- their rating in descending order.

-- RANK() assigns a rank of 1 to the highest-rated title(s).

-- The outer query then selects the genre(s) and rating(s) of the top-ranked title(s) 
-- (i.e., poplr_rank = 1).

-- Top-Rated Genre(s) Identified

-- This result shows which genre(s) are associated with the highest-rated content on Netflix.

-- If multiple titles share the top rating, multiple genres may appear.
-- -------------------------------------------------------------------------------------------------------
SHOW COLUMNS FROM netflixproject.netflix ;
