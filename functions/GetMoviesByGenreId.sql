CREATE FUNCTION [GetMoviesByGenreId] (
    @genre_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @movies NVARCHAR(MAX);

    SET @movies = (
        SELECT [Movies].[title] + ', '
        FROM [Movies]

        JOIN [MoviesGenres]
          ON [MoviesGenres].[movie_id] = [Movies].[id]

        WHERE [MoviesGenres].[genre_id] = @genre_id
        FOR XML PATH('')
    );

    SELECT @movies = LEFT(@movies, LEN(@movies) - 1);

    RETURN @movies; 
END;

PRINT [dbo].[GetMoviesByGenreId](1);