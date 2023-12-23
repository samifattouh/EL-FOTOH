const cors = require('cors');

const express = require('express')
const app = express()
const port = 3000

app.use(express.static('public'))
app.use(cors());


const mysql = require('mysql2');

// Create a connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'pwiw90',
  database: 'test',
  connectionLimit: 10
});

let RESULTS = ''

// Establish a connection from the pool
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }

  console.log('Connected to MySQL');

  // Execute a simple SELECT query
  connection.query('SELECT * FROM product', (queryError, results) => {
    // Release the connection when done
    connection.release();

    if (queryError) {
      console.error('Error executing query:', queryError);
      return;
    }
    RESULTS = results
    // Process the query results here
    console.log('Query results:', results);
  });
});

// Close the connection pool when your application exits
process.on('SIGINT', () => {
  pool.end((err) => {
    if (err) {
      console.error('Error closing the MySQL pool:', err);
    }
    process.exit(0);
  });
});

app.get('/fetchData', async (req, res) => {
  res.send(RESULTS)
});


app.post('/login_api', async (req, res) => {
  console.log(req);
  // result = `select * from Customer where username = 'req.username'`
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
