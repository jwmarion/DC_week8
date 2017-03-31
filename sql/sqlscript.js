var config = require('./config.js');
var prompt = require('prompt-promise');
var pgp = require('pg-promise')({
  promiseLib: Promise
});

var db = pgp({
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password
});
prompt('what table?: ')
.then
db.query()
  .then(function(results){
    console.log(results);
    pgp.close;
  })
  .catch(function(err){
    console.log(err);
    pgp.close();
  });
