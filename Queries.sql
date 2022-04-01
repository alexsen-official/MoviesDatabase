-- 1) Показать фильмы, рейтинг которых находится в диапазоне от 6 до 9.
-- 2) Показать сериалы, первая буква названия которых лежит в диапазоне от 'В' до 'О'.
-- 3)	Показать фильмы и сериалы, жанр которых не 'Триллеры' и не 'Ужасы'.
-- 4)	Показать мультфильмы, название которых содержит не менее трех букв 'а'.
-- 5)	Показать аниме, рейтинг которых ниже 3.5.
-- 6)	Показать название фильмов, режиссер которых не Стивен Спилберг и продолжительность >= 40.
-- 7)	Показать аниме, название которых содержит более четырех слов.
-- 8)	Показать аниме, в названиях которых есть слово 'легенда'.
-- 9)	Показать фильмы, в которых снимался Бенедикт Камбербэтч.
-- 10) Показать актеров, имя которых на русском языке.
-- 11) Показать название и рейтинг мультфильмов, в названии которых первая буква либо 'М', либо 'Р'.
-- 12) Показать сериалы, в названии которых присутствует ровно две цифры.
-- 13) Показать все американские сериалы.
-- 14) Показать название и продолжительность фильмов, о дате релиза которых ничего не известно.
-- 15) Показать аниме в жанре 'Драмы'.
-- 16) Добавить три фильма, которых нет в базе данных. 
-- 17) Показать отечественные мультфильмы.
-- 18) Увеличить рейтинг сериалов, которые вышли после 2018 года на 0.2.
-- 19) Удалить записи, рейтинг которых равен 0.
-- 20) Установить текущую дату как дату релиза, для записей у которых она отсутствует.
-- 21) Показать мультфильмы, со дня издания которых прошло не более 5 лет.
-- 22) Показать фильмы, которые были выпущены в 2001 году.
-- 23) Увеличить дату релиза каждой записи на 2 года.
-- 24) Показать количество дней, прошедших с даты релиза фильма 'Аватар'.




-- 1) Показать фильмы, рейтинг которых находится в диапазоне от 6 до 9.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Фильмы'
  AND [Movies].[rating] BETWEEN 6 AND 9;

-- 2) Показать сериалы, первая буква названия которых лежит в диапазоне от 'В' до 'О' (без учета регистра).

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Сериалы'
  AND UPPER([Movies].[title]) BETWEEN 'В%' AND 'О%';

-- 3)	Показать фильмы и сериалы, жанр которых не 'Триллеры' и не 'Ужасы'.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] NOT IN('Триллеры', 'Ужасы');

-- 4)	Показать мультфильмы, название которых содержит не менее трех букв 'а' (без учета регистра).

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Мультфильмы'
  AND LOWER([Movies].[title]) LIKE '%а%а%а%';

-- 5)	Показать аниме, рейтинг которых ниже 3.5.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Аниме'
  AND [Movies].[rating] < 3.5;

-- 6)	Показать название фильмов, режиссер которых не Стивен Спилберг и продолжительность >= 40.

SELECT [Movies].[title]
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

JOIN [MoviesDirectors]
  ON [Movies].[id] = [MoviesDirectors].[movie_id]

JOIN [Directors]
  ON [MoviesDirectors].[movie_id] = [Directors].[id]

WHERE [Categories].[name] = 'Фильмы'
  AND [Movies].[duration] >= 40
  AND NOT [Directors].[name] = 'Стивен Спилберг';

-- 7)	Показать аниме, название которых содержит более четырех слов.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Аниме'
  AND [Movies].[title] LIKE '% % % % %';

-- 8)	Показать аниме, в названиях которых есть слово 'легенда'.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Аниме'
  AND LOWER([Movies].[title]) LIKE '%легенда%';

-- 9)	Показать фильмы, в которых снимался Бенедикт Камбербэтч.

SELECT DISTINCT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

JOIN [MoviesActors]
  ON [Movies].[id] = [MoviesActors].[movie_id]

JOIN [Actors]
  ON [MoviesActors].[movie_id] = [Actors].[id]

WHERE [Categories].[name] = 'Фильмы'
  AND [Actors].[name] = 'Бенедикт Камбербэтч';

-- 10) Показать актеров, имя которых на русском языке.

SELECT [Actors].*
FROM [Actors]
WHERE [Actors].[name] LIKE '%[А-Я]%';

-- 11) Показать название и рейтинг мультфильмов, в названии которых первая буква либо 'М', либо 'Р' (без учета регистра).

SELECT [Movies].[title],
       [Movies].[rating]

FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Мультфильмы'
  AND UPPER([Movies].[title]) LIKE 'М%'
   OR UPPER([Movies].[title]) LIKE 'Р%';

-- 12) Показать сериалы, в названии которых присутствует ровно две цифры.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Сериалы'
  AND [Movies].[title] LIKE '%[0-9]%[0-9]'
  AND [Movies].[title] NOT LIKE '%[0-9]%[0-9]%[0-9]%';

-- 13) Показать все американские сериалы.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

JOIN [MoviesCountries]
  ON [Movies].[id] = [MoviesCountries].[movie_id]

JOIN [Countries]
  ON [MoviesCountries].[country_id] = [Countries].[id]

WHERE [Categories].[name] = 'Сериалы'
  AND [Countries].[name] = 'США';

-- 14) Показать название и продолжительность фильмов, о дате релиза которых ничего не известно.

SELECT [Movies].[title],
       [Movies].[duration]

FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Фильмы'
  AND [Movies].[date] IS NULL;

-- 15) Показать аниме в жанре 'Драмы'.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

JOIN [MoviesGenres]
  ON [MoviesGenres].[movie_id] = [Movies].[id]

JOIN [Genres]
  ON [MoviesGenres].[genre_id] = [Genres].[id]

WHERE [Categories].[name] = 'Аниме'
  AND [Genres].[name] = 'Драмы';

-- 16) Добавить три фильма, которых нет в базе данных. 

INSERT INTO [Movies] 
([category_id], [title], [rating], [tagline], [date], [age], [duration])
VALUES
(1, 'Аллея кошмаров', 7.8, 'Человек или чудовище?', '2021-12-03', 18, 150),
(1, 'Столкновение', 6.3, NULL, '2021-09-03', NULL, 108),
(1, 'Последняя дуэль', 7.5, NULL, '2021-09-10', 16, 152);

-- 17) Показать отечественные мультфильмы.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

JOIN [MoviesCountries]
  ON [Movies].[id] = [MoviesCountries].[movie_id]

JOIN [Countries]
  ON [MoviesCountries].[country_id] = [Countries].[id]

WHERE [Categories].[name] = 'Мультфильмы'
  AND [Countries].[name] = 'Украина';

-- 18) Увеличить рейтинг сериалов, которые вышли после 2018 года на 0.2.

UPDATE [Movies]
SET [Movies].[rating] += 0.2
WHERE YEAR([Movies].[date]) > 2018;

-- 19) Удалить записи, рейтинг которых равен 0.

DELETE FROM [Movies]
WHERE [Movies].[rating] = 0;

-- 20) Установить текущую дату как дату релиза, для записей у которых она отсутствует.

UPDATE [Movies] 
SET [Movies].[date] = GETDATE()
WHERE [Movies].[date] IS NULL;

-- 21) Показать мультфильмы, со дня издания которых прошло не более 5 лет.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Мультфильмы'
  AND DATEDIFF(year, [Movies].[date], GETDATE()) <= 5;

-- 22) Показать фильмы, которые были выпущены в 2001 году.

SELECT [Movies].*
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Фильмы'
  AND YEAR([Movies].[date]) = 2001;

-- 23) Увеличить дату релиза каждой записи на 2 года.

UPDATE [Movies]
SET [Movies].[date] = DATEADD(YEAR, 2, [Movies].[date]);

-- 24) Показать количество дней, прошедших с даты релиза фильма 'Аватар'.

SELECT DATEDIFF(DAY, [Movies].[date], GETDATE())
FROM [Movies]

JOIN [Categories]
  ON [Movies].[category_id] = [Categories].[id]

WHERE [Categories].[name] = 'Фильмы'
  AND [Movies].[title] = 'Аватар';
