CREATE VIEW [DirectorsInfo]
AS
SELECT
    [Directors].[id],
    [Directors].[name],
    COUNT([Movies].[id]) AS [count],
    [dbo].[GetMoviesByDirectorId]([Directors].[id]) AS [movies]

FROM [Directors]

JOIN [MoviesDirectors]
  ON [Directors].[id] = [MoviesDirectors].[director_id]

JOIN [Movies]
  ON [MoviesDirectors].[movie_id] = [Movies].[id]

GROUP BY [Directors].[id],
         [Directors].[name];
GO

SELECT TOP (100) [DirectorsInfo].*
FROM [DirectorsInfo]
ORDER BY [DirectorsInfo].[id];