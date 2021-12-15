SELECT albums.AlbumId,
albums.Title,
sum(tracks.Milliseconds) as track_süresi
FROM albums
INNER JOIN tracks
ON albums.AlbumId = tracks.AlbumId
WHERE 

SELECT *
FROM TRACKS

