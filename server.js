const express = require('express');
const mysql = require('mysql2/promise'); // Import the promise-based version
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

app.get('/fetchData', async (req, res) => {
  try {
    const [rows, fields] = await pool.query('SELECT * FROM product');
    res.send(rows);
  } catch (error) {
    console.error('Error fetching products:', error);
    res.status(500).send('Error fetching products');
  }
});

app.post('/login_api', async (req, res) => {
  const { Email, password } = req.body;

  console.log('Received login request with Email:', Email);

  try {
    const [results] = await pool.query(
      `SELECT * FROM Customer WHERE Email = ? AND Password = ?`,
      [Email, password]
    );
    

    console.log('Results from the database:', results);

    if (results.length > 0) {
      res.send('Login successful');
    } else {
      res.status(401).send('Incorrect username or password');
    }
  } catch (error) {
    console.error('Error checking credentials:', error);
    res.status(500).send('Error checking credentials');
  }
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

// Close the connection pool when the application exits
process.on('SIGINT', () => {
  pool.end().then(() => {
    console.log('MySQL pool closed');
    process.exit(0);
  });
});
