const express = require('express');
const app = express();
const router = express.Router();
const mysql = require('mysql2');
const dotenv = require("dotenv");
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

dotenv.config();

app.use(router);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser())


// CORS middleware
app.use(function (req, res, next) {
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

app.get('/foodlist', function (req, res) {
    const query = 'SELECT * FROM foodlist';
    connection.query(query, function (err, rows, fields) {
        if (err) {
            console.error('Error querying database: ' + err.stack);
            return res.status(500).send('Error querying database');
        }
        res.json(rows);
    });
});

app.post('/itemSubmit', function (req, res) {
    // Extract the data from the request body
    const item = req.body

    // Use try catch to prevent app from crashing on inccorect input
    connection.query('INSERT INTO foodlist SET ?', item, function (error, results) {
    if (error) {
        console.error(error);
        return res.status(500).send({
            error: true,
            message: 'Internal server error',
        });
    }

    return res.send({
        error: false,
        data: results.affectedRows,
        message: 'New item has been created successfully.',
    });
});

});

// http://localhost:3030/foodDetail?id=1
app.get('/foodDetail', function (req, res) {

    const id = req.query.id;
    const query = `
    select *
    from foodlist
    where id = ${id};
    `;

    connection.query(query, function (error, rows, fields) {
        if (error) {
            console.error(error);
            return res.status(500).send({
                error: true,
                message: 'Internal server error',
            });
        }
        res.json(rows[0]);
    });
});

app.use('/user', require('./routes/user').router);


app.put('/itemUpdate', function (req, res) {

    console.log(req.body)
    let id = req.body.id
    let item = req.body;

    connection.query("UPDATE foodlist SET ? WHERE id = ?", [item, id], function (error,
        results) {
        if (error) throw error;
        return res.send({
            error: false, data: results.affectedRows, message: 'item has been updated successfully.'
        })
    });
});

app.delete('/itemDelete', function (req, res) {

    console.log(req.query)
    const id = req.query.id;

    // if (!student_id) {
    //     return res.status(400).send({ error: true, message: 'Please provide student_id' });
    // }

    connection.query('DELETE FROM foodlist WHERE id = ?', [id], function (error, results) {
        if (error) throw error;
        return res.send({ error: false, data: results.affectedRows, message: 'item has been deleted successfully.' });
    });
});

// Server listening
app.listen(process.env.PORT, function () {
    console.log(`Server listening on port: ${process.env.PORT}`);
})
