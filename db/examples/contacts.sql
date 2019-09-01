INSERT INTO contacts VALUES (
  CAST('423f36dcba577aecb7c127b898c00183' as uuid), -- id

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
  5 -- star_count

);
