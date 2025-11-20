SELECT DISTINCT
  order_id,
  "delay in days" AS order_delay
FROM {{ ref('clean_order_delay') }}
WHERE order_delay IS NOT NULL
  AND order_id IS NOT NULL
