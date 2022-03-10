--1. Query all of the entries in the Genre table
SELECT * FROM Genre;
SELECT * FROM Song;
SELECT * FROM Album;

--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT ArtistName, Id
FROM Artist 
ORDER BY ArtistName;

--3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT s.Title, a.ArtistName
FROM Song s
LEFT JOIN Artist a on s.ArtistId = a.id;

--4. Write a SELECT query that lists all the Artists that have a Soul Album
SELECT ArtistId, GenreId 
FROM Album
WHERE GenreId = 1;

--5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT ArtistId, GenreId
FROM Album 
WHERE GenreId = 2 OR GenreId = 4;

--6. Write a SELECT statement that lists the Albums with no songs
SELECT a.Title, s.Title
From Album a
LEFT JOIN Song s on a.id = s.AlbumId
WHERE s.Title is NULL;

--7. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Modest Mouse', 1993);

--8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('The Moon and Antartica', '6/13/2000', 58, 'Epic', 28, 2);

--9. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO SONG (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('3rd Planet', 4, '6/13/2000', 2, 28, 23);
INSERT INTO SONG (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Dark Center of the Universe', 5, '6/13/2000', 2, 28, 23);
INSERT INTO SONG (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('A Different City', 3, '6/13/2000', 2, 28, 23);

--10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT al.Title, s.Title, a.ArtistName
FROM Album al
JOIN Artist a ON al.ArtistId = a.Id
JOIN Song s ON s.AlbumId = al.Id
WHERE s.Title = '3rd Planet';

--11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title, Count(s.Id) as NumberOfSongs
FROM Album a
LEFT JOIN Song s ON a.Id = s.AlbumId
GROUP BY a.Id, a.Title;

--12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.ArtistName, Count(s.Id) as NumberOfSongs
From Artist a
LEFT JOIN Song s ON a.Id = s.ArtistId
GROUP BY a.Id, a.ArtistName;

--13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Name, Count(s.Id)
FROM Song s
JOIN Genre g ON s.GenreId = g.Id
GROUP BY g.Name;

--14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT Artist.ArtistName
FROM Artist
JOIN Album ON Album.ArtistId = Artist.Id
GROUP BY Artist.Id, Artist.ArtistName
HAVING Count(Distinct Album.Label) > 1;

--15. Using ORDER BY and TOP 1, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT TOP 1 *
FROM Album
ORDER BY Album.AlbumLength DESC;

--16. Using ORDER BY and TOP 1, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT TOP 1 *
FROM Song
ORDER BY Song.SongLength DESC;

--17. Modify the previous query to also display the title of the album.
SELECT TOP 1 *
FROM Song
LEFT JOIN Album ON Album.Id = Song.AlbumId
ORDER BY Song.SongLength DESC;