SELECT name, price, rating, review_count::INTEGER
FROM app_store_apps
WHERE name IN (SELECT name
		FROM app_store_apps
		INTERSECT
		SELECT name
		FROM play_store_apps)
AND rating > 4.0
ORDER BY rating DESC;
--QUERY:DETERMINE APPS ON BOTH PLATFORMS THAT ARE FREE AND HAVE HIGH STAR RATING



--PRIMARY OBJECTIVE

--STAR RATING
--FREE APPS
--AVAILABLE IN BOTH STORES
--HIGH DOWNLOAD COUNT



SELECT DISTINCT(primary_genre),AVG(rating)
FROM app_store_apps
GROUP BY primary_genre
ORDER BY avg(rating) DESC
--QUERY: DETERMINES GENRES WITH THE HIGHEST AVERAGE STAR RATING
--Top 10 Genres with highest avg star rating: Productivity, Music, Photo & Video, Business, Health & Fitness, Games, Weather, Shopping, Reference, and Travel



SELECT app_store_apps.name AS app_store_name, app_store_apps.rating AS app_store_rating, app_store_apps.price AS app_store_price,
		play_store_apps.name AS play_store_name, play_store_apps.rating AS play_store_rating, play_store_apps.price AS play_store_price,
		ROUND(app_store_apps.rating + play_store_apps.rating)/2 AS avg_rating
FROM app_store_apps
		FULL JOIN play_store_apps
		ON app_store_apps.name = play_store_apps.name
WHERE play_store_apps.name IS NOT NULL
AND app_store_apps.name IS NOT NULL
AND app_store_apps.price < 2.00
GROUP BY app_store_name, play_store_name, app_store_rating, play_store_rating, app_store_price, play_store_price
ORDER BY avg_rating DESC;

--QUERY TO DETERMINE APPS ON BOTH PLATFORMS THAT ARE LESS THAN 2 DOLLARS WITH HIGH AVG STAR RATING


