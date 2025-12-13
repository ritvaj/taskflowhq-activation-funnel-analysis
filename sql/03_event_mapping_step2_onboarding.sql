-- Step 2: Onboarding Screen Viewed
SELECT
  user_pseudo_id,
  event_timestamp
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`,
UNNEST(event_params) AS ep
WHERE event_name = 'page_view'
  AND ep.key = 'page_title'
  AND ep.value.string_value IN (
    'Home',
    'Google Online Store',
    'The Google Merchandise Store - Log In'
  );
