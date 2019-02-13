# turkukartalle-backend
Turku kartalle Oskari-sovellus PoC - backend-osan koodi

## Valmistelu

### Asennukset

### Tietokannan alustus

sudo -u postgres psql

Luo tietokanta:
CREATE DATABASE turku_kartalle;
\c turku_kartalle
CREATE EXTENSION POSTGIS;
CREATE USER turku WITH PASSWORD 'turku';
GRANT ALL PRIVILEGES ON DATABASE turku_kartalle to turku;
