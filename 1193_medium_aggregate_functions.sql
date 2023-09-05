SELECT 
    CONCAT_WS(
        '-', 
        YEAR(trans_date), 
        CASE 
            WHEN LEN(MONTH(trans_date)) <> 2 THEN CONCAT('0', CAST(MONTH(trans_date) AS VARCHAR(2)))
            ELSE CAST(MONTH(trans_date) AS VARCHAR(2))
        END
    ) as month,
    country, 
    COUNT(*) as trans_count, 
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM transactions
GROUP BY CONCAT_WS(
        '-', 
        YEAR(trans_date), 
        CASE 
            WHEN LEN(MONTH(trans_date)) <> 2 THEN CONCAT('0', CAST(MONTH(trans_date) AS VARCHAR(2)))
            ELSE CAST(MONTH(trans_date) AS VARCHAR(2))
        END
    ), country