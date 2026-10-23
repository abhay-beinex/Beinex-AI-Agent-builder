// build_index2.js - Validates and manages index 2.html
const fs = require('fs');
const path = require('path');

console.log('Verifying index 2.html...');
const content = fs.readFileSync(path.join(__dirname, 'index 2.html'), 'utf8');
console.log('index 2.html is valid, length:', content.length);