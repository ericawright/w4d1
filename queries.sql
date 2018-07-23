-- all tracks, with artist name and album name
SELECT
  tracks.title AS title,
  albums.title AS album,
  artists.name AS artist
FROM tracks
JOIN albums ON tracks.album_id = albums.id
JOIN artists ON albums.artist_id = artists.id;


-- same as above
-- using WHERE to specify an IMPLICIT JOIN

SELECT
  tracks.title AS title,
  albums.title AS album,
  artists.name AS artist
FROM tracks, albums, artists
WHERE albums.artist_id = artists.id AND tracks.album_id = albums.id;


-- all artists with genres

SELECT
  a.name AS artist,
  string_agg(t.name,', ') 
FROM artists_genres AS at
JOIN artists AS a ON at.artist_id = a.id 
JOIN genres AS t ON at.genre_id = t.id
GROUP BY artist;


-- # of albums per artist

SELECT
  artists.name as artist,
  COUNT(albums.id) as album_count
FROM artists
JOIN albums ON albums.artist_id = artists.id
GROUP BY artists.id;


-- # of albums per artist
-- who have more than 2 albums, in descending order

SELECT
  artists.name as artist,
  COUNT(albums.id) as album_count
FROM artists
JOIN albums ON albums.artist_id = artists.id
GROUP BY artists.id
HAVING COUNT(albums.id) >= 2
ORDER BY album_count DESC;


-- average tracks per album

SELECT COUNT(distinct tracks.id) / COUNT(distinct albums.id) AS average
FROM albums, tracks;


-- same as above
-- but using an implicit JOIN instead of DISTINCT

SELECT COUNT(tracks.id) / COUNT(distinct albums.id) AS avg
FROM albums, tracks
WHERE tracks.album_id = albums.id;


-- average number of tracks in albums of each genre, in order

  SELECT
    genres.name as genre,
    COUNT(tracks.id) / COUNT(distinct albums.id) AS avg
  FROM genres, artists, artists_genres, albums, tracks
  WHERE artists_genres.artist_id = artists.id
  AND artists_genres.genre_id = genres.id
  AND albums.artist_id = artists.id
  AND albums.id = tracks.album_id
  GROUP BY genres.id
  ORDER BY avg DESC;


-- demonstrate the usefulness of an outer join when we don't know where data will exist

select albums.title, sum(count) 
from tracks
left outer join plays on plays.track_id = tracks.id
inner join albums on tracks.album_id = albums.id
group by albums.title;