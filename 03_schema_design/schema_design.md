## Schema Design

The `marketing` schema isolates seller acquisition and CRM-style data from core e-commerce tables, enabling focused analysis of the seller onboarding funnel.

### Table Grains
- **marketing_qualified_leads**  
  One row per marketing qualified lead (MQL).

- **marketing_closed_deals**  
  One row per closed seller deal resulting from a qualified lead.

### Table Relationships
- Both tables are linked using `mql_id`, which represents a unique marketing lead identifier.
- Not all MQLs result in closed deals, preserving the natural funnel structure.

### Design Decisions
- `average_stock` is stored as text due to non-numeric values such as ranges and date-like entries in the source data.
- Numeric attributes are stored as `NUMERIC` to preserve decimal precision.
- Boolean fields are normalized during ingestion rather than enforced at the schema level.
- Foreign key constraints are intentionally avoided to support flexible ingestion and analytical workloads.

### Ingestion Considerations
Due to inconsistent data formats in the source CRM data, staging tables were used to validate and normalize values before loading into final analytical tables.
