var config = require('./config.js');
var prompt = require('prompt-promise');
var pgp = require('pg-promise')({
  promiseLib: Promise
});

var config = require('./config.js');

var db = pgp({
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password
});

function createAlbum(){
  var album = {};

  prompt('Album name?')
    .then(function(album_name){
      album.name = album_name;
      return [album,prompt('Album year?')];
    })
    .spread(function(album, album_year){
      album.year = album_year;
      return [album,prompt('Artist ID? ')];
    })
    .spread(function(album, artist_id){
      album.artist_id = artist_id;

      var sql = 'insert into album values' +"(default, '" +album.name +"'," +album.year +", " +album.artist_id  + ")";
      console.log(sql);
      return db.none(sql);
    })
    .then(function(result){
      console.log(result);
      pgp.close;
    }.then(function)
    .catch(function(err){
      console.log(err.message);
      pgp.close;
    });
}
