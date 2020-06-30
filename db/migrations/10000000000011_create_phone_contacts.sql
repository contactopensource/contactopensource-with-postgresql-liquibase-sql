--liquibase formatted sql
-- see: http://www.liquibase.org/

--changeset contact@contactopensource.com:12
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'phone_contacts'

CREATE TABLE phone_contacts (
  id uuid not null primary key,

  -- Programming-related
  tenant_id uuid, -- for optional multi-tenant installation
  typecast text, -- for optional single table inheritance
  state text, -- for optional state machine transition

  -- Update-related
  updated_at_timestamp_utc timestamp, -- example: 2020-01-01T00:00:00 always UTC
  updated_at_clock_counter bigint, -- example: 123456789 as suitable for a vector clock
  updated_by_text text, -- example: explanation of who updated the contact, why, how, etc.

  -- Telephone-related
  label text, -- example: "mobile phone"
  number_text text, -- example: "(415) 555-0000"

  -- E.164-related -- see https://en.wikipedia.org/wiki/E.164
  e164 varchar(15), -- example: "14155550000" means United States country code, San Franicsco area code, etc.
  e164_country_code varchar(3), --- example: "1" means United States -- see https://en.wikipedia.org/wiki/E.164
  e164_national_destination_code varchar(13), -- example: "415" is the United States area code of San Francisco
  e164_group_identification_code varchar(4), -- example: TODO
  e164_trial_identification_code varchar(3), -- example: TODO
  e164_subscriber_number varchar(14) --- example: "5550000" -- see https://en.wikipedia.org/wiki/E.164

);

-- Programming-related
CREATE INDEX ix_phone_contacts_tenant_id on phone_contacts(tenant_id);;
CREATE INDEX ix_phone_contacts_typecast on phone_contacts(typecast);
CREATE INDEX ix_phone_contacts_state on phone_contacts(state);

-- Update-related
CREATE INDEX ix_phone_contacts_updated_at_timestamp_utc on phone_contacts(updated_at_timestamp_utc);
CREATE INDEX ix_phone_contacts_updated_at_clock_counter on phone_contacts(updated_at_clock_counter);
CREATE INDEX ix_phone_contacts_updated_by_text on phone_contacts(updated_by_text);

-- Telephone-related
CREATE INDEX ix_phone_contacts_label on phone_contacts(label);
CREATE INDEX ix_phone_contacts_number_text on phone_contacts(number_text);

-- E.164-related
CREATE INDEX ix_phone_contacts_e164 on phone_contacts(e164);
CREATE INDEX ix_phone_contacts_e164_country_code on phone_contacts(e164_country_code);
CREATE INDEX ix_phone_contacts_e164_national_destination_code on phone_contacts(e164_national_destination_code);
CREATE INDEX ix_phone_contacts_e164_group_identification_code on phone_contacts(e164_group_identification_code);
CREATE INDEX ix_phone_contacts_e164_trial_identification_code on phone_contacts(e164_trial_identification_code);
CREATE INDEX ix_phone_contacts_e164_e164_subscriber_number on phone_contacts(e164_subscriber_number);

--rollback drop table phone_contacts;
