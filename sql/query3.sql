--What are tracks for a given album?
select track.name
from track
left outer join album on album.id = track.album_id
where album.name = 'A Very Merry Christmas';

--What are the albums produced by a given artist?
select album.name, artist.name
from album
left outer join artist on album.artist_id = artist.id
where artist.name = 'James';

-- What is the track with the longest duration?
select track.name, track.length
from track
order by track.length desc
limit 1;

-- What are the albums released in the 60s? 70s? 80s? 90s?
select count(album.name)
from album
where album.year >= 1990 and album.year <= 1999;

-- How many albums did a given artist produce in the 90s?
select count(album.name)
from album
left outer join artist on artist.id = album.artist_id
where album.year >= 1990 and album.year <= 1999 and artist.name = 'James';
-- What is each artist's latest album?

select artist.name, max(album.year)
from album, artist
where album.artist_id = artist.id
group by artist.id

-- List all albums along with its total duration based on summing the duration of its tracks.
select album.name, sum(track.length)
from album, track
where track.album_id = album.id
group by album.id

-- What is the album with the longest duration?
select *
  from (select album.name, sum(track.length)
    from album, track
    where track.album_id = album.id
    group by album.id) z
  order by sum
  limit 1;

-- Who are the 5 most prolific artists based on the number of albums they have recorded?
-- What are all the tracks a given artist has recorded?
-- What are the top 5 most often recorded songs?
-- Who are the top 5 song writers whose songs have been most often recorded?
-- Who is the most prolific song writer based on the number of songs he has written?
-- What songs has a given artist recorded?
-- Who are the song writers whose songs a given artist has recorded?
-- Who are the artists who have recorded a given song writer's songs?
