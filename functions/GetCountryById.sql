CREATE FUNCTION [GetCountryById] (
    @country_id INT
)
RETURNS TABLE
AS
RETURN
    SELECT TOP (1) [CountriesInfo].*
    FROM [CountriesInfo]
    WHERE [CountriesInfo].[id] = @country_id
GO

SELECT *
FROM [dbo].[GetCountryById](1);