const express = require('express');
const connection = require("../db").promise();
const bcrypt = require('bcrypt');

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
      // TODO: Generate token
      res.send({
        message: "Login successful"
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

module.exports = router;