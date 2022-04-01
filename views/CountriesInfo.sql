CREATE VIEW [CountriesInfo]
AS
SELECT
    [Countries].[id],
    [Countries].[name],
    COUNT([Movies].[id]) AS [count],
    [dbo].[GetMoviesByCountryId]([Countries].[id]) AS [movies]

FROM [Countries]

JOIN [MoviesCountries]
  ON [Countries].[id] = [MoviesCountries].[country_id]

JOIN [Movies]
  ON [MoviesCountries].[movie_id] = [Movies].[id]

GROUP BY [Countries].[id],
         [Countries].[name];
GO

SELECT TOP (100) [CountriesInfo].*
FROM [CountriesInfo]
ORDER BY [CountriesInfo].[id];