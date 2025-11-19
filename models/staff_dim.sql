WITH unique_staff AS (
    SELECT staff_id, staff_name
    FROM {{ ref('stg_staff_data') }}
    GROUP BY staff_id, staff_name
    HAVING COUNT(*) = 1
)
SELECT *
FROM {{ ref('stg_staff_data') }}
WHERE (staff_id, staff_name) IN (
    SELECT staff_id, staff_name
    FROM unique_staff
)
