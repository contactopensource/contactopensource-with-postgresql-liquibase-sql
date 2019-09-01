INSERT INTO passport_contacts VALUES (
  CAST('5c6122ea2ceab2a7374bf42095c6cd3e' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Thing-related
  'US', -- country_text
  '888-888-888-888', -- number_text

  -- Time-related
  '2020-01-01', -- valid_start_date
  '2030-01-01' -- valid_stop_date

);
