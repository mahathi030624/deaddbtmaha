{{
    config 
    (
        materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key = 'PURCHASE_ID',
        merge_exclude_columns = ['INSERT_DTS']
    )
}}

with purchase AS
(
    SELECT 
    PURCHASE_ID,
    PURCHASE_DATE,
    PURCHASE_STATUS,
    CREATED_AT,
    CURRENT_TIMESTAMP as INSERT_DTS,
    CURRENT_TIMESTAMP as UPDATE_DTS
    FROM {{source('purchase','purchase_src')}}

    {% if is_incremental() %}
    where created_at > (select max(UPDATE_DTS) from {{this}}) 
    {% endif %}

)
select * from purchase