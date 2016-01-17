var express = require('express')
var app = express()

// Telegram
const spawn = require('child_process').spawn;
const ls = spawn('bash', ['get_token.sh']);

ls.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

ls.stderr.on('data', (data) => {
  console.log(`stderr: ${data}`);
});

ls.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});

// Routes
app.get('/token', function (req, res) {
  process.stdout.write("Request Token\n");
  res.json({"token": "b"});
})
 
app.listen(3000)