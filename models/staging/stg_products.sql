with counted as (
    select *,
           count(*) over (partition by product_id) as cnt
    from {{ ref('clean_product_list') }}
    where product_id is not null
      and price is not null
),

filtered as (
    select
        product_id,
        product_name,
        product_type,
        try_cast(price as numeric) as product_price
    from counted
    where cnt = 1
      and try_cast(price as numeric) is not null
)

select *
from filtered
