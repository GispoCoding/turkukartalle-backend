
CREATE DATABASE IF NOT EXISTS turku_kartalle;

\c turku_kartalle

CREATE EXTENSION IF NOT EXISTS POSTGIS;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP USER IF EXISTS turku;
CREATE USER turku WITH PASSWORD 'turku';
GRANT ALL PRIVILEGES ON DATABASE turku_kartalle to turku;

DROP TABLE IF EXISTS turku_paikat; 
CREATE TABLE turku_paikat (
       nimi varchar,
       kuva_url varchar,
       kuva_info_url varchar,
       kuva_license_text varchar,
       license_info_url varchar,
       x float,
       y float,
       geom geometry(point),
       id uuid NOT NULL DEFAULT uuid_generate_v1mc(),
       CONSTRAINT turku_pkey PRIMARY KEY (id)
)
WITH (
     OIDS=FALSE
);
GRANT SELECT ON ALL TABLES IN SCHEMA public TO turku;


COPY turku_paikat (
      nimi,
      kuva_url,
      kuva_info_url,
      kuva_license_text,
      license_info_url,
      x,
      y
) FROM '/home/ubuntu/turkukartalle-backend/turku_paikat.csv' WITH NULL AS '' CSV HEADER;

UPDATE turku_paikat SET geom = ST_SetSRID(ST_MakePoint(x, y), 4326);
