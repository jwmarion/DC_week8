var config = require('./config.js');

var pgp = require('pg-promise')();

var db = pgp({
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password
});

db.none("insert into album values(6,'This is just a test album', 2021,1)")
  .then(function(result){
    console.log(result);
    pgp.end;
  })
  .catch(function(err){
    console.log(err.message);
    pgp.end;
  });

// db.any("select * from artist")
//   .then(function(result) {
//     console.log(result);
//     pgp.end();
//   })
//   .catch(function(err) {
//     console.log(err.message);
//     pgp.end();
//   });
