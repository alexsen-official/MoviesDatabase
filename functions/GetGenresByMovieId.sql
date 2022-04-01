CREATE FUNCTION [GetGenresByMovieId] (
    @movie_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @genres NVARCHAR(MAX);

    SET @genres = (
        SELECT [Genres].[name] + ', '
        FROM [Genres]

        JOIN [MoviesGenres]
          ON [MoviesGenres].[movie_id] = @movie_id

        WHERE [MoviesGenres].[genre_id] = [Genres].[id]
        FOR XML PATH('')
    );

    SELECT @genres = LEFT(@genres, LEN(@genres) - 1);

    RETURN @genres; 
END;
GO

PRINT [dbo].[GetGenresByMovieId](1);