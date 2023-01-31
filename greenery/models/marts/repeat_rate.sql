with
    orders as (
        select * from {{ ref('stg_greenery__orders') }}
    ),
    user_orders as (
        select user_id
            , count(order_id) as count_order
            , case when count(order_id) > 1 then 1 else 0 end as repete_user
        from orders
        group by 1
    ),
    final as (
        select
            avg(repete_user)
        from user_orders
    )
select * from final