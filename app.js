const express = require('express')
const postgres = require('pg')

const app = express()
const port = 3000;
const connectionString = process.env.DATABASE_URL;

// Initialize postgres client
const client = new postgres.Client({ connectionString });

client.connect();

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


app.get('/', (req, res) => res.send('Turku kartalle backend is alive!'))

app.get('/features', (req, res) => {
    const query =
        'SELECT nimi, kuva_url, kuva_info_url, kuva_license_text, license_info_url, ' +
        'ST_AsGeoJSON(ST_Transform(geom, 3067)) AS geom FROM turku_paikat';
    
    client.query(query, (err, result) => {

	//console.log(err);
	//console.log(result);
	
	const features = result.rows.map((row) => {
            var feature = JSON.parse(row.geom);
            feature.properties = {
		nimi: row.nimi,
		kuva_url: row.kuva_url,
		kuva_info_url: row.kuva_info_url,
		kuva_license_text: row.kuva_license_text,
		license_info_url: row.license_info_url
            };
            return feature;
	});

	const featureCollection = {
	    type: 'FeatureCollection',
	    crs: {
		type: 'name',
		properties: {
		    name: 'EPSG:3067'
		}
	    },
	    features: features
	}
	
	res.setHeader('Content-Type', 'application/json');
	res.send(JSON.stringify(featureCollection));
    });
})


app.listen(port, () => console.log(`Turku PoC backend listening on port ${port}!`))


