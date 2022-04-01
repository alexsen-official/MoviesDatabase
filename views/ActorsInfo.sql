CREATE VIEW [ActorsInfo]
AS
SELECT
    [Actors].[id],
    [Actors].[name],
    COUNT([Movies].[id]) AS [count],
    [dbo].[GetMoviesByActorId]([Actors].[id]) AS [movies]

FROM [Actors]

JOIN [MoviesActors]
  ON [Actors].[id] = [MoviesActors].[actor_id]

JOIN [Movies]
  ON [MoviesActors].[movie_id] = [Movies].[id]

GROUP BY [Actors].[id],
         [Actors].[name];
GO

SELECT TOP (100) [ActorsInfo].*
FROM [ActorsInfo]
ORDER BY [ActorsInfo].[id];