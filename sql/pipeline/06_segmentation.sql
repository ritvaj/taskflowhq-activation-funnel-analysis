-- Segmentation: Activation Speed
-- Segments activated users into Fast and Slow Activators based on time-to-activation.
-- Used to identify whether activation friction is driven by hesitation or usability.

CREATE OR REPLACE TABLE
`psyched-hook-481007-m9.taskflowhq_analytics.activation_speed_segments` AS
SELECT
  f.user_pseudo_id,
  (a.activation_ts - f.feature_discovery_ts) / 1e6 AS seconds_to_activate,
  CASE
    WHEN (a.activation_ts - f.feature_discovery_ts) / 1e6 <= 727
      THEN 'Fast Activator'
    ELSE 'Slow Activator'            
  
  END AS activation_speed_segment
FROM `psyched-hook-481007-m9.taskflowhq_analytics.step3_feature_discovery_users` f
JOIN `psyched-hook-481007-m9.taskflowhq_analytics.step5_activation_users` a
  ON f.user_pseudo_id = a.user_pseudo_id
WHERE a.activation_ts > f.feature_discovery_ts;
