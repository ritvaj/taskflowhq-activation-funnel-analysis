We defined the funnel entry as unique users who triggered a session_start event, anchored to their first session timestamp per day.

-- Step 1: App Open (user-level)
  
CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.step1_app_open` AS
SELECT
  user_pseudo_id,
  MIN(event_timestamp) AS session_start_ts
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`
WHERE event_name = 'session_start'
GROUP BY user_pseudo_id;
