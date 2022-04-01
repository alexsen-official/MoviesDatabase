CREATE VIEW [GenresInfo]
AS
SELECT
    [Genres].[id],
    [Genres].[name],
    COUNT([Movies].[id]) AS [count],
    [dbo].[GetMoviesByGenreId]([Genres].[id]) AS [movies]

FROM [Genres]

JOIN [MoviesGenres]
  ON [Genres].[id] = [MoviesGenres].[genre_id]

JOIN [Movies]
  ON [MoviesGenres].[movie_id] = [Movies].[id]

GROUP BY [Genres].[id],
         [Genres].[name];
GO

SELECT TOP (100) [GenresInfo].*
FROM [GenresInfo]
ORDER BY [GenresInfo].[id];