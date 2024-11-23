SELECT g.genreName, COUNT(c.songTitle) AS songCount
FROM Genre g
JOIN Classification c ON g.genreName = c.genreName
WHERE g.genreName IS NOT NULL
GROUP BY g.genreName
ORDER BY songCount DESC

SELECT artistName, COUNT(*) AS songCount
FROM Song
WHERE artistName IS NOT NULL
GROUP BY artistName
ORDER BY songCount DESC;

SELECT albumTitle, artistName
FROM Album
WHERE artistName IN (
	SELECT artistName
	FROM Song
	WHERE songTitle = 'Come Together'
);

SELECT Playlist.name AS playlistName, Playlist.username, COUNT(Inclusion.songTitle) AS songCount
FROM Playlist
JOIN Inclusion ON Playlist.name = Inclusion.name AND Playlist.username = Inclusion.username
WHERE Playlist.name IS NOT NULL
GROUP BY Playlist.name, Playlist.username
HAVING COUNT(Inclusion.songTitle) = 1;

SELECT artistName
FROM Artist
WHERE EXISTS (
    SELECT 1
    FROM ChartEntry
    WHERE ChartEntry.artistName = Artist.artistName
);

SELECT artistName
FROM Song
WHERE artistName IS NOT NULL
GROUP BY artistName
HAVING SUM(plays) = (
SELECT MAX(totalPlays)
FROM (
        SELECT artistName, SUM(plays) AS totalPlays
        FROM Song
        WHERE artistName IS NOT NULL
        GROUP BY artistName
) AS SubQuery
);

SELECT songTitle, artistName, 
 (plays / (SELECT SUM(plays) FROM Song WHERE plays IS NOT NULL) * 100) AS playPercentage
FROM Song
WHERE plays IS NOT NULL
ORDER BY playPercentage DESC;