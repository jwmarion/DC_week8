var config = require('./config.js');
var pgp = require('pg-promise')();

var db = pgp({
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password
});

db.none("insert into track values(12,'dogs 2','100',2022,1,1)")
  .then(function(e){
    console.log("complete");
    pgp.close;
  })
  .catch(function(err){
    console.log(err);
    pgp.close;
  })
