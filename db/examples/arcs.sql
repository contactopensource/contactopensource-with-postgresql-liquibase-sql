INSERT INTO arcs VALUES (
  CAST('264b87a8f92fdbd265f4b5543f829cc2' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Source
  'table_example_1', -- t1
  CAST('694492e037227acf0a264d235f18d1e9' as uuid), -- i1

  -- Target
  'table_example_2', -- t2
  CAST('120138558219a394885b620806d8a399' as uuid), -- i2

  -- Lifecycle
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- start_at_timestamp_utc
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- stop_at_timestamp_utc

  -- Modifiers
  CAST('d0fbc73c8dc04ce514a2132ee9431d11' as uuid), -- purpose
  8, -- count
  8.8, -- weight
  0.8 -- probability

);
