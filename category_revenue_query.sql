WITH OrderDetails AS (
    SELECT 
        o.order_date, 
        p.product_category, 
        SUM(o.quantity * o.unit_price) as total_revenue 
    FROM orders o 
    JOIN products p ON o.product_id = p.product_id AND o.order_date >= p.start_date AND o.order_date <= p.end_date 
    WHERE o.quantity > 0 AND o.unit_price > 0 AND p.product_category <> '' 
    GROUP BY order_date, product_category 
),
MonthlyRevenue AS (
    SELECT 
        MONTH(order_date) as month, 
        YEAR(order_date) as year, 
        product_category, 
        SUM(total_revenue) as monthly_revenue 
    FROM OrderDetails 
    GROUP BY month, year, product_category 
),
CategoryRevenue AS (
    SELECT 
        year, 
        product_category, 
        MONTH(MIN(order_date)) as start_month, 
        MONTH(MAX(order_date)) as end_month, 
        SUM(monthly_revenue) as total_revenue 
    FROM MonthlyRevenue 
    GROUP BY year, product_category 
),
SortedCategoryRevenue AS (
    SELECT 
        *, 
        AVG(total_revenue / MONTHS_BETWEEN(MAX(order_date), MIN(order_date)) + 1) as avg_monthly_revenue 
    FROM CategoryRevenue 
    ORDER BY avg_monthly_revenue DESC 
)
SELECT * FROM SortedCategoryRevenue;
