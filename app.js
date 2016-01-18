var express = require('express')
var app = express()
var bodyParser = require('body-parser')
var jsonParser = bodyParser.json()
app.use(bodyParser.json())

// Spawn Bash Scripts
const spawn = require('child_process').spawn;

// Routes
app.get('/confirmationCode', function (req, res) {
  process.stdout.write("Request Confirmation Code\n");
  const ls = spawn('bash', ['get_confirmation_code.sh']);
  ls.stdout.on('data', (data) => {
    res.json({"code": `${data}`.trim()});
  });
});

app.get('/lastMessage', function (req, res) {
  process.stdout.write("Request Last Message\n");
  const ls = spawn('bash', ['get_last_message.sh']);
  ls.stdout.on('data', (data) => {
    res.json({"message": `${data}`.trim().replace(/\033\[[0-9;]*m/,"")});
  });
});

app.post('/message', function (req, res) {
  const msg = req.body.message;
  process.stdout.write("Post message '" + msg + "'\n");
  const ls = spawn('bash', ['send_message.sh', msg]);
    res.status(201).json({"message": msg})
});

app.listen(3000)