CREATE FUNCTION [GetDirectorById] (
    @director_id INT
)
RETURNS TABLE
AS
RETURN
    SELECT TOP (1) [DirectorsInfo].*
    FROM [DirectorsInfo]
    WHERE [DirectorsInfo].[id] = @director_id
GO

SELECT *
FROM [dbo].[GetDirectorById](1);