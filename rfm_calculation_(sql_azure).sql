WITH calculate_rfm AS (
    SELECT
    t.CustomerID,
    1.0 * COUNT(*) / NULLIF(DATEDIFF(YEAR, MIN(r.created_date), '2022-09-01') + 1, 0) AS Frequency,
    DATEDIFF(DAY, MAX(t.Purchase_Date), '2022-09-01') AS Recency,
    SUM(t.GMV) / NULLIF(DATEDIFF(YEAR, MIN(r.created_date), '2022-09-01') + 1, 0) AS Monetary
FROM dbo.Customer_Transaction AS t
JOIN dbo.registered AS r ON r.ID = t.CustomerID
WHERE Purchase_Date IS NOT NULL
GROUP BY CustomerID
HAVING SUM(GMV) > 0),
row_num_rfm AS (
    SELECT *,
    ROW_NUMBER() OVER (ORDER BY Frequency DESC ) AS row_frequency,
    ROW_NUMBER() OVER (ORDER BY Recency ) AS row_recency,
    ROW_NUMBER() OVER ( ORDER BY Monetary DESC) AS row_monetary 
    FROM calculate_rfm 
),
max_vals AS (
    SELECT 
        MAX(row_frequency) AS max_f,
        MAX(row_recency)   AS max_r,
        MAX(row_monetary)  AS max_m
    FROM row_num_rfm
),
final_rfm AS (
    SELECT 
        r.*,
        CASE 
            WHEN r.row_frequency >= m.max_f * 0.75 THEN 4
            WHEN r.row_frequency >= m.max_f * 0.50 THEN 3
            WHEN r.row_frequency >= m.max_f * 0.25 THEN 2
            ELSE 1
        END AS F,
        CASE 
            WHEN r.row_recency >= m.max_r * 0.75 THEN 1
            WHEN r.row_recency >= m.max_r * 0.50 THEN 2
            WHEN r.row_recency >= m.max_r * 0.25 THEN 3
            ELSE 4
        END AS R,
        CASE 
            WHEN r.row_monetary >= m.max_m * 0.75 THEN 4
            WHEN r.row_monetary >= m.max_m * 0.50 THEN 3
            WHEN r.row_monetary >= m.max_m * 0.25 THEN 2
            ELSE 1
        END AS M,
        CONCAT(
            CASE 
                WHEN r.row_recency >= m.max_r * 0.75 THEN 1
                WHEN r.row_recency >= m.max_r * 0.50 THEN 2
                WHEN r.row_recency >= m.max_r * 0.25 THEN 3
                ELSE 4
            END,
            CASE 
                WHEN r.row_frequency >= m.max_f * 0.75 THEN 4
                WHEN r.row_frequency >= m.max_f * 0.50 THEN 3
                WHEN r.row_frequency >= m.max_f * 0.25 THEN 2
                ELSE 1
            END,
            CASE 
                WHEN r.row_monetary >= m.max_m * 0.75 THEN 4
                WHEN r.row_monetary >= m.max_m * 0.50 THEN 3
                WHEN r.row_monetary >= m.max_m * 0.25 THEN 2
                ELSE 1
            END
        ) AS RFM
    FROM row_num_rfm r
    CROSS JOIN max_vals m
)

SELECT CustomerID, R, F, M, RFM
FROM final_rfm

