CREATE PROC [MoviesCount]
AS
DECLARE @count INT
SELECT @count = COUNT([Movies].[id])
FROM [Movies]
RETURN @count
GO

DECLARE @moviesCount INT
EXEC @moviesCount = [MoviesCount];
PRINT 'Number of movies in the database: ' + CAST(@moviesCount AS NVARCHAR(10))