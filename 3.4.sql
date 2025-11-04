SELECT performers.name
FROM performers
WHERE performers.performerid NOT IN (
    SELECT album_performers.performerid
    FROM album_performers
    JOIN albums ON album_performers.albumid = albums.albumid
    WHERE albums.year = 2020
);