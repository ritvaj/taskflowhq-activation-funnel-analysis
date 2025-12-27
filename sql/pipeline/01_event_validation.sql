-- ff (event shortlisting)
select distinct event_name
from `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`

-- dd
SELECT count(distinct user_pseudo_id) 
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` 
where event_name = 'session_start'

  -- fg
SELECT count(distinct user_pseudo_id) 
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` 
where event_name = 'page_view'
 
-- dfhj
SELECT count(distinct user_pseudo_id) 
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` 
where event_name = 'view_item'

-- sid discarded 
SELECT count(distinct user_pseudo_id) 
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` 
where event_name = 'add_to_cart'

-- sid
SELECT count(distinct user_pseudo_id) 
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` 
where event_name = 'purchase'
