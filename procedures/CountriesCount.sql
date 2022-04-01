CREATE PROC [CountriesCount]
AS
DECLARE @count INT
SELECT @count = COUNT([Countries].[id])
FROM [Countries]
RETURN @count
GO

DECLARE @countriesCount INT
EXEC @countriesCount = [CountriesCount];
PRINT 'Number of countries in the database: ' + CAST(@countriesCount AS NVARCHAR(10))