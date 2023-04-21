const express = require('express');
const app = express();
const router = express.Router();
const mysql = require('mysql2');
const dotenv = require("dotenv");
const bodyParser = require('body-parser');

dotenv.config();

app.use(router);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// CORS middleware
app.use(function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

// MySQL connection setup
// var connection = mysql.createConnection({
//     host: process.env.MYSQL_HOST,
//     user: process.env.MYSQL_USERNAME,
//     password: process.env.MYSQL_PASSWORD,
//     database: process.env.MYSQL_DATABASE
// });

var connection = require("./db");

connection.connect(function (err) {
    if (err) throw err;
    console.log(`Connected DB: ${process.env.MYSQL_DATABASE}`);
});

app.get('/foodlist', function(req, res) {
    const query = 'SELECT * FROM foodlist';
    connection.query(query, function(err, rows, fields) {
        if (err) {
            console.error('Error querying database: ' + err.stack);
            return res.status(500).send('Error querying database');
        }
        res.json(rows);
    });
});

app.post('/submit', function (req, res) {
  // Extract the data from the request body

    const item = req.body

    if (!item) {
        return res.status(400).send({ error: true, message: 'Please provide item information' });
    }

    connection.query("INSERT INTO foodlist SET ? ", item, function (error, results) {
        if (error) throw error;
        // return res.send({ error: false, data: results.affectedRows, message: 'New student has been created successfully.' });
        return
    });
});

// http://localhost:3030/foodDetail?id=1
app.get('/foodDetail', function(req, res) {

    const id = req.query.id;
    const query = `
    select *
    from foodlist
    where id = ${id};
    `;

    connection.query(query, function(err, rows, fields) {
        if (err) {
            console.error('Error querying database: ' + err.stack);
            return res.status(500).send('Error querying database');
        }
        res.json(rows[0]);
    });
});

app.use('/user', require('./routes/user'));




// // API endpoint to fetch data from MySQL
// app.get('/special', function(req, res) {
//     const query = 'SELECT * FROM special_item';
//     connection.query(query, function(err, rows, fields) {
//         if (err) {
//             console.error('Error querying database: ' + err.stack);
//             return res.status(500).send('Error querying database');
//         }
//         res.json(rows);
//     });
// });


// Server listening
app.listen(process.env.PORT, function () {
    console.log(`Server listening on port: ${process.env.PORT}`);
})
