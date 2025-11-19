SELECT
    order_id,
    merchant_id,
    staff_id
FROM
    {{ ref('clean_order_with_merchant_data') }}
