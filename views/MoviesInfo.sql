CREATE VIEW [MoviesInfo]
AS
SELECT
    [Movies].[id],
    [Movies].[title],
    [Movies].[rating],
    [Movies].[tagline],
    [Movies].[date],
    [Movies].[age],
    [Movies].[duration],
    [Categories].[name] AS [category],
    [dbo].[GetGenresByMovieId]([Movies].[id]) AS [genres],
    [dbo].[GetCountriesByMovieId]([Movies].[id]) AS [countries],
    [dbo].[GetDirectorsByMovieId]([Movies].[id]) AS [directors],
    [dbo].[GetActorsByMovieId]([Movies].[id]) AS [actors]

FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id];
GO

SELECT TOP (100) [MoviesInfo].*
FROM [MoviesInfo]