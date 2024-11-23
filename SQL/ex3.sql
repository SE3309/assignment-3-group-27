INSERT INTO Song (songTitle, artistName, albumTitle, duration, plays)
SELECT 'Bohemian Rhapsody', artistName, albumTitle, 354, 1500000
FROM Album
WHERE albumTitle = 'A Night at the Opera' AND artistName = 'Queen';

INSERT INTO Song (songTitle, artistName, albumTitle, duration, plays) 
VALUES ( 
'Love of My Life', 
(SELECT artistName FROM Album WHERE albumTitle = 'A Night at the Opera' AND artistName = 'Queen'), 
(SELECT albumTitle FROM Album WHERE albumTitle = 'A Night at the Opera' AND artistName = 'Queen'), 
220, 
800000 
);

INSERT INTO Song (songTitle, artistName, albumTitle, duration, plays) 
SELECT 
'You\'re My Best Friend', 
Artist.artistName, 
Album.albumTitle, 
186, 
500000 
FROM Artist 
JOIN Album ON Artist.artistName = Album.artistName 
WHERE Artist.artistName = 'Queen' AND Album.albumTitle = 'A Night at the Opera';
