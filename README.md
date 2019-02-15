# turkukartalle-backend
Turku kartalle Oskari-sovellus PoC - backend-osan koodi

## Valmistelu

Oletus, että käytössä on Ubuntu 18.04 -käyttöjärjestelmä.

Halutessasi ota myös <a href="https://github.com/GispoCoding/turkukartalle-ui">turkukartalle-ui</a>-osan koodi käyttöön. Voit kysyä jatkokehitykseen vinkkejä myös vaikkapa <a href="https://www.gispo.fi/">Gispolta</a>.

### Asennukset

PostgreSQL:n ja PostGIS:n asentaminen:
<pre>
sudo apt install postgresql postgresql-contrib postgresql-10-postgis-2.4 postgresql-10-postgis-scripts
</pre>

Node.js:n asentaminen:
<pre>
sudo apt-get install build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install v10.15.1
</pre>

Turku kartalle -backend-projektin asentaminen:
<pre>
sudo apt install git
git clone https://github.com/GispoCoding/turkukartalle-backend.git
cd turkukartalle-backend
npm install
</pre>

### Tietokannan alustus

<pre>
sudo -u postgres psql -f turku_kartalle.sql
</pre>

## Ajaminen

<pre>
export DATABASE_URL='postgresql://turku:turku@localhost/turku_kartalle' 
node app.js
</pre>

## Kiitokset

Sovelluksen toteutuksen tässä muodossa mahdollistivat:
+ Aurajokisäätiö, http://aurajoki.net/
+ HOT-OSM Finlandin ihmiset, https://www.facebook.com/groups/hotosmfi/
+ Gispon ihmiset, http://www.gispo.fi/
+ Oskarin ihmiset ja sivusto, http://oskari.org/
+ Suomen evankelis-luterilainen kirkko (backend)
+ Stack Overflow, https://stackoverflow.com/
+ Build An Interactive Game of Thrones Map (Part I) - Node.js,  PostGIS, and Redis, https://blog.patricktriest.com/game-of-thrones-map-node-postgres-redis/ (backend)
+ Vanhemmat
+ Monet muut ihmiset ja tahot
