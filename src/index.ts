import express from 'express';
import https from 'https';
import fs from 'fs';
import path from 'path';
import { Score } from './modules/score.js';

const app = express();

app.get('/', function(request, response){
  const options = {
    root: path.join(__dirname)
  };

  const x = new Score
  console.log(x.win())

  response.sendFile('static/index.html', options);
});

https.createServer({
  key: fs.readFileSync('.ssl/server.key'),
  cert: fs.readFileSync('.ssl/server.cert')
}, app).listen(3000, () => {
  console.log(`Server running on port ${3000}`);
});

console.log('lol')
