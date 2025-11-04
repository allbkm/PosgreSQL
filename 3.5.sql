SELECT DISTINCT compilations.name
FROM compilations
JOIN compilation_tracks ON compilations.compilationid = compilation_tracks.compilationid
JOIN tracks ON compilation_tracks.trackid = tracks.trackid
JOIN album_performers ON tracks.albumid = album_performers.albumid
JOIN performers ON album_performers.performerid = performers.performerid
WHERE performers.name = 'Игорь Дакота';