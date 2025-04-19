create database pronetflix ;

use pronetflix ;

select * from netpro ;

show columns from netpro ;

# 1) Which genres have the highest average IMDb rating?
SELECT genres, AVG(imdb_rating) AS avg_rating
FROM netpro
GROUP BY genres
ORDER BY avg_rating DESC
LIMIT 10;


-- ------------------------------------------------------------------------------------------------
# 2) What are the most popular movies/TV shows based on IMDb votes?
SELECT title, avg(imdb_votes) as avg_votes
FROM netpro
group by title
ORDER BY avg_votes DESC
LIMIT 10;
-- ----------------------------------------------------------------------------------------------
 # 3)  Find titles in the same country and genre, but with IMDb vote difference over 10,000 ?
 
SELECT 
  a.title AS high_votes,
  b.title AS low_votes,
  a.countries,
  a.genres,
  a.imdb_votes AS votes_1,
  b.imdb_votes AS votes_2,
  ABS(a.imdb_votes - b.imdb_votes) AS vote_diff
FROM netpro a
JOIN netpro b 
  ON a.countries = b.countries 
  AND a.genres = b.genres 
  AND a.imdbid <> b.imdbid
WHERE ABS(a.imdb_votes - b.imdb_votes) > 10000;

-- ------------------------------------------------------------
# 4) Find the top 3 titles per country based on IMDb votes
SELECT
    ranked_titles.title,
    ranked_titles.country,
    ranked_titles.imdb_votes,
    ranked_titles.vote_rank
FROM (
    SELECT
        n.title,
        n.countries AS country,
        CAST(REPLACE(n.imdb_votes, ',', '') AS UNSIGNED) AS imdb_votes,
        ROW_NUMBER() OVER (PARTITION BY n.countries ORDER BY CAST(REPLACE(n.imdb_votes, ',', '') AS UNSIGNED) DESC) AS vote_rank
    FROM
        pronetflix.netpro n
    WHERE
        n.type = 'movie' OR n.type = 'show' -- Assuming you want to include both movies and shows
) AS ranked_titles
WHERE
    ranked_titles.vote_rank <= 3
ORDER BY
    ranked_titles.country, ranked_titles.vote_rank;
-- ----------------------------------------------------------------
# 5)  What are the most popular genres by decade?
SELECT 
  FLOOR(release_year / 10) * 10 AS decade,
  genres,
  COUNT(*) AS total_titles
FROM netpro
GROUP BY decade, genres
ORDER BY decade, total_titles DESC;
-- ---------------------------------------------------------------------------------------
# 6) Top 10 countries producing Netflix content
SELECT countries, COUNT(*) AS count
FROM netpro
GROUP BY countries
ORDER BY count DESC
LIMIT 10;
-- ------------------------------------------------------------------------------------------------
# 7) imdb_rating trend over the years

WITH year_rating AS (
SELECT release_year,
ROUND(AVG(imdb_rating), 2) AS avg_rating, 
COUNT(*) AS title_count
FROM netpro
WHERE imdb_rating IS NOT NULL
GROUP BY release_year)
SELECT p.title, p.release_year, yr.avg_rating, yr.title_count
FROM netpro as p
JOIN year_rating as yr 
ON p.release_year = yr.release_year
WHERE p.imdb_rating IS NOT NULL
ORDER BY p.release_year, p.title;
-- --------------------------------------------------------------------------
 # -- Find genres where the highest-rated title is more than 3x the votes of the lowest-rated in same genre

SELECT
    g_high.genres AS genre_name,
    a.title AS high_vote,
    b.title AS low_vote,
    CAST(REPLACE(a.imdb_votes, ',', '') AS UNSIGNED) AS high_votes,
    CAST(REPLACE(b.imdb_votes, ',', '') AS UNSIGNED) AS low_votes
FROM pronetflix.netpro a
JOIN pronetflix.netpro b ON a.genres = b.genres
AND a.title <> b.title
JOIN pronetflix.netpro g_high ON a.genres = g_high.genres -- Assuming 'genres' directly maps to genre name
JOIN pronetflix.netpro g_low ON b.genres = g_low.genres   -- Assuming 'genres' directly maps to genre name
WHERE CAST(REPLACE(a.imdb_votes, ',', '') AS UNSIGNED) > 3 * CAST(
REPLACE(b.imdb_votes, ',', '') AS UNSIGNED);

------------------------------------------------------------------------
# 9) Year-wise Number of Titles Produced by Each Country
SELECT countries, release_year, COUNT(*) AS title_count
FROM netpro
GROUP BY countries, release_year
ORDER BY release_year DESC, title_count DESC;
-- ----------------------------------------------------------------------------------------------------------
select * from pronetflix.netpro ;