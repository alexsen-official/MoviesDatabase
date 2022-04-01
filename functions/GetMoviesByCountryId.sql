CREATE FUNCTION [GetMoviesByCountryId] (
    @country_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @movies NVARCHAR(MAX);

    SET @movies = (
        SELECT [Movies].[title] + ', '
        FROM [Movies]

        JOIN [MoviesCountries]
          ON [MoviesCountries].[movie_id] = [Movies].[id]

        WHERE [MoviesCountries].[country_id] = @country_id
        FOR XML PATH('')
    );

    SELECT @movies = LEFT(@movies, LEN(@movies) - 1);

    RETURN @movies; 
END;
GO

PRINT [dbo].[GetMoviesByCountryId](1);