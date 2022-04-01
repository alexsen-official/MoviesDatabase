CREATE FUNCTION [GetActorsByMovieId] (
    @movie_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @actors NVARCHAR(MAX);

    SET @actors = (
        SELECT [Actors].[name] + ', '
        FROM [Actors]

        JOIN [MoviesActors]
          ON [MoviesActors].[movie_id] = @movie_id

        WHERE [MoviesActors].[actor_id] = [Actors].[id]
        FOR XML PATH('')
    );

    SELECT @actors = LEFT(@actors, LEN(@actors) - 1);

    RETURN @actors; 
END;
GO

PRINT [dbo].[GetActorsByMovieId](1);