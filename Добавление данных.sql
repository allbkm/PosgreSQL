INSERT INTO Genres (genreid, name) VALUES
(1, 'Рок'),
(2, 'Блюз'),
(3, 'Джаз');

INSERT INTO Performers (performerid, name) VALUES
(1, 'Александр Копытов'),
(2, 'Виктор Цой'),
(3, 'Игорь Дакота'),
(4, 'Евгений Маргулис'),
(5, 'Bob'),
(6, 'Jhon');

INSERT INTO Performer_Genres (performerid, genreid) VALUES
(1, 1),
(2, 2), 
(3, 3), 
(4, 1), 
(5, 2), 
(6, 3); 

INSERT INTO Albums (albumid, name, year) VALUES
(1, 'Альбом_1', 1990),
(2, 'Альбом_2', 2005),
(3, 'Альбом_3', 2020),
(4, 'Альбом_4', 2010),
(5, 'Альбом_5', 2019),
(6, 'Альбом_6', 2018),
(7, 'Альбом_7', 2020);

INSERT INTO Album_Performers (albumid, performerid) VALUES
(1, 1),
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5),
(6, 6),
(7, 3); 

INSERT INTO Tracks (trackid, name, albumid, duration) VALUES
(1, 'Track_1', 1, 180), 
(2, 'Track_2', 2, 120), 
(3, 'Track_3', 3, 240),  
(4, 'Track_4', 4, 300),  
(5, 'Track_5', 1, 120),  
(6, 'Track_6', 2, 240),  
(7, 'My Word', 3, 300);  

INSERT INTO Compilations (compilationid, name, release_year) VALUES
(1, 'Сборник_1', 2014),
(2, 'Сборник_2', 2018),
(3, 'Сборник_3', 2016),
(4, 'Сборник_4', 2019),
(5, 'Сборник_5', 2020),
(6, 'Сборник_6', 2019);

INSERT INTO Compilation_Tracks (compilationid, trackid) VALUES
(1, 7), 
(2, 2), 
(5, 3),
(4, 4), 
(5, 5), 
(6, 6), 
(5, 1);
