{{ config(materialized='table') }}
SELECT
    order_id,
    CAST(order_date AS DATE) AS order_date,  -- Extracting the date part
TO_CHAR(CAST(order_date AS TIMESTAMP), 'hh:mi AM') AS order_time, -- Extracting the time part in AM/PM format
    sku,
    color,
    size,
    unit_price,
    quantity,
    revenue
FROM {{ ref('replace_size_blank') }} -- Referencing the previous transformation