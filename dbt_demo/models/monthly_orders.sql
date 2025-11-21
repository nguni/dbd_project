{{ config(
    materialized='table'
) }}

{% set statuses = ['completed', 'shipped', 'placed', 'returned', 'return_pending'] %}

WITH transformed_orders AS (
    SELECT
        order_id,
        DATE_TRUNC('month', order_date) AS order_month,
        status
    FROM {{ ref('stg_order') }}
),

final AS (
    SELECT
        order_month,
        {% for status in statuses %}
            COUNT(CASE WHEN status = '{{ status }}' THEN 1 END) AS {{ status }}_orders{% if not loop.last %},{% endif %}
        {%- endfor %}
    FROM transformed_orders
    GROUP BY order_month
    ORDER BY order_month
)
SELECT * FROM final