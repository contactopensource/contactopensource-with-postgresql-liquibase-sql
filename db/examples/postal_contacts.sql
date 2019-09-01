INSERT INTO postal_contacts VALUES (
  CAST('f10bf169bbc1df76dc18dd007e09581a' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Postal-related
  'US', -- country_text
  'CA', -- region_text
  'San Francisco', -- locality_text
  'Mission District', -- neighborhood_text
  '94101', -- postal_code_text
  '123 Main Street', -- street_address_text
  'Apartment A1', -- premise_address_text
  '8888888888888' -- global_location_number_text

);
