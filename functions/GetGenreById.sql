CREATE FUNCTION [GetGenreById] (
    @genre_id INT
)
RETURNS TABLE
AS
RETURN
    SELECT TOP (1) [GenresInfo].*
    FROM [GenresInfo]
    WHERE [GenresInfo].[id] = @genre_id
GO

SELECT *
FROM [dbo].[GetGenreById](1);