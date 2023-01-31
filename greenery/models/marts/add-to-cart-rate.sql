with 
    source as (
        select * from {{ ref('stg_greenery__events') }}
    ),
    calculate as (
        select session_id, event_type
        ,case when event_type = 'add_to_cart' then 1 else 0 end as Buy
        from source
    ),
    calculate2 as (
        select session_id, max(Buy) as Buy
        from calculate
        group by session_id
    ),
    final as (
        select avg(buy)
        from calculate2
    )
select *
from final
