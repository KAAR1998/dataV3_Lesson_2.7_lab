USE sakila; 
SHOW FULL TABLES;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT f_c.category_id, COUNT(*) as number, c.name 
FROM sakila.film_category as f_c
JOIN sakila.category as c
ON f_c.category_id = c.category_id
GROUP BY f_c.category_id
ORDER BY COUNT(*) DESC;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM sakila.payment; 
SELECT * FROM sakila.staff;

SELECT SUM(amount) as August_Total, p.staff_id, CONCAT(s.first_name,' ',s.last_name) as name
FROM sakila.payment as p 
JOIN sakila.staff as s
ON p.staff_id = s.staff_id
WHERE payment_date LIKE '2005-08%'
GROUP BY p.staff_id
ORDER BY SUM(amount) DESC;

-- Which actor has appeared in the most films?
SELECT * FROM sakila.actor; 
SELECT * FROM sakila.film_actor;

SELECT f_a.actor_id, COUNT(*) as appearances, CONCAT(a.first_name,' ',a.last_name) as name 
FROM sakila.film_actor as f_a 
JOIN sakila.actor as a 
ON f_a.actor_id = a.actor_id 
GROUP BY f_a.actor_id
ORDER BY COUNT(*) DESC;

-- Most active customer (the customer that has rented the most number of films)
SELECT * FROM sakila.rental;
SELECT * FROM sakila.customer;

SELECT r.customer_id, COUNT(*) as rentals, CONCAT(c.first_name,' ',c.last_name) as customer
FROM sakila.rental as r 
JOIN sakila.customer as c 
ON r.customer_id = c.customer_id
GROUP BY r.customer_id
ORDER BY COUNT(*) DESC;

-- Display the first and last names, as well as the address, of each staff member.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.address;

SELECT s.staff_id, CONCAT(s.first_name,' ',s.last_name) as name, s.address_id, a.address, a.district, a.city_id
FROM sakila.staff as s 
JOIN sakila.address as a 
ON s.address_id = a.address_id
WHERE s.address_id = a.address_id 
GROUP BY s.staff_id;

-- List each film and the number of actors who are listed for that film.
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.film;

SELECT f.title, f_a.film_id, COUNT(*) as num_of_actors
FROM sakila.film_actor as f_a
INNER JOIN sakila.film as f 
ON f_a.film_id = f.film_id
GROUP BY f_a.film_id 
ORDER BY COUNT(*) DESC;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM sakila.payment; 
SELECT * FROM sakila.customer;

SELECT p.customer_id, SUM(amount) as total_paid, CONCAT(c.first_name,' ', c.last_name) as customer_name
FROM sakila.payment as p
JOIN sakila.customer as c 
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY SUM(amount) DESC;

-- List number of films per category.
SELECT f_c.category_id, COUNT(*) as number_of_films, c.name 
FROM sakila.film_category as f_c
JOIN sakila.category as c
ON f_c.category_id = c.category_id
GROUP BY f_c.category_id
ORDER BY COUNT(*) DESC;