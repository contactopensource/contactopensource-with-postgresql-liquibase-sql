INSERT INTO geo_points VALUES (
  CAST('c8fb5187e718484eefb9e8dceef4cd68' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Geo-related
  37.8199, -- latitude
  122.4783, -- longitude
  67.056, -- altitude
  67.056 -- elevation

);
