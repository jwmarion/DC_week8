var express = require('express');
var app = express();
app.set('view engine','hbs');
var animalsArr = [
  { name: 'cats', favorite: true },
  { name: 'dogs', favorite: true },
  { name: 'tree frogs', favorite: true },
  { name: 'earth worms', favorite: false },
  { name: 'guinea pigs', favorite: true },
];




app.get('/cat', function(req, res){
  res.render('hello.hbs',{
    title: 'meow cat',
    body: 'mew mew'
  });
});

app.get('/dog', function(req, res){
  res.render('layout.hbs',{
    title: 'woof dog',
    body: 'arf arf'
  });
});

app.get('/cats_and_dogs', function(req, res){
  res.render('layout.hbs',{
    title: 'can you believe it?',
    body: 'Friends forever'
  });
});

app.get('/age/', function(req,res){
  var age = req.query.age || 'world';
  res.render('layout.hbs',{
    title: 'Your age: ',
    body: 'You were born in ' + (2017-age) +'!'
  });
});

app.get('/greet/:name', function(req,res){
  var name = req.params.name || 'world';
  var age = req.query.age;
  res.render('layout.hbs',{
    title: 'Hello!' + name,
    body: 'You are ' +(2017 - age)+ ' years old!'
  });
});

app.get('/favorite_animals', function(req, res){
  res.render('hello2.hbs',{
    title:'My Favorite Animals!',
    animals: animalsArr,
    // template: 'animal.hbs'
    // body:'<ol>{{#each animals}}<li>{{name}}</li>{{/each}}</ol>'
  });
});

app.listen(3000,function(){
  console.log('Example app listening on port 3000!');
});
