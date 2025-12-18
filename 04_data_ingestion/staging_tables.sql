-- Staging table for Marketing Qualified Leads
CREATE TABLE IF NOT EXISTS marketing.marketing_qualified_leads_staging (
    mql_id TEXT,
    first_contact_date TEXT,
    landing_page_id TEXT,
    origin TEXT
);

-- Staging table for Marketing Closed Deals
CREATE TABLE IF NOT EXISTS marketing.marketing_closed_deals_staging (
    mql_id TEXT,
    seller_id TEXT,
    sdr_id TEXT,
    sr_id TEXT,
    won_date TEXT,
    business_segment TEXT,
    business_type TEXT,
    lead_type TEXT,
    lead_behaviour_profile TEXT,
    has_company TEXT,
    has_gtin TEXT,
    average_stock TEXT,
    declared_product_catalog_size TEXT,
    declared_monthly_revenue TEXT
);
