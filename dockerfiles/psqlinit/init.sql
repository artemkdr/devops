ALTER ROLE postgres WITH SUPERUSER;

CREATE DATABASE "somedatabase";

\c "somedatabase"

CREATE TABLE users (
	username text PRIMARY KEY,
	createdate timestamp with time zone
);