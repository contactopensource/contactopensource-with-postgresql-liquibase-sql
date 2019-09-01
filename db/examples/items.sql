INSERT INTO items VALUES (
  CAST('c9d5a052adab471f2d0e63054a535793' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Meta-related -- the intent is to describe the content fields below.
  'https://example.com/example.txt', -- uri
  'text/plain', -- mime

  -- Content-related - the intent is to offer a variety of database types.
  'hello world', -- text
  '{"hello": "world"}', -- json
  '<?xml version="1.0"?><example>hello world</example>' -- xml

);
