SELECT DISTINCT
    stg_user_data.user_id,
    stg_user_data.user_name AS user_name,
    MAX(stg_user_data.user_creation_datetime) AS user_creation_datetime,  -- Use aggregation for non-distinct columns
    MAX(stg_user_data.user_street) AS user_street,
    MAX(stg_user_data.user_state) AS user_state,
    MAX(stg_user_data.user_city) AS user_city,
    MAX(stg_user_data.user_country) AS user_country,
    MAX(stg_user_data.user_birth_datetime) AS user_birth_datetime,
    MAX(stg_user_data.user_gender) AS user_gender,
    MAX(stg_user_data.user_device_address) AS user_device_address,
    MAX(stg_user_data.user_type) AS user_type,
    MAX(stg_user_credit_card.name) AS credit_card_holder_name,  -- Use aggregation here as well
    MAX(stg_user_credit_card.credit_card_number) AS credit_card_number,
    MAX(stg_user_credit_card.issuing_bank) AS issuing_bank,
    MAX(stg_user_job.user_job) AS user_job,
    MAX(stg_user_job.user_job_level) AS user_job_level
FROM 
    stg_user_data
JOIN 
    stg_user_credit_card ON stg_user_data.user_id = stg_user_credit_card.user_id
JOIN 
    stg_user_job ON stg_user_data.user_id = stg_user_job.user_id
WHERE 
    stg_user_data.user_id IS NOT NULL
    AND stg_user_data.user_name IS NOT NULL
GROUP BY 
    stg_user_data.user_id, 
    stg_user_data.user_name;  -- Grouping by distinct columns
