CREATE VIEW SongsWithGenres AS
SELECT s.songTitle, s.artistName, s.albumTitle, s.plays, c.genreName
FROM Song s
JOIN Classification c ON s.songTitle = c.songTitle
WHERE s.plays > 1000000;

INSERT INTO SongsWithGenres (songTitle, artistName, albumTitle, plays, genreName)
VALUES ('New Song', 'New Artist', 'New Album', 1200000, 'Pop');
