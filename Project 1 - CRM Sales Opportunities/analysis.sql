-- TABLES INSPECTION

SELECT * FROM project_1.sales_teams;
SELECT * FROM project_1.accounts;
SELECT * FROM project_1.sales_pipeline;
SELECT * FROM project_1.products;

-- How is each sales team performing compared to the rest?


SELECT s.regional_office, s.manager,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN 1 ELSE 0 END) won_deals,
      SUM(CASE WHEN p.deal_stage = 'Won' THEN p.close_value ELSE 0 END) won_deals_value,
      SUM(CASE WHEN p.deal_stage = 'Engaging' THEN 1 ELSE 0 END) engaging_deals,
      SUM(CASE WHEN p.deal_stage = 'Lost' THEN 1 ELSE 0 END) lost_deals
FROM project_1.sales_teams s
LEFT JOIN project_1.sales_pipeline p
ON s.sales_agent = p.sales_agent
GROUP BY s.regional_office, s.manager
ORDER BY 3 DESC;

-- Are any sales agents lagging behind?

SELECT sales_agent,
      SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) won_deals,
      SUM(CASE WHEN deal_stage = 'Won' THEN close_value ELSE 0 END) won_deals_value,
      SUM(CASE WHEN deal_stage = 'Engaging' THEN 1 ELSE 0 END) engaging_deals,
      SUM(CASE WHEN deal_stage = 'Lost' THEN 1 ELSE 0 END) lost_deals
FROM project_1.sales_pipeline
GROUP BY 1
ORDER BY 2 DESC;

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

