CREATE PROC [ActorsCount]
AS
DECLARE @count INT
SELECT @count = COUNT([Actors].[id])
FROM [Actors]
RETURN @count
GO

DECLARE @actorsCount INT
EXEC @actorsCount = [ActorsCount];
PRINT 'Number of actors in the database: ' + CAST(@actorsCount AS NVARCHAR(10))