CREATE FUNCTION [GetMoviesByActorId] (
    @actor_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @movies NVARCHAR(MAX);

    SET @movies = (
        SELECT [Movies].[title] + ', '
        FROM [Movies]

        JOIN [MoviesActors]
          ON [MoviesActors].[movie_id] = [Movies].[id]

        WHERE [MoviesActors].[actor_id] = @actor_id
        FOR XML PATH('')
    );

    SELECT @movies = LEFT(@movies, LEN(@movies) - 1);

    RETURN @movies; 
END;
GO

PRINT [dbo].[GetMoviesByActorId](1);