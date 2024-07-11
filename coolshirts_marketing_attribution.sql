/*
identifying unique campaigns and sources used by CoolShirts, and which source is used for each campaign
*/

SELECT COUNT(DISTINCT utm_campaign) as distinct_utm_campaigns
FROM page_visits;

SELECT COUNT(DISTINCT utm_source) as distinct_utm_sources
FROM page_visits;

SELECT DISTINCT utm_campaign, utm_source
FROM page_visits;


/*
calculating how many first-touches is each campaign responsible for
*/

WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) AS first_touch_at
    FROM page_visits
    GROUP BY user_id),
ft_attr AS (
  SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
pv.utm_campaign
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp)
SELECT ft_attr.utm_source,
  ft_attr.utm_campaign,
  COUNT(*) AS first_touch_count
FROM ft_attr
GROUP BY 1, 2
ORDER BY 3 DESC;


/*
calculating how many last-touches is each campaign responsible for
*/

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) AS last_touch_at
    FROM page_visits
    GROUP BY user_id),
lt_attr AS (
  SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
pv.utm_campaign
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp)
SELECT lt_attr.utm_source,
  lt_attr.utm_campaign,
  COUNT(*) AS last_touch_count
FROM lt_attr
GROUP BY 1, 2
ORDER BY 3 DESC;


/*
calculating how many visitors make a purchase?
*/

SELECT COUNT(DISTINCT user_id)
FROM page_visits
where page_name = '4 - purchase';


/*
calculating how many last-touches on the purchase page each campaign is responsible for
*/

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) AS last_touch_at
    FROM page_visits
    WHERE page_name = '4 - purchase'
    GROUP BY user_id),
lt_attr AS (
  SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
pv.utm_campaign
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp)
SELECT lt_attr.utm_source,
  lt_attr.utm_campaign,
  COUNT(*) AS last_touch_count
FROM lt_attr
GROUP BY 1, 2
ORDER BY 3 DESC;
