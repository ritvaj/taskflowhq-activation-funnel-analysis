-- Step 5: Activation — first successful completion of core action
  
-- Due to sparsity and instrumentation gaps in the GA4 public dataset, some users reached activation without recorded intermediate core-action events.

CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users` AS
SELECT
  s.user_pseudo_id,
  MIN(e.event_timestamp) AS activation_ts
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` s
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101` e
  ON s.user_pseudo_id = e.user_pseudo_id
WHERE e.event_name = 'purchase'
  AND e.event_timestamp > s.feature_discovery_ts
GROUP BY s.user_pseudo_id;
