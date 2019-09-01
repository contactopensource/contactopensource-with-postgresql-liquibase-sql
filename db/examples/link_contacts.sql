INSERT INTO link_contacts VALUES (
  CAST('2a7b687d89d02d308347c7a207de826e' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Link-related
  'Example web page', -- label
  'http://example.com/example.html' -- uri

);
