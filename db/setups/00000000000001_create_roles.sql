CREATE ROLE contactopensource_administrator WITH LOGIN ENCRYPTED PASSWORD 'secret';
CREATE ROLE contactopensource_reader WITH LOGIN ENCRYPTED PASSWORD 'secret';

--rollback: REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM contactopensource_reader;
--rollback: REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public FROM contactopensource_reader;
--rollback: REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public FROM contactopensource_reader;
--rollback: REVOKE USAGE ON SCHEMA public FROM contactopensource_reader;
--rollback: REVOKE ALL PRIVILEGES ON DATABASE contactopensource FROM contactopensource_reader;
--rollback: DROP OWNED BY contactopensource_reader;
--rollback: REASSIGN OWNED BY contactopensource_reader TO postgres;
--rollback: DROP ROLE contactopensource_reader;
