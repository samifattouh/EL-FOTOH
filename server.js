
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(express.static('public'));
app.use(cors());
app.use(bodyParser.json());

// Create a connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'pwiw90',
  database: 'elfotohweb',
  connectionLimit: 10
});

let RESULTS = '';

// Fetching product data
pool.query('SELECT * FROM product', (queryError, results) => {
  if (queryError) {
    console.error('Error fetching products:', queryError);
    return;
  }
  RESULTS = results;
});

app.get('/fetchData', (req, res) => {
  res.send(RESULTS);
});

app.post('/login_api', (req, res) => {
  const { username, password } = req.body;

  pool.query(
    'SELECT * FROM Customer WHERE Email = ? AND Password = ?',
    [Email, password],
    (error, results) => {
      if (error) {
        res.status(500).send('Error checking credentials');
        return;
      }

      if (results.length > 0) {
        res.send('Login successful');
      } else {
        res.status(401).send('Incorrect username or password');
      }
    }
  );
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

// Close the connection pool when the application exits
process.on('SIGINT', () => {
  pool.end(err => {
    if (err) console.error('Error closing the MySQL pool:', err);
    process.exit(0);
  });
});