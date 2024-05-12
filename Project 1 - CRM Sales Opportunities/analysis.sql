-- TABLES INSPECTION

SELECT * FROM project_1.sales_teams;
SELECT * FROM project_1.accounts;
SELECT * FROM project_1.sales_pipeline;
SELECT * FROM project_1.products;

-- Creating Temporary Table for Summarization

CREATE TEMPORARY TABLE analysis_per_sales_agent AS
SELECT s.regional_office, s.manager, s.sales_agent,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN 1 ELSE 0 END) won_deals,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN p.close_value ELSE 0 END) won_deals_value,
      SUM(CASE WHEN p.deal_stage = 'Engaging' THEN 1 ELSE 0 END) engaging_deals,
      SUM(CASE WHEN p.deal_stage = 'Lost' THEN 1 ELSE 0 END) lost_deals,
      SUM(CASE WHEN p.deal_stage = 'Prospecting' THEN 1 ELSE 0 END) prospecting_deals  
FROM project_1.sales_teams s
LEFT JOIN project_1.sales_pipeline p
ON s.sales_agent = p.sales_agent
GROUP BY s.regional_office, s.manager, s.sales_agent
ORDER BY 4 DESC;

-- How is each sales team performing compared to the rest?


SELECT s.regional_office, s.manager,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN 1 ELSE 0 END) won_deals,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN p.close_value ELSE 0 END) won_deals_value,
      SUM(CASE WHEN p.deal_stage = 'Engaging' THEN 1 ELSE 0 END) engaging_deals,
      SUM(CASE WHEN p.deal_stage = 'Lost' THEN 1 ELSE 0 END) lost_deals,
      SUM(CASE WHEN p.deal_stage = 'Prospecting' THEN 1 ELSE 0 END) prospecting_deals
FROM project_1.sales_teams s
LEFT JOIN project_1.sales_pipeline p
ON s.sales_agent = p.sales_agent
GROUP BY s.regional_office, s.manager
ORDER BY 3 DESC;

-- Top agent by won deals percentage vs lost deals

SELECT 
      regional_office,
      manager, 
      sales_agent,
      CASE WHEN (won_deals  + lost_deals ) = 0 THEN 0 ELSE ROUND((100.00 * won_deals / (won_deals + lost_deals )), 2) END AS won_deals_pct,
      CASE WHEN (won_deals  + lost_deals ) = 0 THEN 0 ELSE ROUND((100.00 * lost_deals / (won_deals + lost_deals)), 2)END AS lost_deals_pct
FROM analysis_per_sales_agent
ORDER BY 4 DESC;

-- Most engaging sales agent

SELECT *
FROM analysis_per_sales_agent
ORDER BY engaging_deals DESC;

-- Sales Agent with the most prospects

SELECT *
FROM analysis_per_sales_agent
ORDER BY prospecting_deals DESC;

-- Sales Agents Lagging Behind

SELECT *
FROM analysis_per_sales_agent
WHERE won_deals_value = 0;

-- Can you identify any quarter-over-quarter trends?

SELECT EXTRACT(YEAR FROM close_date) AS year,
EXTRACT(QUARTER FROM close_date) AS quarter,
COUNT(*) AS won_deals
FROM project_1.sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY 1, 2
ORDER BY 1, 2;

-- Do any products have better win rates?

SELECT product,
COUNT(*) AS won_deals
FROM project_1.sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY 1
ORDER BY 2 DESC;



