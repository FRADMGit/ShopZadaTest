SELECT
product_id
product_name
product_type
price
FROM {{ ref(clean_product_list)  }}
