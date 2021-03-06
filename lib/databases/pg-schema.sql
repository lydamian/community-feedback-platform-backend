-- Seeing as we will be testing out this script alot we can destroy the db before creating everything again
DROP DATABASE IF EXISTS community_feedback_db;

-- Create the db
CREATE DATABASE community_feedback_db;

-- Move into the db
\c community_feedback_db

-- Create our table if it doesn't already exist

CREATE TABLE IF NOT EXISTS community_user
(
  id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  email_address text NOT NULL,
  username varchar(100) NOT NULL,
  password text NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  created_at timestamp with time zone DEFAULT (now())::timestamp with time zone NOT NULL,
  last_updated_at timestamp with time zone DEFAULT (now())::timestamp with time zone NOT NULL
);

-- Changes the owner of the table to postgres which is the default when installing postgres
ALTER TABLE community_user
  OWNER to postgres;