{{ config(materialized='view') }}

SELECT 
    order_id,
    product_name,
    amount,
    country,
    order_date,
    {{ dynamic_partition('order_date', 'MONTH') }}
FROM `sales-analytics-515704.sales_dataset.raw_sales`