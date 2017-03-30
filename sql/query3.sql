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
select artist.name, count(album.name)
from artist, album
where artist.id = album.artist_id

-- What are all the tracks a given artist has recorded?
select artist.name, track.name
from track, album, artist
where track.album_id = album.id
and album.artist_id = artist.id
and artist.name = 'James';

-- What are the top 5 most often recorded songs?
select
  song.name, count(song.id)
from
  song
join
track on song.id = track.song_id
group by
  song.id
limit
	5;

-- Who are the top 5 song writers whose songs have been most often recorded?
SELECT
song_writer.name as song_writer,
count(track.name) as track_name
FROM
song_writer
LEFT OUTER JOIN
song on song.song_writer_id = song_writer.id
LEFT OUTER JOIN
track on track.song_id = song.id
GROUP BY
song_writer.id
order by
track_name desc
LIMIT
5;

-- Who is the most prolific song writer based on the number of songs he has written?
select
	song_writer.name as song_writer, count(song.id) as song_count
from
	song_writer, song
where
	song_writer.id = song.song_writer_id
group by
	song_writer
order by
	song_count desc
limit
	1

-- What songs has a given artist recorded?
select
	distinct on (song.name)
	artist.name as aname,
	song.name
from
	artist
left outer join
	album on artist.id = album.artist_id
left outer join track on
	track.album_id = album.id
right outer join song on
	song.id = track.song_id
where artist.name = 'Toby'

-- Who are the song writers whose songs a given artist has recorded?
select
	artist.name as aname,
	song_writer.name as swname,
	song.name as sname
from
	artist
join
	album on artist.id = album.artist_id
join
	track on track.album_id = album.id
join
	song on song.id = track.song_id
join
	song_writer on song_writer.id = song.song_writer_id
where
	artist.name ='Belle & Sebastian'

-- Who are the artists who have recorded a given song writer's songs?
select
	distinct on (artist.name)
	artist.name as aname
from
	artist
join
	album on artist.id = album.artist_id
join
	track on track.album_id = album.id
join
	song on song.id = track.song_id
join
	song_writer on song_writer.id = song.song_writer_id
where
	song_writer.name ='Girogio';

--bonus 1
select
	artist.name
from
	(select
		artist.name as aname,
		collab.artist_id as collab_id,
		album.name
	from
		artist,
		collab,
		album
	where
		album.id = collab.album_id and
		artist.id = album.artist_id and
		artist.name = 'Julie') lol,
	artist
where
	artist.id = collab_id;




--bonus 2:
select artist.name as James_collabed_with
from	(select collab.artist_id
		from	(select collab.album_id as n
				from artist
				join collab on collab.artist_id = artist.id
				where name = 'James') aid,
				artist,
				album,
				collab
		where collab.album_id= aid.n
		group by collab.artist_id) ids,
		artist
where ids.artist_id = artist.id
