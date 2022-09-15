##Lab | SQL Queries - Lesson 2.6##

-- 1.  In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, 
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT last_name, first_name FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

-- 2. Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to 
-- include the last names of the actors where the last name was present more than once.
SELECT last_name FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) >= 2;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id AS 'Employee', COUNT(rental_id) AS 'Rentals Processed' FROM sakila.rental
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year.
SELECT count(*) AS 'Number of films', release_year AS 'Release Year' FROM sakila.film
GROUP BY release_year;

-- 5. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
SELECT round(avg(length), 2) AS 'Mean length', rating AS 'Rating' FROM sakila.film
GROUP BY rating;

-- 6. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT round(avg(length), 2) AS 'Mean length', rating AS 'Rating' FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;


-- 7. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
-- Option 1: RANK()
SELECT RANK() OVER(ORDER BY length DESC) AS 'Rank', title AS 'Title', length AS 'Length' FROM sakila.film
WHERE length > 0 AND length IS NOT NULL
ORDER BY length DESC;

-- Option 2: DENSE_RANK()
SELECT DENSE_RANK() OVER(ORDER BY length DESC) AS 'Rank', title AS 'Title', length AS 'Length' FROM sakila.film
WHERE length > 0 AND length IS NOT NULL
ORDER BY length DESC;