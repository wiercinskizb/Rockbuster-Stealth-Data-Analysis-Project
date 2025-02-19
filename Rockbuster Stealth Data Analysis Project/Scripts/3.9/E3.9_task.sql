/* 
WITH total_amount_paid_cte (customer_id,full_name,country,city,total_payment) 
AS	(SELECT 
	c.customer_id,
	CONCAT(c.first_name,' ',c.last_name) AS full_name,
	co.country AS country,
	ci.city AS city,
	SUM(p.amount) AS total_payment
	FROM customer AS c
	INNER JOIN address AS a ON a.address_id = c.address_id
	INNER JOIN city AS ci ON ci.city_id = a.city_id
	INNER JOIN country AS co ON co.country_id = ci.country_id
	INNER JOIN payment AS p ON p.customer_id = c.customer_id
	WHERE ci.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule (Dhulia)','Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo')
	GROUP BY 1,2,3,4--,5,6
	ORDER BY total_payment DESC
	LIMIT 5)
SELECT
ROUND(AVG(total_payment), 2) AS average_amount_paid
FROM total_amount_paid_cte
*/

--/* 
WITH TopCustomers_cte AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS full_name,
        co.country AS country,
        ci.city AS city,
        SUM(p.amount) AS total_payment
    FROM customer AS c
    INNER JOIN address AS a ON a.address_id = c.address_id
    INNER JOIN city AS ci ON ci.city_id = a.city_id
    INNER JOIN country AS co ON co.country_id = ci.country_id
    INNER JOIN payment AS p ON p.customer_id = c.customer_id
    WHERE ci.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule (Dhulia)', 
                      'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo')
    GROUP BY c.customer_id, co.country, ci.city
    ORDER BY total_payment DESC
    LIMIT 5
),
TopCustomersCount_cte AS (
    SELECT 
        abc.country AS abccountry, 
        COUNT(DISTINCT abc.customer_id) AS top_customer_count
    FROM TopCustomers_cte AS abc
    GROUP BY abc.country
)
SELECT 
    co.country AS country,
    COUNT(DISTINCT c.customer_id) AS all_customer_count,
    COALESCE(MAX(abcd.top_customer_count), 0) AS top_customer_count
FROM customer AS c
INNER JOIN address AS a ON a.address_id = c.address_id
INNER JOIN city AS ci ON ci.city_id = a.city_id
INNER JOIN country AS co ON co.country_id = ci.country_id
LEFT JOIN TopCustomersCount_cte AS abcd ON abcd.abccountry = co.country
GROUP BY co.country
ORDER BY all_customer_count DESC
--*/