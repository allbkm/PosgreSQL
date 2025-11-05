CREATE TABLE Genres (
    genreid SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Performers (
    performerid SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

CREATE TABLE Performer_Genres (
    performerid INTEGER REFERENCES Performers(performerid) ON DELETE CASCADE,
    genreid INTEGER REFERENCES Genres(genreid) ON DELETE CASCADE,
    PRIMARY KEY (performerid, genreid)
);

CREATE TABLE Albums (
    albumid SERIAL PRIMARY KEY,
    name VARCHAR(300) NOT NULL,
    year INTEGER
);

CREATE TABLE Album_Performers (
    albumid INTEGER REFERENCES Albums(albumid) ON DELETE CASCADE,
    performerid INTEGER REFERENCES Performers(performerid) ON DELETE CASCADE,
    PRIMARY KEY (albumid, performerid)
);

CREATE TABLE Tracks (
    trackid SERIAL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    albumid INTEGER NOT NULL REFERENCES Albums(albumid) ON DELETE CASCADE,
    duration INTEGER CHECK (duration > 0)
);

CREATE TABLE Compilations (
    compilationid SERIAL PRIMARY KEY,
    name VARCHAR(300) NOT NULL,
    release_year INTEGER CHECK (release_year >= 1900)
);

CREATE TABLE Compilation_Tracks (
    compilationid INTEGER REFERENCES Compilations(compilationid) ON DELETE CASCADE,
    trackid INTEGER REFERENCES Tracks(trackid) ON DELETE CASCADE,
    PRIMARY KEY (compilationid, trackid)
);
