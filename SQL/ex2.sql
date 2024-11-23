CREATE TABLE Artist (
artistName VARCHAR(100) NOT NULL,
bio TEXT,
PRIMARY KEY (artistName)
);

CREATE TABLE Album (
albumTitle VARCHAR(100) NOT NULL,
artistName VARCHAR(100) NOT NULL,
releaseDate DATE NOT NULL,
PRIMARY KEY (albumTitle, artistName),
FOREIGN KEY (artistName) REFERENCES Artist(artistName)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Song (
songTitle VARCHAR(100) NOT NULL,
artistName VARCHAR(100) NOT NULL,
albumTitle VARCHAR(100) NOT NULL,
duration INTEGER NOT NULL,
plays INTEGER NOT NULL,
PRIMARY KEY (songTitle, artistName, albumTitle),
FOREIGN KEY (artistName) REFERENCES Artist(artistName)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (albumTitle, artistName) REFERENCES Album(albumTitle, artistName)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE User (
username VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL,
bio TEXT,
PRIMARY KEY (username),
UNIQUE (email)
);

CREATE TABLE Playlist (
name VARCHAR(100) NOT NULL,
username VARCHAR(50) NOT NULL,
creationDate DATE NOT NULL,
PRIMARY KEY (name, username),
FOREIGN KEY (username) REFERENCES User(username)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Genre (
genreName VARCHAR(50) NOT NULL,
description TEXT,
subGenre VARCHAR(50),
PRIMARY KEY (genreName),
FOREIGN KEY (subGenre) REFERENCES Genre(genreName)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE TopChart (
chartName VARCHAR(50) NOT NULL,
chartDate DATE NOT NULL,
PRIMARY KEY (chartName, chartDate)
);

CREATE TABLE UserLike (
username VARCHAR(50) NOT NULL,
songTitle VARCHAR(100) NOT NULL,
artistName VARCHAR(100) NOT NULL,
albumTitle VARCHAR(100) NOT NULL,
likeDate DATE NOT NULL,
PRIMARY KEY (username, songTitle, artistName, albumTitle),
FOREIGN KEY (username) REFERENCES User(username)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (songTitle, artistName, albumTitle) REFERENCES Song(songTitle, artistName, albumTitle)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Inclusion (
name VARCHAR(100) NOT NULL,
username VARCHAR(50) NOT NULL,
songTitle VARCHAR(100) NOT NULL,
artistName VARCHAR(100) NOT NULL,
albumTitle VARCHAR(100) NOT NULL,
PRIMARY KEY (name, username, songTitle, artistName, albumTitle),
FOREIGN KEY (name, username) REFERENCES Playlist(name, username)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (songTitle, artistName, albumTitle) REFERENCES Song(songTitle, artistName, albumTitle)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Classification (
genreName VARCHAR(50) NOT NULL,
songTitle VARCHAR(100) NOT NULL,
artistName VARCHAR(100) NOT NULL,
albumTitle VARCHAR(100) NOT NULL,
PRIMARY KEY (genreName, songTitle, artistName, albumTitle),
FOREIGN KEY (genreName) REFERENCES Genre(genreName)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (songTitle, artistName, albumTitle) REFERENCES Song(songTitle, artistName, albumTitle)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Categorization (
genreName VARCHAR(50) NOT NULL,
albumTitle VARCHAR(100) NOT NULL,
artistName VARCHAR(100) NOT NULL,
PRIMARY KEY (genreName, albumTitle, artistName),
FOREIGN KEY (genreName) REFERENCES Genre(genreName)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (albumTitle, artistName) REFERENCES Album(albumTitle, artistName)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE ChartEntry (
chartName VARCHAR(50) NOT NULL,
chartDate DATE NOT NULL,
songTitle VARCHAR(100) NOT NULL,
artistName VARCHAR(100) NOT NULL,
albumTitle VARCHAR(100) NOT NULL,
PRIMARY KEY (chartName, chartDate, songTitle, artistName, albumTitle),
FOREIGN KEY (chartName, chartDate) REFERENCES TopChart(chartName, chartDate)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (songTitle, artistName, albumTitle) REFERENCES Song(songTitle, artistName, albumTitle)
ON DELETE CASCADE
ON UPDATE CASCADE
);
