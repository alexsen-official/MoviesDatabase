CREATE FUNCTION [GetMoviesByDirectorId] (
    @director_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @movies NVARCHAR(MAX);

    SET @movies = (
        SELECT [Movies].[title] + ', '
        FROM [Movies]

        JOIN [MoviesDirectors]
          ON [MoviesDirectors].[movie_id] = [Movies].[id]

        WHERE [MoviesDirectors].[director_id] = @director_id
        FOR XML PATH('')
    );

    SELECT @movies = LEFT(@movies, LEN(@movies) - 1);

    RETURN @movies; 
END;
GO

PRINT [dbo].[GetMoviesByDirectorId](1);