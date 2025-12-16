-- Day 1 Retention
CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.day1_retention_users` AS
SELECT DISTINCT
  o.user_pseudo_id
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users` o
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` e
  ON o.user_pseudo_id = e.user_pseudo_id
WHERE
  PARSE_DATE('%Y%m%d', e.event_date)
    = DATE(TIMESTAMP_MICROS(o.onboarding_ts)) + 1;


-- Day 3 Retention
CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.day3_retention_users` AS
SELECT DISTINCT
  o.user_pseudo_id
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users` o
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` e
  ON o.user_pseudo_id = e.user_pseudo_id
WHERE
  PARSE_DATE('%Y%m%d', e.event_date)
    = DATE(TIMESTAMP_MICROS(o.onboarding_ts)) + 3;

-- Day 7 Retention
CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.day7_retention_users` AS
SELECT DISTINCT
  o.user_pseudo_id
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users` o
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` e
  ON o.user_pseudo_id = e.user_pseudo_id
WHERE
  PARSE_DATE('%Y%m%d', e.event_date)
    = DATE(TIMESTAMP_MICROS(o.onboarding_ts)) + 7;
