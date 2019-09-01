INSERT INTO orgs VALUES (
  CAST('e931f2c10b9123abfafd8538b6d75a13' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- General-related
  'Acme Agency', -- name
  'U+1F60A', -- emoji

  -- Display-related
  'https://example.com/image.jpg', -- image_uri
  'FF0000', -- color_hex
  'friend', -- css_class
  5, -- star_count

  -- Lifetime-related
  TO_TIMESTAMP('2000-01-01', 'YYYY-MM-DD'), -- start_date
  TO_TIMESTAMP('2099-01-01', 'YYYY-MM-DD'), -- stop_date

  -- Business-related
  '88888888', -- value_added_tax_identification_number
  'xxxxxxxxxxxxxxxxxxxx', -- legal_entity_identifier
  'xxxx:xxxx', -- ticker_symbol text
  'xxxxx' -- international_standard_of_industrial_classification_rev_4

);
