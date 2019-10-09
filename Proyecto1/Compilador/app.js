const express = require('express');
const app = express();
var ejs = require("ejs");

app.use(express.static("public"));
app.set("view engine", "ejs");

var PORT = process.env.PORT || 5000;

app.get('/', function(req,res){
  res.render('main');
});

app.listen(PORT, function(){
  console.log("Running on PORT: " + PORT);
});