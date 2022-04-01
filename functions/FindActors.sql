CREATE FUNCTION [FindActors] (
    @query NVARCHAR(255)
)
RETURNS TABLE
AS
RETURN
    SELECT [ActorsInfo].*
    FROM [ActorsInfo]
    WHERE LOWER([ActorsInfo].[name])
     LIKE LOWER(CONCAT('%', @query, '%'));
GO

SELECT *
FROM [dbo].[FindActors]('Евгений');