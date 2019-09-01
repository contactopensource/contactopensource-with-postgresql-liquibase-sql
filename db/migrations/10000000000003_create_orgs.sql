--liquibase formatted sql
-- see: http://www.liquibase.org/

--changeset contact@contactopensource.com:4
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'orgs'

CREATE TABLE orgs (
  id uuid not null primary key,

  -- Programming-related
  tenant_id uuid, -- for optional multi-tenant installation
  typecast text, -- for optional single table inheritance
  state text, -- for optional state machine transition

  -- Update-related
  updated_at_timestamp_utc timestamp, -- example: 2020-01-01T00:00:00 always UTC
  updated_at_clock_counter bigint, -- example: 123456789 as suitable for a vector clock
  updated_by_text text, -- example: explanation of who updated the contact, why, how, etc.

  -- General-related
  name text, -- example: "Acme Agency"
  emoji text, -- example: "U+1F60A" is smiling face with smiling eyes

  -- Display-related
  image_uri text, -- example: "https://example.com/image.jpg"
  color_hex char(6), -- example: "FF0000" is red
  css_class text, -- example: "friend" is a cascading style sheet class (a space-separated list)
  star_count integer, -- example: '5' means 5-star rating

  -- Lifetime-related
  start_date date, -- example: "2000-01-01"
  stop_date date, -- example: "2099-01-01"

  -- Business-related
  value_added_tax_identification_number text, -- see: https://schema.org/vatID https://wikipedia.org/wiki/VAT_identification_number
  legal_entity_identifier char(20), -- see: https://schema.org/leiCode https://wikipedia.org/wiki/Legal_Entity_Identifier
  ticker_symbol text, -- see: https://wikipedia.org/wiki/Ticker_symbol
  international_standard_of_industrial_classification_rev_4 char(5), -- see: https://schema.org/isicV4 https://wikipedia.org/wiki/International_Standard_Industrial_Classification

);

-- Programming-related
CREATE INDEX ix_orgs_tenant_id on orgs(tenant_id);;
CREATE INDEX ix_orgs_typecast on orgs(typecast);
CREATE INDEX ix_orgs_state on orgs(state);

-- Update-related
CREATE INDEX ix_orgs_updated_at_timestamp_utc on orgs(updated_at_timestamp_utc);
CREATE INDEX ix_orgs_updated_at_clock_counter on orgs(updated_at_clock_counter);
CREATE INDEX ix_orgs_updated_by_text on orgs(updated_by_text);

-- General-related
CREATE INDEX ix_orgs_name on orgs(name);
CREATE INDEX ix_orgs_emoji on orgs(emoji);

-- Display-related
CREATE INDEX ix_orgs_image_uri on orgs(image_uri);
CREATE INDEX ix_orgs_color_hex on orgs(color_hex);
CREATE INDEX ix_orgs_css_class on orgs(css_class);
CREATE INDEX ix_orgs_star_count on orgs(star_count);

-- Lifetime-related
CREATE INDEX ix_orgs_start_date on orgs(start_date);
CREATE INDEX ix_orgs_stop_date on orgs(stop_date);

-- Business-related
CREATE INDEX ix_orgs_value_added_tax_identification_number on orgs(value_added_tax_identification_number);
CREATE INDEX ix_orgs_legal_entity_identifier on orgs(legal_entity_identifier);
CREATE INDEX ix_orgs_ticker_symbol on orgs(ticker_symbol);
CREATE INDEX ix_orgs_international_standard_of_industrial_classification_rev_4 on orgs(international_standard_of_industrial_classification_rev_4);

--rollback drop table org;
