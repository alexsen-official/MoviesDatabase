CREATE FUNCTION [GetDirectorsByMovieId] (
    @movie_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @directors NVARCHAR(MAX);

    SET @directors = (
        SELECT [Directors].[name] + ', '
        FROM [Directors]

        JOIN [MoviesDirectors]
          ON [MoviesDirectors].[movie_id] = @movie_id

        WHERE [MoviesDirectors].[director_id] = [Directors].[id]
        FOR XML PATH('')
    );

    SELECT @directors = LEFT(@directors, LEN(@directors) - 1);

    RETURN @directors; 
END;
GO

PRINT [dbo].[GetDirectorsByMovieId](1);