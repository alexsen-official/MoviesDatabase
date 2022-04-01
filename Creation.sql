USE [master]
GO

IF NOT EXISTS (
	SELECT * 
	FROM sys.databases
	WHERE name = 'Movies'
)
BEGIN
	CREATE DATABASE [Movies]
END
GO

USE [Movies]
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'Categories'
)
BEGIN
    CREATE TABLE [Categories] (
        [id] int PRIMARY KEY IDENTITY(1, 1),
        [name] nvarchar(255) UNIQUE NOT NULL
    )
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'Genres'
)
BEGIN
	CREATE TABLE [Genres] (
		[id] int PRIMARY KEY IDENTITY(1, 1),
		[name] nvarchar(255) UNIQUE NOT NULL
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'Countries'
)
BEGIN
	CREATE TABLE [Countries] (
		[id] int PRIMARY KEY IDENTITY(1, 1),
		[name] nvarchar(255) UNIQUE NOT NULL
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'Directors'
)
BEGIN
	CREATE TABLE [Directors] (
		[id] int PRIMARY KEY IDENTITY(1, 1),
		[name] nvarchar(255) UNIQUE NOT NULL
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'Actors'
)
BEGIN
	CREATE TABLE [Actors] (
		[id] int PRIMARY KEY IDENTITY(1, 1),
		[name] nvarchar(255) UNIQUE NOT NULL
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'Movies'
)
BEGIN
	CREATE TABLE [Movies] (
		[id] int PRIMARY KEY IDENTITY(1, 1),
		[category_id] int FOREIGN KEY REFERENCES [Categories]([id]) ON DELETE CASCADE,
		[title] nvarchar(255) NOT NULL,
		[rating] float CHECK([rating] >= 0.0 AND [rating] <= 10.0),
		[tagline] nvarchar(1020),
		[date] date CHECK(YEAR([date]) >= 1895),
		[age] int CHECK([age] >= 0 AND [age] <= 21),
		[duration] int CHECK([duration] > 0)
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'MoviesGenres'
)
BEGIN
	CREATE TABLE [MoviesGenres] (
		[movie_id] int FOREIGN KEY REFERENCES [Movies]([id]) ON DELETE CASCADE,
		[genre_id] int FOREIGN KEY REFERENCES [Genres]([id]) ON DELETE CASCADE
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'MoviesCountries'
)
BEGIN
	CREATE TABLE [MoviesCountries] (
		[movie_id] int FOREIGN KEY REFERENCES [Movies]([id]) ON DELETE CASCADE,
		[country_id] int FOREIGN KEY REFERENCES [Countries]([id]) ON DELETE CASCADE
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'MoviesDirectors'
)
BEGIN
	CREATE TABLE [MoviesDirectors] (
		[movie_id] int FOREIGN KEY REFERENCES [Movies]([id]) ON DELETE CASCADE,
		[director_id] int FOREIGN KEY REFERENCES [Directors]([id]) ON DELETE CASCADE
	)
END
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE [name] = 'MoviesActors'
)
BEGIN
	CREATE TABLE [MoviesActors] (
		[movie_id] int FOREIGN KEY REFERENCES [Movies]([id]) ON DELETE CASCADE,
		[actor_id] int FOREIGN KEY REFERENCES [Actors]([id]) ON DELETE CASCADE
	)
END
GO