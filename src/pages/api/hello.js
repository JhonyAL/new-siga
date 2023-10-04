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

app.get('/RM/:estudanteRM/password/:password', (req, res) => {
  const reqParams = {
    rm: req.params.rm
  }
  // const req = req
  const query = `SELECT * FROM estudante WHERE estudante.rm = '${req.params.estudanteRM}' AND estudante.password = '${req.params.password}'`
  // res.send(req.params)
  // res.send(query)

  // function fetchID(data, callback) {
  //   connection.query(`SELECT * FROM estudante WHERE RM = '${data.rm}'`, function(err, rows) {
  //       if (err) {
  //           callback(err, null);
  //       } else {
  //           callback(null, rows);
  //       }
  //   });
  // }
  // var user_id;
  // fetchID(reqParams, function(err, content) {
  //     if (err) {
  //     console.log(err);
  //     res.send(err);  
  //     // Do something with your error...
  //     } else {
  //     user_id = content;
  //     console.log(user_id);
  //     res.send("user id is -" + user_id);
  //     }
  // });

  connection.query(`SELECT * FROM estudante WHERE RM = '${reqParams.rm}'`, (err, results, fields) => {
    if(results){
      res.json(results)
    }
    res.send(`SELECT * FROM estudante WHERE RM = '${reqParams.rm}'`)
  })

})

app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}`)
})