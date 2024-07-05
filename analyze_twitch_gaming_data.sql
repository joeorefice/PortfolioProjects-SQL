/*
What are the unique games in the stream table?
*/
SELECT DISTINCT game
FROM stream;

/*
What are the unique channels in the stream table?
*/
SELECT DISTINCT channel
FROM stream;

/*
What are the most popular games in the stream table?
*/
SELECT game,
  COUNT(*)
FROM
  stream
GROUP BY game
ORDER BY COUNT(*) DESC;

/*
In which countries are stream viewers of LoL located?
*/
SELECT country,
  COUNT(*)
FROM
  stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC;

/*
Creating list of players and their number of streamers
*/
SELECT DISTINCT player,
  COUNT(*)
FROM
  stream
GROUP BY 1
ORDER BY 2 DESC;

/*
Creating new column 'genre' for available games and displaying count of players
*/
SELECT game,
  CASE
    WHEN game = 'League of Legends'
      THEN 'MOBA'
    WHEN game = 'Dota 2'
      THEN 'MOBA'
    WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM
  stream
GROUP BY 1
ORDER BY 3 DESC;

/*
Creating new columns 'hours' from time, and view count for each hour, filtered by users in GB
*/
SELECT strftime('%H', time),
  COUNT(*)
FROM
  stream
WHERE country = 'GB'
GROUP BY 1
ORDER BY 2;

/*
Joining stream and chat table
*/
SELECT *
FROM stream s
JOIN chat c
  ON c.device_id = s.device_id
LIMIT 10;
