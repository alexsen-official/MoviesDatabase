CREATE FUNCTION [FindMovies] (
    @query NVARCHAR(255)
)
RETURNS TABLE
AS
RETURN
    SELECT [MoviesInfo].*
    FROM [MoviesInfo]
    WHERE LOWER([MoviesInfo].[title])
     LIKE LOWER(CONCAT('%', @query, '%'));
GO

SELECT *
FROM [dbo].[FindMovies]('Страшный');