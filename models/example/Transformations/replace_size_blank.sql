{{ config(materialized='table') }}
SELECT
    order_id,
    order_date,  -- Already transformed in previous model
    sku,
    color,
    CASE
        WHEN size IS NULL OR TRIM(size) = '' THEN 'XL'  -- Replace blanks or NULLs with 'XL'
        ELSE size
    END AS size,
    unit_price,
    quantity,
    revenue
FROM {{ ref('transform_order_date') }} -- Referencing the previous transformation
