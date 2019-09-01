INSERT INTO persons VALUES (
  CAST('cc1143129505d87f5f0a044b7dbef236' as uuid), -- id

  -- Programming-related
  CAST('7bd380209cd310d3ad4e7f980298cbea' as uuid), -- tenant_id
  '', -- type
  '', -- state

  -- Update-related
  TO_TIMESTAMP('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -- updated_at_timestamp_utc
  0, -- updated_at_clock_counter
  'updated by example', -- updated_by_text

  -- Name-related
  'Alice', -- given_name
  'Amy', -- middle_name
  'Anderson', -- family_name
  'Alice Amy Anderson', -- legal_name
  'Dr.', -- prefix_name
  'Jr.', -- suffix_name
  'Dr. Anderson', -- salutation
  'Dr. Alice Anderson Jr.', -- addressee
  'Ali', -- nickname

  -- Pronoun-related
  'she', -- subject_pronoun
  'her', -- object_pronoun
  'her', -- dependent_possessive_pronoun
  'hers', -- independent_possessive_pronoun
  'herself', -- reflexive_pronoun
  'herself', -- intensive_pronoun
  'her', -- disjunctive_pronoun

  -- Lifetime-related
  TO_TIMESTAMP('2000-01-01', 'YYYY-MM-DD HH24:MI:SS'), -- birth_date
  TO_TIMESTAMP('2099-01-01', 'YYYY-MM-DD HH24:MI:SS'), -- death_date

  -- Physical-related
  7000.0, -- mass_as_grams
  1.7, -- height_as_meters

  -- Org-related
  'Acme Agency', -- org_name
  'Department of Widgets', -- org_team
  'Manager of Widgets' -- org_role

);
