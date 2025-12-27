-- Event shortlisting
SELECT DISTINCT event_name
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`;


-- User counts per candidate funnel event

-- session_start = 2339
SELECT COUNT(DISTINCT user_pseudo_id)
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
WHERE event_name = 'session_start';

-- page_view = 2302
SELECT COUNT(DISTINCT user_pseudo_id)
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
WHERE event_name = 'page_view';

-- view_item = 516
SELECT COUNT(DISTINCT user_pseudo_id)
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
WHERE event_name = 'view_item';

-- add_to_cart = 1 (discarded)
SELECT COUNT(DISTINCT user_pseudo_id)
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
WHERE event_name = 'add_to_cart';

-- purchase = 13
SELECT COUNT(DISTINCT user_pseudo_id)
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
WHERE event_name = 'purchase';


-- Funnel flow validation

-- Purchasers -> viewed item (13 / 13)
SELECT
  COUNT(DISTINCT user_pseudo_id),
  COUNT(DISTINCT IF(has_view_item, user_pseudo_id, NULL))
FROM (
  SELECT
    user_pseudo_id,
    MAX(event_name = 'purchase') AS has_purchase,
    MAX(event_name = 'view_item') AS has_view_item
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
  GROUP BY user_pseudo_id
)
WHERE has_purchase;

-- Item viewers -> page_view (515 / 516)
SELECT
  COUNT(DISTINCT user_pseudo_id),
  COUNT(DISTINCT IF(has_page_view, user_pseudo_id, NULL))
FROM (
  SELECT
    user_pseudo_id,
    MAX(event_name = 'view_item') AS has_view_item,
    MAX(event_name = 'page_view') AS has_page_view
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
  GROUP BY user_pseudo_id
)
WHERE has_view_item;
