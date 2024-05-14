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

WITH teams_summary AS
(SELECT s.regional_office, s.manager,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN 1 ELSE 0 END) won_deals,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN p.close_value ELSE 0 END) won_deals_value,
      SUM(CASE WHEN p.deal_stage = 'Engaging' THEN 1 ELSE 0 END) engaging_deals,
      SUM(CASE WHEN p.deal_stage = 'Lost' THEN 1 ELSE 0 END) lost_deals,
      SUM(CASE WHEN p.deal_stage = 'Prospecting' THEN 1 ELSE 0 END) prospecting_deals
FROM project_1.sales_teams s
LEFT JOIN project_1.sales_pipeline p
ON s.sales_agent = p.sales_agent
GROUP BY s.regional_office, s.manager
ORDER BY 3 DESC)
SELECT *, ROUND(100.00 * won_deals / (won_deals + lost_deals), 2) AS win_pct
FROM teams_summary;



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
COUNT(*) FILTER(WHERE deal_stage = 'Won') AS won_deals,
COUNT(*) FILTER(WHERE deal_stage = 'Lost') AS lost_deals,
SUM(close_value) AS total_close_value
FROM project_1.sales_pipeline
WHERE close_date IS NOT NULL
GROUP BY 1, 2
ORDER BY 1, 2;

-- Do any products have better win rates?

SELECT product,
COUNT(*) FILTER (WHERE deal_stage = 'Won') AS won_deals,
ROUND(100.00 * (COUNT(*) FILTER (WHERE deal_stage = 'Won')) / (COUNT(*) FILTER (WHERE deal_stage IN ('Won', 'Lost'))), 2) AS won_deals_pct,
SUM(close_value) AS total_close_value
FROM project_1.sales_pipeline
GROUP BY 1
ORDER BY 4 DESC;

-- Accounts Analysis

SELECT a.sector, 
COUNT(s.*) FILTER(WHERE deal_stage = 'Won') AS won_deals,
COUNT(s.*) FILTER(WHERE deal_stage = 'Lost') AS lost_deals,
COUNT(s.*) FILTER(WHERE deal_stage = 'Engaging') AS engaging_deals,
COUNT(s.*) FILTER(WHERE deal_stage = 'Prospecting') AS prospecting_deals,
ROUND(100.00 * (COUNT(s.*) FILTER (WHERE s.deal_stage = 'Won')) / (COUNT(s.*) FILTER (WHERE s.deal_stage IN ('Won', 'Lost'))), 2) AS won_deals_pct,
SUM(s.close_value) AS total_close_value
FROM project_1.accounts a
LEFT JOIN project_1.sales_pipeline s
ON a.account = s.account
GROUP BY 1
ORDER BY 7 DESC
LIMIT 5;



SELECT a.account, a.sector, a.office_location, 
COUNT(s.*) FILTER(WHERE deal_stage = 'Won') AS won_deals,
COUNT(s.*) FILTER(WHERE deal_stage = 'Lost') AS lost_deals,
COUNT(s.*) FILTER(WHERE deal_stage = 'Engaging') AS engaging_deals,
COUNT(s.*) FILTER(WHERE deal_stage = 'Prospecting') AS prospecting_deals,
ROUND(100.00 * (COUNT(s.*) FILTER (WHERE s.deal_stage = 'Won')) / (COUNT(s.*) FILTER (WHERE s.deal_stage IN ('Won', 'Lost'))), 2) AS won_deals_pct,
SUM(s.close_value) AS total_close_value
FROM project_1.accounts a
LEFT JOIN project_1.sales_pipeline s
ON a.account = s.account
GROUP BY 1, 2, 3
ORDER BY 9 DESC
LIMIT 5;


