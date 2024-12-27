-- models/transform_order_date.sql
{{ config(materialized='table') }}
SELECT
    order_id,
    CAST(TO_TIMESTAMP(order_date, 'DD-MM-YYYY HH24:MI') AS TIMESTAMP) AS order_date,  -- Casting the VARCHAR to TIMESTAMP
    sku,
    color,
    size,
    unit_price,
    quantity,
    revenue
FROM {{ source('Ecommerce_Sales', 'SALES') }}  -- Use the correct source for your table
