USE [Movies];
GO

exec sp_addlogin @loginame='User', @passwd='UserPass', @defdb='Movies';
GO

exec sp_grantdbaccess 'User';
GO

exec sp_addrole @rolename='UserRole';
GO

exec sp_addrolemember @rolename='UserRole', @membername = 'User';
GO

GRANT SELECT
ON [Actors]
TO [UserRole];
GO

GRANT SELECT
ON [Categories]
TO [UserRole];
GO

GRANT SELECT
ON [Countries]
TO [UserRole];
GO

GRANT SELECT
ON [Directors]
TO [UserRole];
GO

GRANT SELECT
ON [Genres]
TO [UserRole];
GO

GRANT SELECT
ON [Movies]
TO [UserRole];
GO

GRANT SELECT
ON [MoviesActors]
TO [UserRole];
GO

GRANT SELECT
ON [MoviesCountries]
TO [UserRole];
GO

GRANT SELECT
ON [MoviesDirectors]
TO [UserRole];
GO

GRANT SELECT
ON [MoviesGenres]
TO [UserRole];
GO

GRANT SELECT
ON [ActorsInfo]
TO [UserRole];
GO

GRANT SELECT
ON [CountriesInfo]
TO [UserRole];
GO

GRANT SELECT
ON [DirectorsInfo]
TO [UserRole];
GO

GRANT SELECT
ON [GenresInfo]
TO [UserRole];
GO

GRANT SELECT
ON [MoviesInfo]
TO [UserRole];
GO