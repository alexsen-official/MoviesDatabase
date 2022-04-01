CREATE FUNCTION [FindCountries] (
    @query NVARCHAR(255)
)
RETURNS TABLE
AS
RETURN
    SELECT [CountriesInfo].*
    FROM [CountriesInfo]
    WHERE LOWER([CountriesInfo].[name])
     LIKE LOWER(CONCAT('%', @query, '%'));
GO

SELECT *
FROM [dbo].[FindCountries]('Ро');