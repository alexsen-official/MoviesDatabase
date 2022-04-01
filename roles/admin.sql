USE [Movies];
GO

exec sp_addlogin @loginame='Admin', @passwd='AdminPass', @defdb='Movies';
GO

exec sp_grantdbaccess 'Admin';
GO

exec sp_addrole @rolename='AdminRole';
GO

exec sp_addrolemember @rolename='AdminRole', @membername = 'Admin';
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [Actors]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [Categories]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [Countries]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [Directors]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [Genres]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [Movies]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [MoviesActors]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [MoviesCountries]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [MoviesDirectors]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [MoviesGenres]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [ActorsInfo]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [CountriesInfo]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [DirectorsInfo]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [GenresInfo]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [MoviesInfo]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [FindActors]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [FindCountries]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [FindDirectors]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [FindGenres]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [FindMovies]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [GetActorById]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [GetCountryById]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [GetDirectorById]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [GetGenreById]
TO [AdminRole];
GO

GRANT SELECT, INSERT, UPDATE, DELETE
ON [GetMovieById]
TO [AdminRole];
GO