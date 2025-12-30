-- Compute variant-level median time from feature discovery to activation
-- for the post-discovery value reinforcement A/B analysis.
-- Includes only activated users; GA4 timestamps converted to minutes.
-- Variant assignment uses a deterministic hash-based split.

SELECT
  CASE
    WHEN MOD(ABS(FARM_FINGERPRINT(f.user_pseudo_id)), 2) = 0 THEN 'Variant A'
    ELSE 'Variant B'
  END AS variant,
  APPROX_QUANTILES(
    (a.activation_ts - f.feature_discovery_ts) / (1e6 * 60),
    100
  )[OFFSET(50)] AS median_minutes
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` f
JOIN `psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users` a
  ON f.user_pseudo_id = a.user_pseudo_id
GROUP BY variant
