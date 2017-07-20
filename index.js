const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
})

app.listen(process.env.PORT || 80, function() {
 console.log('listening on port ' + process.env.PORT || 80);
});

