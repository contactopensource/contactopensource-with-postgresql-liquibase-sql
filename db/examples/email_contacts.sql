INSERT INTO email_contacts VALUES (
  CAST('dc3200ef1e8066ab892964f9292cd15e' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Email-related
  'Alice Adams <alice@example.com>', -- address
  'Alice Adams', -- display_name
  'alice@example.com' -- addr_spec

);
