CREATE PROC [GenresCount]
AS
DECLARE @count INT
SELECT @count = COUNT([Genres].[id])
FROM [Genres]
RETURN @count
GO

DECLARE @genresCount INT
EXEC @genresCount = [GenresCount];
PRINT 'Number of genres in the database: ' + CAST(@genresCount AS NVARCHAR(10))