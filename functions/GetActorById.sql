CREATE FUNCTION [GetActorById] (
    @actor_id INT
)
RETURNS TABLE
AS
RETURN
    SELECT TOP (1) [ActorsInfo].*
    FROM [ActorsInfo]
    WHERE [ActorsInfo].[id] = @actor_id
GO

SELECT *
FROM [dbo].[GetActorById](1);