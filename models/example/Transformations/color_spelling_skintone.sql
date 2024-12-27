{{ config(materialized='table') }}

SELECT
    order_id,
    order_date,
    order_time,
    sku,
    -- Replace 'Skintone' with 'Skin tone' in the color column
    REPLACE(color, 'Skintone', 'Skin tone') AS color,
    size,
    unit_price,
    quantity,
    revenue,
    order_period
FROM {{ ref('Morning_or_Evening_Ordertime') }}
