{{
    config 
    (
        materialized = 'incremental',
        incremental_strategy = 'delete+insert',
        unique_key = 'PRODUCT_ID'
    )
}}


with product as 
(
    select 
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_PRICE,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS 
    FROM {{source('product','product_src')}}

    {% if is_incremental() %}
    where created_at > (select max(INSERT_DTS) from {{this}})
    {% endif %}
)

select * from product