/*
SELECT 
co.country AS country,
COUNT(customer_id) AS customer_count
FROM customer AS c
FULL JOIN address AS a ON a.address_id = c.address_id
FULL JOIN city AS ci ON ci.city_id = a.city_id
FULL JOIN country AS co ON co.country_id = ci.country_id
GROUP BY country
ORDER BY customer_count DESC
LIMIT 10
*/
/*
SELECT 
ci.city AS city,
co.country AS country,
COUNT(c.customer_id) AS customer_count
FROM customer AS c
FULL JOIN address AS a ON a.address_id = c.address_id
FULL JOIN city AS ci ON ci.city_id = a.city_id
FULL JOIN country AS co ON co.country_id = ci.country_id
WHERE co.country IN ('India', 'China', 'United States', 'Japan', 'Mexico','Brazil', 'Russian Federation', 'Philippines', 'Turkey', 'Indonesia')
GROUP BY 1,2
ORDER BY customer_count DESC
LIMIT 10
*/
--/*
SELECT 
c.customer_id,
--c.first_name,
--c.last_name,
CONCAT(c.first_name,' ',c.last_name) AS full_name,
co.country AS country,
ci.city AS city,
SUM(p.amount) AS total_payment
--COUNT(c.customer_id) AS customer_count
FROM customer AS c
FULL JOIN address AS a ON a.address_id = c.address_id
FULL JOIN city AS ci ON ci.city_id = a.city_id
FULL JOIN country AS co ON co.country_id = ci.country_id
FULL JOIN payment AS p ON p.customer_id = c.customer_id
WHERE ci.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule (Dhulia)','Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo')
GROUP BY 1,2,3,4--,5,6
ORDER BY total_payment DESC
LIMIT 5
--*/