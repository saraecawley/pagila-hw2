/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT DISTINCT film.title FROM film JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEFT JOIN customer USING (customer_id)
LEFT JOIN address USING (address_id)
LEFT JOIN city USING (city_id)
LEFT JOIN country USING (country_id)
WHERE film.film_id NOT IN (
    SELECT inventory.film_id
    FROM rental
    JOIN inventory USING (inventory_id)
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    WHERE country = 'United States'
)
ORDER BY film.title;
