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



function dataEnter(question){
}



function createArtist(){
  return prompt('Artist name: ')
    .then (function(artist){
      // console.log("insert into artist values(8," + "'" + artist + "''" +")")
      db.none("insert into artist values(default," + "'" + artist + "'" +")");
    })
      .then(function(e){
        console.log("complete");
        pgp.close;
      })
    .catch(function rejected(err){
      console.log('error:', err.stack);
      prompt.finish();
      pgp.close;
    });
}
createArtist();
// if (entry[0].toUpperCase() == 'TRACK'){
//   prompt('name: ')
//     .then(function table(val){
//       entry.push(val);
//       prompt.done();
//     })
//     .catch(function rejected(err){
//       console.log('error:', err.stack);
//       prompt.finish();
//     });
// }
//
//
//
//
//
// db.none("insert into artist values(default, 'Dr. Droop')")
//   .then(function(result){
//     console.log('complete');
//     pgp.end;
//   })
//   .catch(function(err){
//     console.log(err);
//   })
