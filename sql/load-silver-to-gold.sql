-- This query will load data from Silver into Gold


-- Customer (allow for sales by customer and country)
INSERT INTO dim_customer (CustomerKey, CustomerID, Country)
SELECT 
    ROW_NUMBER() OVER (ORDER BY CustomerID) AS CustomerKey, 
    CustomerID,
    Country
FROM lh_retail_sales.dbo.silver_customers;


-- Product (sales by product)
INSERT INTO dim_product (ProductKey, StockCode, Description)
SELECT
    ROW_NUMBER() OVER (ORDER BY StockCode, Description) AS ProductKey,
    StockCode,
    Description
FROM lh_retail_sales.dbo.silver_products;


-- Date (sales over time)
INSERT INTO dim_date (DateKey, FullDate, Year, Quarter, Month, MonthName, WeekOfYear, Day)
SELECT
    ROW_NUMBER() OVER (ORDER BY Date) AS DateKey,
    Date AS FullDate,
    Year,
    Quarter,
    Month,
    MonthName,
    WeekOfYear,
    Day
FROM lh_retail_sales.dbo.silver_date;



-- Fact (measurable business events + connection to all dimensions)
INSERT INTO fact_sales (
    SalesKey,
    InvoiceNo,
    CustomerKey,
    ProductKey,
    DateKey,
    Quantity,
    UnitPrice,
    SalesAmount
)
SELECT
    ROW_NUMBER() OVER (ORDER BY s.InvoiceNo, s.InvoiceDate, s.StockCode) AS SalesKey,
    s.InvoiceNo,
    dc.CustomerKey,
    dp.ProductKey,
    dd.DateKey,
    s.Quantity,
    s.UnitPrice,
    s.SalesAmount
FROM lh_retail_sales.dbo.silver_sales s
LEFT JOIN dim_customer dc
    ON s.CustomerID = dc.CustomerID
LEFT JOIN dim_product dp
    ON s.StockCode = dp.StockCode
   AND s.Description = dp.Description
LEFT JOIN dim_date dd
    ON CAST(s.InvoiceDate AS DATE) = dd.FullDate;
