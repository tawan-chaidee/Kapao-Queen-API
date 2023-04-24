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
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();
});

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
            return res.status(500).send('Internal server error');
        }

        res.status(200).json({
            success: true,
            result: rows
        });
    });
});

app.get('/itemSearch', function (req,res){
    let type = req.query.type;
    let search = req.query.search;

    let sql
    if (type === 'tag') {
        sql = `
        select *
        from foodlist
        where tag1 like '%${search}%'
        or tag2 like '%${search}%'
        `
    } else {
        sql = `
        select *
        from foodlist
        where ${type} like '%${search}%';
        `;
    }

    connection.query(sql, function (error, results) {
        if (error) {
            console.error(error);
            return res.status(500).send({
                error: true,
                message: 'Internal server error',
            });
        }
        res.json(results);
    })
})

app.get('/itemAdvanceSearch', function (req,res){
    let id = req.query.id;
    let name = req.query.name;
    let tag = req.query.tag;

    let sql = `
    select *
    from foodlist
    where id like '%${id}%'
    or tag1 like '%${tag}%' 
    or tag2 like '%${tag}%'
    or name like '%${name}%';
    `


    connection.query(sql, function (error, results) {
        if (error) {
            console.error(error);
            return res.status(500).send({
                error: true,
                message: 'Internal server error',
            });
        }
        res.json(results);
    })
})

app.post('/itemSubmit', function (req, res) {
    // Extract the data from the request body
    const item = req.body

    // Use try catch to prevent app from crashing on inccorect input
    connection.query('INSERT INTO foodlist SET ?', item, function (error, results) {
    if (error) {
        console.error(error);
        return res.status(500).send({
            error: true,
            message: 'Invalid Input',
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
app.get('/itemDetail', function (req, res) {

    const id = req.query.id;
    const query = `
    select *
    from foodlist
    where id = ${id};
    `;
    connection.query(query, async function (error, rows, fields) {
        if (error) {
            console.error(error);
            return res.status(500).send({
                error: true,
                message: 'Internal server error',
            });
        }

        // replace taglist
        let splittedTags = rows[0].taglist.split(',');
        rows[0].taglist = splittedTags;

        // get ingredients
        let [ingredients,_] = await connection.promise().query(`SELECT name, img from food_ingredients fi left join ingredients i on fi.ingredient_id = i.id where fi.food_id = ${id}`)

        res.json({
            success: true,
            result: {
                ...rows[0],
                ingredients
            }
        });
    });
});

app.use('/user', require('./routes/user').router);


app.put('/itemUpdate', function (req, res) {

    console.log(req.body)
    let id = req.body.id
    let item = req.body;

    connection.query("UPDATE foodlist SET ? WHERE id = ?", [item, id], function (error,results) {
        if (error) {
            console.error(error);
            return res.status(500).send({
                error: true,
                message: 'Invalid Input',
            });
        }
    
        return res.send({
            error: false,
            data: results.affectedRows,
            message: 'New item has been created successfully.',
        });
    });
});

app.get('/ingredientList', function (req, res) {
    const query = 'SELECT * FROM ingredients';
    connection.query(query, function (err, rows, fields) {
        if (err) {
            console.error('Error querying database: ' + err.stack);
            return res.status(500).send('Internal server error');
        }
        res.send({
            success: true,
            result: rows
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
        if (error) {
            console.error(error);
            return res.status(500).send({
                error: true,
                message: 'Invalid Input',
            });
        }
        return res.send({ error: false, data: results.affectedRows, message: 'item has been deleted successfully.' });
    });
});




// Server listening
app.listen(process.env.PORT, function () {
    console.log(`Server listening on port: ${process.env.PORT}`);
})
