-- Time from Onboarding to Feature Discovery (per user) --> Without CTE version
SELECT
  APPROX_QUANTILES(
    (f.feature_discovery_ts - o.onboarding_ts) / 1e6,
    100
  )[OFFSET(50)] AS median_seconds_onboarding_to_feature
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step2_onboarding_users` o
JOIN `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` f
  ON o.user_pseudo_id = f.user_pseudo_id
WHERE f.feature_discovery_ts > o.onboarding_ts;


-- Time from Feature Discovery to Activation --> With CTE version
WITH feature_discovery AS (
  SELECT
    user_pseudo_id,
    MIN(feature_discovery_ts) AS feature_ts
  FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users`
  GROUP BY user_pseudo_id
),

activation AS (
  SELECT
    user_pseudo_id,
    MIN(activation_ts) AS min_activation_ts
  FROM `psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users`
  GROUP BY user_pseudo_id
)

SELECT
  APPROX_QUANTILES(
    (min_activation_ts - feature_ts) / 1e6,
    100
  )[OFFSET(50)] AS median_seconds_feature_to_activation
FROM feature_discovery f
JOIN activation a
  ON f.user_pseudo_id = a.user_pseudo_id
WHERE min_activation_ts > feature_ts;
