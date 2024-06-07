# Product-Category-Revenue-Analysis


SQL Query: Product Category Revenue Analysis with Data Validation

This SQL query provides a detailed revenue analysis for product categories, considering their active periods and potential data quality issues. The output is sorted by the average monthly revenue, allowing you to identify top-performing categories easily.

# Functionality
Data Validation and Cleaning:

Product Availability: The query ensures that revenue is calculated only for orders placed within a product's valid active period (between its start_date and end_date).

Data Integrity: It filters out records with invalid quantities, prices, or missing product categories, safeguarding against incorrect calculations.

Revenue Calculation:

Total Revenue per Order and Category: The query sums the revenue for each order (quantity * unit_price) per product category.

Monthly Revenue: It aggregates the total revenue on a monthly basis for each product category and year.

Category Revenue within Active Period: It determines the total revenue for each product category within its active months.

Average Monthly Revenue:

Calculation: It calculates the average monthly revenue for each product category by dividing the total revenue by the number of active months.

Sorting: The results are sorted in descending order based on the average monthly revenue, making it easy to identify top-performing categories.

# Usage
Prerequisites:

Ensure you have a database with the following tables:

orders: Containing order_date, product_id, quantity, and unit_price columns.

products: Containing product_id, product_category, start_date, and end_date columns.

# Execution:

Execute the query directly in your SQL environment (e.g., SQL Server Management Studio, MySQL Workbench).

# Output:

The query returns the following columns:

year: The year of revenue calculation.

product_category: The name of the product category.

start_month: The month when the category's revenue period starts.

end_month: The month when the category's revenue period ends.

total_revenue: The total revenue generated by the category within its active period.

avg_monthly_revenue: The average monthly revenue for the category during its active period.

# Key Improvements

Data Validation: Robust filtering ensures accurate calculations by excluding invalid or irrelevant data.

Error Handling: Implicitly handles division-by-zero errors that could occur when the active period is zero months.

# Considerations

Database Engine: The MONTHS_BETWEEN function is specific to some database systems (e.g., Oracle, PostgreSQL). If you're using a different database, you might need to adjust the calculation of active months.

Performance: While CTEs improve readability, for very large datasets, you might consider alternative approaches (e.g., window functions) for potential performance optimization.
