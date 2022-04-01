CREATE FUNCTION [GetCountriesByMovieId] (
    @movie_id INT
)
RETURNS
    NVARCHAR(MAX)
AS
BEGIN
    DECLARE @countries NVARCHAR(MAX);

    SET @countries = (
        SELECT [Countries].[name] + ', '
        FROM [Countries]

        JOIN [MoviesCountries]
          ON [MoviesCountries].[movie_id] = @movie_id

        WHERE [MoviesCountries].[country_id] = [Countries].[id]
        FOR XML PATH('')
    );

    SELECT @countries = LEFT(@countries, LEN(@countries) - 1);

    RETURN @countries; 
END;
GO

PRINT [dbo].[GetCountriesByMovieId](1);