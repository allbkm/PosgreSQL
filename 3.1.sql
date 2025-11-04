SELECT 
    genres.name,
    COUNT(performer_genres.performerid)
FROM genres
LEFT JOIN performer_genres ON genres.genreid = performer_genres.genreid
GROUP BY genres.genreid, genres.name
ORDER BY COUNT(performer_genres.performerid) DESC;