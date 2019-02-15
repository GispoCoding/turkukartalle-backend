# turkukartalle-backend
Turku kartalle Oskari-sovellus PoC - backend-osan koodi

## Valmistelu

### Asennukset

### Tietokannan alustus

<pre>
sudo -u postgres psql -f turku_kartalle.sql
</pre>

## Ajaminen

<pre>
export DATABASE_URL='postgresql://turku:turku@localhost/turku_kartalle' 
node app.js
</pre>
