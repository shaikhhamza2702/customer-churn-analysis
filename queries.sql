-- View Data
SELECT * FROM customers LIMIT 10;

-- Churn Rate
SELECT 
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate
FROM customers;

-- Churn by Contract
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Contract;

-- Tenure Analysis
SELECT 
    tenure,
    COUNT(*) AS users,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY tenure
ORDER BY tenure;
