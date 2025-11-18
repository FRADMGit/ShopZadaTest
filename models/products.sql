with ranked_products as (
    select *,
           rank() over (partition by product_type order by product_price desc) as price_rank
    from {{ ref('stg_products') }}
)

select *
from ranked_products
