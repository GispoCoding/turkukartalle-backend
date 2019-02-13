const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Turku kartalle backend is alive!'))

app.listen(port, () => console.log(`Turku PoC backend listening on port ${port}!`))

