-- Netflix Project

CREATE TABLE netflix
(
	show_id VARCHAR(10),
	type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);

SELECT * FROM netflix;

-- 1. Count the number of Movies vs TV Shows
SELECT type, COUNT(*) as total_content 
FROM netflix
GROUP BY type;


-- 2. Find the most common rating for movies and TV shows
SELECT * 
FROM
(
	SELECT
	 	type, rating, COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
	FROM netflix
	GROUP BY 1,2 
	ORDER BY 1,3 DESC
)
WHERE
	ranking = 1

-- 3. List all movies released in a specific year (e.g., 2020)

SELECT *
FROM netflix
WHERE 
	type = 'Movie'
	AND
	release_year = 2020;


-- 4. Find the top 5 countries with the most content on Netflix
SELECT
	TRIM(UNNEST(string_to_array(country, ','))) as new_country,
	COUNT(show_id) as total_count
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 5. Identify the longest movie
SELECT *  
FROM netflix
WHERE 
	type = 'Movie'
	AND 
	duration = (SELECT MAX(duration) FROM netflix)
LIMIT 10


-- 6. Find content added in the last 5 years
SELECT 
	*
FROM netflix
WHERE 
	TO_DATE(date_added, 'Month dd,YYYY') >= CURRENT_DATE - INTERVAL '5 years'


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
-- below query only shows movies/TV made by 'Rajiv chilaka', it doesn't show the colab's
SELECT * FROM netflix
WHERE
	director = 'Rajiv Chilaka'

-- below query involve all movies/TV done by Rajiv chilaka inlcuding the colabs
select * FROM netflix
WHERE 
	director ILIKE '%Rajiv Chilaka%'

-- 8. List all TV shows with more than 5 seasons
SELECT *
FROM netflix
WHERE
	type = 'TV Show'
	AND
	split_part(duration, ' ', 1)::numeric > 5
-- here split_part fn splits the duration and ::numeric converts the text into numeric so it can be used for comparison operation

-- 9. Count the number of content items in each genre

SELECT
	TRIM(UNNEST(string_to_array(listed_in, ','))) as genre,
	COUNT(show_id) as total_count
FROM netflix
GROUP BY 1


-- 10.Find each year and the average numbers of content release in India on netflix. 
-- return top 5 year with highest avg content release!
SELECT 
	EXTRACT(YEAR FROM (TO_DATE(date_added, 'Month dd,YYYY'))),
	COUNT(*) as yearly_content, 
	ROUND(COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100, 2) as avg_content_per_year
FROM netflix
WHERE country = 'India'
GROUP BY 1


--11. List all movies that are documentaries

SELECT * FROM netflix
WHERE listed_in ILIKE '%documentaries%';

-- 12. Find all content without a director

SELECT * FROM netflix
WHERE DIRECTOR IS NULL;

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * FROM netflix
WHERE 
	casts ILIKE '%SALMAN KHAN%'
	AND
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

SELECT 
	TRIM(UNNEST(string_to_array(casts, ','))) as individual_actors,
	COUNT(*) as total_count
FROM netflix
WHERE
	country ILIKE '%India'
	GROUP BY 1
	ORDER BY 2 desc
	LIMIT 10
	
-- 15 Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.

WITH new_table 
AS
(
SELECT *, 
	CASE
	WHEN
	description ILIKE '%kill%' 
	OR
	description ILIKE '%violence%' THEN 'Bad Content'
	ELSE 'Good Content'
	END category
FROM netflix
)

SELECT 
	category,
	COUNT(*) as total_content
FROM new_table
GROUP BY 1