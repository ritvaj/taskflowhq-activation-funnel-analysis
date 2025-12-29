-- Retention: Onboarding Cohort (D1 / D3 / D7)
-- Measures short-term retention starting from onboarding, the first moment of informed exposure.


CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.onboarding_retention` AS
SELECT DISTINCT
  o.user_pseudo_id,
  DATE_DIFF(
    PARSE_DATE('%Y%m%d', e.event_date),
    DATE(TIMESTAMP_MICROS(o.onboarding_ts)),
    DAY
  ) AS day_offset
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users` o
JOIN `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` e
  ON o.user_pseudo_id = e.user_pseudo_id
WHERE DATE_DIFF(
    PARSE_DATE('%Y%m%d', e.event_date),
    DATE(TIMESTAMP_MICROS(o.onboarding_ts)),
    DAY
  ) IN (1, 3, 7);

--

SELECT day_offset, COUNT(DISTINCT user_pseudo_id)
FROM `psyched-hook-481007-m9.taskflowhq_analytics.onboarding_retention`
GROUP BY day_offset
ORDER BY day_offset;

-- Retention drops: Day 1 = 51
-- Day 3 = 17
-- Day 7 = 5
