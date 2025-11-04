SELECT 
    albums.name,
    AVG(tracks.duration)
FROM albums
JOIN tracks ON albums.albumid = tracks.albumid
GROUP BY albums.albumid, albums.name;