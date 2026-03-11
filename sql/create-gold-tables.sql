-- This query will be used to create the dimension tables (gold)

CREATE TABLE dim_customer (
    CustomerKey INT NOT NULL,
    CustomerID VARCHAR(50),
    Country VARCHAR(100)
); 

CREATE TABLE dim_product (
    ProductKey INT NOT NULL,
    StockCode VARCHAR(50),
    Description VARCHAR(255)
);

CREATE TABLE dim_date (
    DateKey INT NOT NULL,
    FullDate DATE,
    Year INT,
    Quarter INT,
    Month INT,
    MonthName VARCHAR(20),
    WeekOfYear INT,
    Day INT
);

CREATE TABLE fact_sales (
    SalesKey INT NOT NULL,
    InvoiceNo VARCHAR(50),
    CustomerKey INT,
    ProductKey INT,
    DateKey INT,
    Quantity INT,
    UnitPrice FLOAT,
    SalesAmount FLOAT
);
