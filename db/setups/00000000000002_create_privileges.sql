GRANT ALL ON DATABASE contactopensource TO contactopensource_administrator;

GRANT CONNECT ON DATABASE contactopensource TO contactopensource_reader;
GRANT USAGE ON SCHEMA public TO contactopensource_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO contactopensource_reader;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO contactopensource_reader;

--rollback: REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM contactopensource_reader_administrator;
--rollback: REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public FROM contactopensource_reader_administrator;
--rollback: REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public FROM contactopensource_administrator;
--rollback: REVOKE USAGE ON SCHEMA public FROM contactopensource_administrator;;
--rollback: REVOKE ALL PRIVILEGES ON DATABASE contactopensource FROM contactopensource_administrator;
--rollback: DROP OWNED BY contactopensource_administrator;
--rollback: REASSIGN OWNED BY contactopensource_administrator TO postgres;
--rollback: DROP ROLE contactopensource_administrator;
