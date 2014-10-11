var express = require('express');
var bodyParser = require('body-parser')
var app = express();

app.use(bodyParser.json());

app.get('/', function(req, res){	
	res.json({msg: 'hello_node'});
});

app.post('/add_two', function(req, res){	
	new_val = req.body.val + 2;
  res.json({new_val: new_val});
});

var server = app.listen(3000, function() {
  console.log('Listening on port %d', server.address().port);
});

