const express = require('express');
const app = express();
const ejs = require('ejs');
const mysql = require("mysql")
app.use(express.urlencoded({ extended: true }));
const connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'041236',
    database:'car'
});
var dict = ""
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database!');
  });
  
  connection.query('SELECT * FROM car', (err, results) => {
    if (err) throw err;
    dict = results
    console.log(results);
  });
  
connection.end();

app.post('/submit-form', (req, res) => {
    const inputData = req.body.inputData;
    console.log(inputData);
    // Do something with the input data here
});

app.get('/', (req, res) => {
  const data = { message: dict };
  res.render('index.ejs', data);
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});

