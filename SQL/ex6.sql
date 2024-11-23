UPDATE Song
SET plays = plays * 1.1
WHERE songTitle IN (
    SELECT songTitle
    FROM Classification
    WHERE genreName = 'Rock'
);

DELETE FROM Song
WHERE plays < 2000
AND songTitle NOT IN (
    SELECT songTitle
    FROM Inclusion
);

UPDATE Classification
SET genreName = 'Popular Hits'
WHERE songTitle IN (
    SELECT songTitle
    FROM Song
    WHERE plays > 2000000
);
