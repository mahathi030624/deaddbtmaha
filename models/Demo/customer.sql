{{ 
    config 
    (
        materialized = 'table'
    )
}}

with customer_src as 
(
    select 
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    country,
    created_at,
    current_timestamp as insert_dts
    from {{source('customer','customer_src')}}
)
SELECT * FROM customer_src