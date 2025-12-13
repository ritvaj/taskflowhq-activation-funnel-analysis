We defined the funnel entry as unique users who triggered a session_start event, anchored to their first session timestamp per day.

SELECT
  user_pseudo_id,
  MIN(event_timestamp) AS session_start_ts
FROM events_20201101
WHERE event_name = 'session_start'
GROUP BY user_pseudo_id;
