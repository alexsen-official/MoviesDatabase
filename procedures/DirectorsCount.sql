CREATE PROC [DirectorsCount]
AS
DECLARE @count INT
SELECT @count = COUNT([Directors].[id])
FROM [Directors]
RETURN @count
GO

DECLARE @directorsCount INT
EXEC @directorsCount = [DirectorsCount];
PRINT 'Number of directors in the database: ' + CAST(@directorsCount AS NVARCHAR(10))