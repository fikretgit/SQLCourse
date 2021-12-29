--1. 
	SELECT AlbumId,

	COUNT(*) AS number_of_tracks

	FROM tracks

	GROUP BY AlbumId

	ORDER BY number_of_tracks DESC;



--2. 
	SELECT albums.Title,

	tracks.Name

	FROM albums

	INNER JOIN tracks

	ON albums.AlbumId = tracks.AlbumId;



--3. 
	SELECT tracks.AlbumId, albums.Title,

	MIN(tracks.Milliseconds) AS min_duration

	FROM tracks

	JOIN albums

	ON tracks.AlbumId = albums.AlbumId

	GROUP BY tracks.AlbumId, albums.Title

	ORDER BY min_duration DESC;



--4. 
	SELECT tracks.AlbumId, albums.Title,

	SUM(tracks.Milliseconds) AS total_duration

	FROM tracks

	JOIN albums

	ON tracks.AlbumId = albums.AlbumId

	GROUP BY tracks.AlbumId, albums.Title

	ORDER BY total_duration DESC;



--5. 
	SELECT albums.Title, SUM(tracks.Milliseconds) AS total_duration

	FROM tracks

	JOIN albums ON tracks.AlbumId = albums.AlbumId

	GROUP BY tracks.AlbumId

	HAVING total_duration > 4200000

	ORDER BY total_duration DESC;