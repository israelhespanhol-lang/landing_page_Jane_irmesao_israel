const fs = require('fs');
const code = fs.readFileSync('assets/index-v3.js', 'utf8');
const matches = [...code.matchAll(/.{0,50}27 AGO.{0,50}/gi)];
matches.forEach(m => console.log(m[0]));
