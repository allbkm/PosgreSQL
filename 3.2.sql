SELECT COUNT(tracks.trackid)
FROM tracks
JOIN albums ON tracks.albumid = albums.albumid
WHERE albums.year BETWEEN 2019 AND 2020;