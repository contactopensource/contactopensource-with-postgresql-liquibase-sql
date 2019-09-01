INSERT INTO email_contacts VALUES (
  CAST('8e238bdbf3b6c189f9e2ed65b2efbb45' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Telephone-related
  'mobile phone', -- label
  '1 (415) 555-0000', -- number_text

  -- E.164-related -- see https://en.wikipedia.org/wiki/E.164
  '14155550000', -- e164
  '1', -- e164_country_code
  '415', -- e164_national_destination_code
  '888', -- e164_group_identification_code
  '888', -- e164_trial_identification_code
  '5550000' -- e164_subscriber_number

);
