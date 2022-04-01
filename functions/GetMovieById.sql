CREATE FUNCTION [GetMovieById] (
    @movie_id INT
)
RETURNS TABLE
AS
RETURN
    SELECT TOP (1) [MoviesInfo].*
    FROM [MoviesInfo]
    WHERE [MoviesInfo].[id] = @movie_id
GO

SELECT *
FROM [dbo].[GetMovieById](1);