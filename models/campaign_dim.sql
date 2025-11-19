WITH unique_campaigns AS (
    SELECT campaign_id
    FROM {{ ref('stg_campaign_data') }}
    GROUP BY campaign_id
    HAVING COUNT(*) = 1
)
SELECT *
FROM {{ ref('stg_campaign_data') }}
WHERE campaign_id IN (SELECT campaign_id FROM unique_campaigns)
