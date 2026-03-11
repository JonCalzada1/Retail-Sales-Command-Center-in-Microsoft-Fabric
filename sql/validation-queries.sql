SELECT COUNT(*) AS customer_count FROM dim_customer;

SELECT COUNT(*) AS product_count FROM dim_product;

SELECT COUNT(*) AS date_count FROM dim_date;

-- Lower than original (541,909 rows) due to removal of cancellations/returns/missing customers/bad values
SELECT COUNT(*) AS sales_count FROM fact_sales;


SELECT TOP 30 * 
FROM fact_sales;

-- Double check relationships working
SELECT TOP 20
    f.InvoiceNo,
    d.FullDate,
    c.CustomerID,
    c.Country,
    p.StockCode,
    p.Description,
    f.Quantity,
    f.UnitPrice,
    f.SalesAmount
FROM fact_sales f
LEFT JOIN dim_customer c ON f.CustomerKey = c.CustomerKey
LEFT JOIN dim_product p ON f.ProductKey = p.ProductKey
LEFT JOIN dim_date d ON f.DateKey = d.DateKey;
