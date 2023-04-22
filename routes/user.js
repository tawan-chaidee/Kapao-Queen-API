const express = require('express');
const connection = require("../db").promise();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const router = express.Router();

const saltRound = 10;

router.get('/', (req, res) => {
  res.send("Hello user!")
});

router.post('/register', async (req, res) => {
  // Extract the data from the request body
  let {username, password} = req.body
  if (!username || !password) {
    res.status(400).send({
      message: "Please enter both username and password"
    })
  }

  // Generate hash
  let hash = await bcrypt.hash(password, saltRound)
  console.log(hash)

  try {
    // Insert user into database
    let result = await connection.query("INSERT INTO users SET ?", {username, password: hash})
    res.send({
      message: "User created successfully",
    })
  } catch (e) {
    console.log(e)
    res.status(500).send({
      message: "Internal server error",
      error: e
    })
  }
});

router.post('/login', async (req, res) => {
  let {username, password} = req.body
  if (!username || !password) {
    res.status(400).send({
      message: "Please enter both username and password"
    })
  }

  try {
    // get the user
    let [result,_] = await connection.query("SELECT * FROM users WHERE username = ?", [username])
    if (result.length == 0) {
      res.status(400).send({
        message: "Invalid username or password"
      })
    }

    // Check if password is correct
    // res.send(result)
    let hash = result[0].password
    let match = await bcrypt.compare(password, hash)

    if (match) {
      let token = jwt.sign({
        username, is_admin: result[0].is_admin
      }, process.env.JWT_SECRET, { expiresIn: '1h' });

      res.cookie('token',token).send({
        message: "Login successful",
        token
      })
    } else {
      res.status(400).send({
        message: "Invalid username or password"
      })
    }
  } catch (e) {
    console.log(e)
    res.status(500).send({
      message: "Internal server error",
      error: e
    })
  }
})

router.post('/access', (req, res) => {
  // Extract the token from cookies, body or headers
  let {token} = req.cookies
  token = token || req.body.token || req.headers.authorization.split(" ")[1]

  // Check if token is provided
  if (!token) {
    res.status(401).send({
      message: "Please login or attach token"
    })
  }

  // Verify token
  let decoded = {}
  try {
    decoded = jwt.verify(token, process.env.JWT_SECRET)
  } catch (e) {
    return res.status(401).send({
      message: "Invalid token"
    })
  }
  
  console.log(decoded)

  // console.log(token)
  
})

module.exports = router;