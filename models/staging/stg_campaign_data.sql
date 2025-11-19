SELECT
    campaign_id,
    campaign_name,
    campaign_description,
    campaign_description_person,
    campaign_discount,
FROM (
    SELECT
        campaign_id,
        campaign_name,
        regexp_replace(campaign_description, '\s*-\s*.*$', '') AS campaign_description,
        regexp_replace(campaign_description, '^.*-\s*', '') AS campaign_description_person,
        (REGEXP_REPLACE(discount, '[^0-9\.]', '', 'g')::FLOAT / 100) AS campaign_discount
    FROM {{ ref('clean_campaign_data') }}
