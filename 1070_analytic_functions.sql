WITH RESULT AS (

    SELECT
        s.product_id,
        year,
        quantity,
        price,
        RANK() OVER(PARTITION BY s.product_id ORDER BY s.product_id,year) AS Rank
    FROM
        Sales s
)
SELECT
        product_id,
        year first_year,
        quantity,
        price
FROM
    RESULT
WHERE
    Rank = 1