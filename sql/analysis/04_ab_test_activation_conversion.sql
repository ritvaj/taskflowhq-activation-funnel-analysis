-- A/B Simulation: Post-Discovery Activation
-- Users are deterministically split into Variant A and B after feature discovery
-- using a hash-based odd/even assignment on user_pseudo_id.

SELECT
  CASE
    WHEN MOD(ABS(FARM_FINGERPRINT(f.user_pseudo_id)), 2) = 0 THEN 'Variant A'
    ELSE 'Variant B'
  END AS variant,

  COUNT(DISTINCT f.user_pseudo_id) AS exposed_users,
  COUNT(DISTINCT a.user_pseudo_id) AS activated_users,

  ROUND(
    COUNT(DISTINCT a.user_pseudo_id)
    / COUNT(DISTINCT f.user_pseudo_id),
    4
  ) AS activation_conversion_rate

FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` f
LEFT JOIN `psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users` a
  ON f.user_pseudo_id = a.user_pseudo_id

GROUP BY variant
ORDER BY variant;
