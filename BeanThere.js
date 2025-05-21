const express = require('express');
const app = express();
const path = require('path');
const mysql = require('mysql2');
const { check, validationResult } = require('express-validator');
const port = 4000;


//setting up static directory and view engine
const dotnenv = require('dotenv');
dotnenv.config({path : '\.env'});


//url encoded bodies parsing
app.use(express.urlencoded({extended: false}));
app.use(express.json()); 


app.listen(4000, () => {
  console.log(`Server listening at http://localhost:${4000}`);
});



app.set('view engine', 'hbs');
const publicDirectory = path.join(__dirname);
app.use(express.static(publicDirectory)); 

//defining routes
const router = require('./routes/pages');
app.use(router);
app.use('/auth', require('./routes/auth'))

// BAZA DE DATE



const db = mysql.createConnection({
  host: process.env.beantheredb_host,
  user: process.env.beantheredb_user,
  password: process.env.beantheredb_password,
  database: process.env.beantheredb 
}); 

db.connect((err) => {
  if (err) {
    console.error('beantheredb connection failed:', err);
    return;
  }
  console.log("Connected to beantheredb database");
});





// DE ADAUGAT STATUS CODES, RES, MES, DATA





