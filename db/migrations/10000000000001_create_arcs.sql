--liquibase formatted sql
-- see: http://www.liquibase.org/

--changeset contact@contactopensource.com:2
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'arcs'

CREATE TABLE arcs (
  id uuid not null primary key,

  -- Programming-related
  tenant_id uuid, -- for optional multi-tenant installation
  typecast text, -- for optional single table inheritance
  state text, -- for optional state machine transition

  -- Update-related
  updated_at_timestamp_utc timestamp, -- example: 2020-01-01T00:00:00 always UTC
  updated_at_clock_counter bigint, -- example: 123456789 as suitable for a vector clock
  updated_by_text text, -- example: explanation of who updated the contact, why, how, etc.

  -- The "arcs" table is kind of join table, with special capabilties.
  -- An arc associates from a source table row to a target table row.
  --
  -- Some database tutorials call this a polymorphic-to-polymorphic join.
  -- This functionality is similar to a graph database, because any entry
  -- in the database can associate with any other entry in the database.
  --
  -- For example, suppose we have a person and an organation:
  --
  --   * Person id 34b75621921fdc7ac83459c5c4b7dba6
  --
  --   * Org id bba6d2f6df708732f5eb2937e35b3d93
  --
  -- To associate from the person to the org, create this arc
  -- from the source table and id to the target table and id:
  --
  --   * t1:persons
  --   * r1:34b75621921fdc7ac83459c5c4b7dba6
  --   * t2:orgs
  --   * r2:bba6d2f6df708732f5eb2937e35b3d93
  --
  -- The arc field names are deliberate short because they're so frequent.

  -- Source table and id
  t1 text not null, -- source table; example: "persons"
  i1 uuid not null, -- source id; example: 34b75621921fdc7ac83459c5c4b7dba6

  -- Target table and id
  t2 text not null, -- target table; example: "orgs"
  i2 uuid not null, -- target id; example: bba6d2f6df708732f5eb2937e35b3d93

  -- Lifecycle
  start_at_timestamp_utc timestamp,
  stop_at_timestamp_utc timestamp,

  -- Modifiers
  purpose uuid, -- example: a1e4c5aba03970a1a511c0caf678643a, which means "likes"
  count integer, -- count, such as an instance index; example: 10 means count 10
  weight real, -- weight, such as a graph cost or length; example: 2 means weight 2
  unit_interval, real -- unit interval, 0 to 1 inclusive; example: 0.1 means unit interval 10%
  dual_interval real -- dual interval, -1 to 1 inclusive; example: -0.1 means unit interval -10%

);

-- Programming-related
CREATE INDEX ix_edges_tenant_id on arcs(tenant_id);;
CREATE INDEX ix_edges_typecast on arcs(typecast);
CREATE INDEX ix_edges_state on arcs(state);

-- Update-related
CREATE INDEX ix_edges_updated_at_timestamp_utc on arcs(updated_at_timestamp_utc);
CREATE INDEX ix_edges_updated_at_clock_counter on arcs(updated_at_clock_counter);
CREATE INDEX ix_edges_updated_by_text on arcs(updated_by_text);

-- Source table
CREATE INDEX ix_edges_t1 on arcs(t1);
CREATE INDEX ix_edges_i1 on arcs(i1);

-- Target table and id
CREATE INDEX ix_edges_t2 on arcs(t2);
CREATE INDEX ix_edges_i2 on arcs(i2);

-- Lifecycle
CREATE INDEX ix_edges_start_at_timestamp_utc on arcs(start_at_timestamp_utc);
CREATE INDEX ix_edges_stop_at_timestamp_utc on arcs(_at_timestamp_utc);

-- Modifiers
CREATE INDEX ix_edges_purpose on arcs(purpose);
CREATE INDEX ix_edges_count on arcs(count);
CREATE INDEX ix_edges_weight on arcs(weight);
CREATE INDEX ix_edges_unit_interval on arcs(unit_interval);
CREATE INDEX ix_edges_dual_interval on arcs(dual_interval);

--rollback drop table arcs;
