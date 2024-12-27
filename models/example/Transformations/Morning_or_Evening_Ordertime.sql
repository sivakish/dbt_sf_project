{{ config(materialized='table') }}

SELECT
    order_id,
    order_date, -- Already split as date in the previous model
    order_time, -- Already split as time in AM/PM format in the previous model
    CASE
        WHEN POSITION('AM' IN order_time) > 0 THEN 'Morning'
        ELSE 'Evening'
    END AS order_period, -- Adding the new column for Morning or Evening
    sku,
    color,
    size,
    unit_price,
    quantity,
    revenue
FROM {{ ref('splitting_date_and_time') }} -- Referencing the previous model
