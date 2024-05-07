CREATE TABLE project_1.accounts (
  account VARCHAR(50),
  sector VARCHAR(30),
  year_established INTEGER,
  revenue DECIMAL,
  employees INTEGER,
  office_location VARCHAR(30),
  subsidiary_of VARCHAR(30)
);

-- \copy project_1.accounts (account, sector, year_established, revenue, employees, office_location, subsidiary_of) FROM 'Project 1 - CRM Sales Opportunities\datasets\accounts.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE project_1.sales_teams (
  sales_agent VARCHAR(30),
  manager VARCHAR(30),
  regional_office VARCHAR(10)
);

-- \copy project_1.sales_teams (sales_agent, manager, regional_office) FROM 'Project 1 - CRM Sales Opportunities\datasets\sales_teams.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE project_1.sales_pipeline (
  opportunity_id VARCHAR(10),
  sales_agent VARCHAR(30),
  product VARCHAR(20),
  account VARCHAR(40),
  deal_stage VARCHAR(15),
  engage_date DATE,
  close_date DATE, 
  close_value INTEGER
);

-- \copy project_1.sales_pipeline (opportunity_id, sales_agent, product, account, deal_stage, engage_date, close_date, close_value) FROM 'Project 1 - CRM Sales Opportunities\datasets\sales_pipeline.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE project_1.products (
  product VARCHAR(20),
  series VARCHAR(5),
  sales_price INTEGER
);

-- \copy project_1.products (product, series, sales_price) FROM 'Project 1 - CRM Sales Opportunities\datasets\products.csv' DELIMITER ',' CSV HEADER;
