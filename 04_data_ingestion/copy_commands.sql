-- Load Marketing Qualified Leads into staging
-- Replace <PATH_TO_FILE> with your local file path
COPY marketing.marketing_qualified_leads_staging
FROM '<PATH_TO_olist_marketing_qualified_leads_dataset.csv>'
DELIMITER ','
CSV HEADER
QUOTE '"'
ESCAPE '"';

-- Load Marketing Closed Deals into staging
-- Replace <PATH_TO_FILE> with your local file path
COPY marketing.marketing_closed_deals_staging
FROM '<PATH_TO_olist_marketing_closed_deals_dataset.csv>'
DELIMITER ','
CSV HEADER
QUOTE '"'
ESCAPE '"';
