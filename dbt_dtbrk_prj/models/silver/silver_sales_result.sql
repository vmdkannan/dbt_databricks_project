WITH sales AS (
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ calc('unit_price', 'quantity') }} as calculated_amount,
        gross_amount,
        payment_method
    FROM {{ ref('bronze_sales') }}
),

products AS (
    SELECT
        product_sk,
        category
    FROM {{ ref('bronze_product') }}
),

customer AS (
    SELECT
        customer_sk,
        gender
    FROM {{ ref('bronze_customer') }}
),

joined_query as (

    SELECT
        sales.sales_id,
        sales.gross_amount,
        sales.payment_method,
        products.category,
        customer.gender
    FROM sales
    JOIN products
        ON sales.product_sk = products.product_sk
    JOIN customer
        ON sales.customer_sk = customer.customer_sk
)

SELECT category, gender, sum(gross_amount) as total_sales 
FROM joined_query group by category, gender 
order by total_sales desc