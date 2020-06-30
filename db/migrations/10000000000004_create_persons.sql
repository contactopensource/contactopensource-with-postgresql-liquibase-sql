--liquibase formatted sql
-- see: http://www.liquibase.org/

--changeset contact@contactopensource.com:5
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'persons'

CREATE TABLE persons (
  id uuid not null primary key,

  -- Programming-related
  tenant_id uuid, -- for optional multi-tenant installation
  typecast text, -- for optional single table inheritance
  state text, -- for optional state machine transition

  -- Update-related
  updated_at_timestamp_utc timestamp, -- example: 2020-01-01T00:00:00 always UTC
  updated_at_clock_counter bigint, -- example: 123456789 as suitable for a vector clock
  updated_by_text text, -- example: explanation of who updated the contact, why, how, etc.

  -- Name-related
  given_name text, -- example: "Alice"
  middle_name text, --example: "Amy"
  family_name text, -- example: "Adams"
  legal_name text, -- example: Alice Amy Adams"
  prefix_name text, -- example: "Dr."
  suffix_name text, -- example: "Jr."
  salutation text, -- example: "Dr. Adams"
  addressee text, -- example: "Dr. Alice Adams Jr."
  nickname text, -- example: "Ali"

  -- Pronoun-related
  subject_pronoun text, -- example: "she" as in "She likes Alice."; see: https://wikipedia.org/wiki/Subject_pronoun
  object_pronoun text, -- example: "her" as in "Alice likes her."; see: https://wikipedia.org/wiki/Object_pronoun
  dependent_possessive_pronoun text, -- example: "her" as in "Her ideas are good."; see: https://wikipedia.org/wiki/Possessive_pronoun
  independent_possessive_pronoun text, -- example: "hers" as in "The ideas are hers."; see: https://wikipedia.org/wiki/Possessive_determiner
  reflexive_pronoun text, -- example: "herself" as in "She likes herself"; see https://wikipedia.org/wiki/Reflexive_pronoun
  intensive_pronoun text, -- example: "herself" as in "She does it herself."; see: https://en.wikipedia.org/wiki/Intensive_pronoun
  disjunctive_pronoun text, -- example: "her" as in "It is her."; see https://wikipedia.org/wiki/Disjunctive_pronoun

  -- Lifetime-related
  birth_date date, -- example: "2000-01-01"
  death_date date, -- example: "2099-01-01"

  -- Physical-related
  mass_as_grams numeric(20,12), -- example: TODO
  height_as_meters numeric(20,12), -- example: TODO

  -- Org-related
  org_name text, -- example: "Acme Company"
  org_team text, -- example: "Department of Widgets"
  org_role text -- example: "Manager of Widgets"

);

-- Programming-related
CREATE INDEX ix_persons_tenant_id on persons(tenant_id);;
CREATE INDEX ix_persons_typecast on persons(typecast);
CREATE INDEX ix_persons_state on persons(state);

-- Update-related
CREATE INDEX ix_persons_updated_at_timestamp_utc on persons(updated_at_timestamp_utc);
CREATE INDEX ix_persons_updated_at_clock_counter on persons(updated_at_clock_counter);
CREATE INDEX ix_persons_updated_by_text on persons(updated_by_text);

-- Person-related
CREATE INDEX ix_persons_given_name on persons(given_name);
CREATE INDEX ix_persons_middle_name on persons(middle_name);
CREATE INDEX ix_persons_family_name on persons(family_name);
CREATE INDEX ix_persons_legal_name on persons(legal_name);
CREATE INDEX ix_persons_salutation on persons(salutation);
CREATE INDEX ix_persons_addressee on persons(addressee);
CREATE INDEX ix_persons_nickname on persons(nickname);

-- Pronoun-related
CREATE INDEX ix_persons_subject_pronoun on persons(subject_pronoun);
CREATE INDEX ix_persons_object_pronoun on persons(object_pronoun);
CREATE INDEX ix_persons_dependent_possessive_pronoun on persons(dependent_possessive_pronoun);
CREATE INDEX ix_persons_independent_possessive_pronoun on persons(independent_possessive_pronoun);
CREATE INDEX ix_persons_reflexive_pronoun on persons(reflexive_pronoun);
CREATE INDEX ix_persons_intensive_pronoun on persons(intensive_pronoun);
CREATE INDEX ix_persons_disjunctive_pronoun on persons(disjunctive_pronoun);

-- Lifetime-related
CREATE INDEX ix_persons_birth_date on persons(birth_date);
CREATE INDEX ix_persons_death_date on persons(death_date);

-- Physical-related
CREATE INDEX ix_persons_mass_as_grams on persons(mass_as_grams);
CREATE INDEX ix_persons_height_as_meters on persons(height_as_meters);

-- Biometric-related
CREATE INDEX ix_persons_biometric_fingerprint_uri on persons(biometric_fingerprint_uri);
CREATE INDEX ix_persons_biometric_retina_uri on persons(biometric_retina_uri);

-- Org-related
CREATE INDEX ix_persons_org_name on persons(org_name);
CREATE INDEX ix_persons_org_team on persons(org_team);
CREATE INDEX ix_persons_org_role on persons(org_role);

--rollback drop table persons;
