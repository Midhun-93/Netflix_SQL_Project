# Netflix Movies and TV Show Data Analysis using SQL

## Overview
This project involves analyzing a [Netflix dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download) sourced from Kaggle using SQL. The dataset contains information about Netflix content, including movies and TV shows, with attributes like title, director, cast, release year, and more.

## Key Learnings
- **SQL Proficiency**: Developed skills in advanced SQL queries, including `GROUP BY`, window functions (`RANK()`), and conditional operators (`CASE`, `ILIKE`).
- **Data Transformation**: Handled multi-value fields using functions like `string_to_array` and `TRIM`. Converted text fields to numeric for calculations.
- **Temporal Analysis**: Analyzed trends over time using `TO_DATE`, `CURRENT_DATE`, and `EXTRACT(YEAR)`.
- **Categorization**: Classified content based on keywords in descriptions (e.g., 'Good Content' vs. 'Bad Content').
- **Data Cleaning**: Identified missing values (e.g., `IS NULL` for directors) and handled inconsistencies.

## Data Handling
- **Source**: Dataset sourced from Kaggle.
- **Table Design**: Created a `netflix` table with fields like `show_id`, `type`, `title`, `director`, `country`, and more.
- **Normalization**: Split multi-value fields (e.g., `casts` and `country`) for granular analysis.

## Problem Statements
1. Count the number of Movies vs TV Shows.
2. Find the most common ratings for Movies and TV Shows.
3. List all movies released in a specific year (e.g., 2020).
4. Identify the top 5 countries with the most content on Netflix.
5. Find the longest movie on Netflix.
6. Find content added in the last 5 years.
7. List all content by director 'Rajiv Chilaka' (including collaborations).
8. List all TV Shows with more than 5 seasons.
9. Count the number of content items in each genre.
10. Find each year and the average number of content releases in India.
11. List all movies that are documentaries.
12. Find all content without a director.
13. Count how many movies actor 'Salman Khan' appeared in during the last 10 years.
14. Identify the top 10 actors who appeared in the highest number of movies produced in India.
15. Categorize content based on the presence of keywords 'kill' and 'violence' in descriptions.

## Key Insights
1. Counted the number of movies vs TV shows.
2. Identified the most common ratings and genres.
3. Analyzed top countries with the highest content production.
4. Highlighted trends in content added over the last 5 years.
5. Extracted insights on actors, directors, and specific content types like documentaries.

## Conclusion
This project enhanced my ability to analyze datasets, write efficient SQL queries, and derive actionable insights. It simulated real-world scenarios, refining both technical and problem-solving skills.


