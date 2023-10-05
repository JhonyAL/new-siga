const express = require('express')
const cors = require('cors')
const mysql = require('mysql')
const app = express()

const PORT = 3001

app.use(cors())
app.use(express.json())

const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'siga'
});

app.post('/', (req, res) => {
  const data = req.body
  const query = `SELECT * FROM estudante WHERE RM = '${data.estudanteRM}' AND SENHA = '${data.estudantePassword}'`

  connection.query(query, (err, results, fields) => {
    if(results[0]){
      res.json(results[0])
      return
    }
    res.json(null)
    return
  })
})

app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}`)
})