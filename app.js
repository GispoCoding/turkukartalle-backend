const express = require('express')
const postgres = require('pg')

const app = express()
const port = 3000;
const connectionString = process.env.DATABASE_URL;

// Initialize postgres client
const client = new postgres.Client({ connectionString });

client.connect();

app.get('/', (req, res) => res.send('Turku kartalle backend is alive!'))

app.get('/features', (req, res) => {
    const query =
        'SELECT nimi, kuva_url, kuva_info_url, kuva_license_text, license_info_url, ' +
        'ST_AsGeoJSON(geom) AS geom FROM turku_paikat';
    
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

	res.setHeader('Content-Type', 'application/json');
	res.send(JSON.stringify(features));
    });
})


app.listen(port, () => console.log(`Turku PoC backend listening on port ${port}!`))


