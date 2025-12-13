Out of 603 onboarded users, 201 users proceeded to explore at least one feature.

-- Step 3: Feature Discovery (user-level)
  
CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` AS
SELECT
  s.user_pseudo_id,
  MIN(e.event_timestamp) AS feature_discovery_ts
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users` s
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` e
  ON s.user_pseudo_id = e.user_pseudo_id
WHERE e.event_name = 'view_item'
  AND e.event_timestamp > s.onboarding_ts
GROUP BY s.user_pseudo_id;
