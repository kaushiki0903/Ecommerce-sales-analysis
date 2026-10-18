
-- E-commerce Sales Analysis
-- Dataset: UCI Online Retail
-- Cleaned table: online_retail_clean

-- Query 1: Count cleaned records
SELECT COUNT(*) AS total_records
FROM online_retail_clean;

-- Query 2: Calculate total revenue
SELECT ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail_clean;

-- Query 3: Top 10 products by revenue
-- Exclude postage and manual entries from product rankings
SELECT
    Description,
    ROUND(SUM(Revenue), 2) AS revenue
FROM online_retail_clean
WHERE Description IS NOT NULL
  AND UPPER(Description) NOT LIKE '%POSTAGE%'
  AND UPPER(Description) NOT LIKE '%MANUAL%'
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;

-- Query 4: Top 10 countries by revenue
SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS revenue
FROM online_retail_clean
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;

-- Query 5: Monthly revenue
SELECT
    strftime('%Y-%m', InvoiceDate) AS month,
    ROUND(SUM(Revenue), 2) AS revenue
FROM online_retail_clean
GROUP BY strftime('%Y-%m', InvoiceDate)
ORDER BY month;
