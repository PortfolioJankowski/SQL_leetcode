SELECT 
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(COUNT(CASE WHEN rating < 3 THEN 1 ELSE NULL END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM 
    Queries
GROUP BY 
    query_name;e