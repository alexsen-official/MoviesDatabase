CREATE FUNCTION [FindDirectors] (
    @query NVARCHAR(255)
)
RETURNS TABLE
AS
RETURN
    SELECT [DirectorsInfo].*
    FROM [DirectorsInfo]
    WHERE LOWER([DirectorsInfo].[name])
     LIKE LOWER(CONCAT('%', @query, '%'));
GO

SELECT *
FROM [dbo].[FindDirectors]('Стивен');