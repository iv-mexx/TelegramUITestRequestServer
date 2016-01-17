var express = require('express')
var app = express()

// Telegram
const spawn = require('child_process').spawn;

// Routes
app.get('/confirmationCode', function (req, res) {
  process.stdout.write("Request Confirmation Code\n");
  const ls = spawn('bash', ['get_confirmation_code.sh']);
  ls.stdout.on('data', (data) => {
    res.json({"code": `${data}`.trim()});
  });
})

app.listen(3000)