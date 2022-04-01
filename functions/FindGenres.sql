CREATE FUNCTION [FindGenres] (
    @query NVARCHAR(255)
)
RETURNS TABLE
AS
RETURN
    SELECT [GenresInfo].*
    FROM [GenresInfo]
    WHERE LOWER([GenresInfo].[name])
     LIKE LOWER(CONCAT('%', @query, '%'));
GO

SELECT *
FROM [dbo].[FindGenres]('Юмор');