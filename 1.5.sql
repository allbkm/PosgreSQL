SELECT name 
FROM tracks
WHERE 
    name ~*\y(my|мой)\y' OR
    name ILIKE 'my %' OR 
    name ILIKE '% my' OR 
    name ILIKE '% my %' OR
    name ILIKE 'мой %' OR 
    name ILIKE '% мой' OR 
    name ILIKE '% мой %' OR
    name ILIKE 'my' OR
    name ILIKE 'мой';
