# Retail Sales Command Center in Microsoft Fabric

## Overview

This project is an end-to-end retail analytics solution built in Microsoft Fabric using a Lakehouse, Notebook, Warehouse, semantic model, and Power BI report. The goal was to take raw transaction data, clean and transform it through a medallion architecture, model it into a star schema, and deliver interactive dashboards for executive, customer, and product analysis.

The project uses the UCI Online Retail dataset, a real-world transactional dataset containing over 541,000 retail records from a UK-based online retailer. The final solution provides visibility into sales trends, customer behavior, geography, and product performance.

## Business Problem

Retail businesses need a centralized analytics platform to track sales performance, customer activity, and product demand. Raw transaction data is often not structured for direct reporting, so analysts must transform it into a reliable, business-ready model.

This project was designed to answer questions such as:

- How are sales trending over time?

- Which countries and customers generate the most revenue?

- Which products are top sellers by revenue and units sold?

- How can raw retail transaction data be structured for scalable analytics in Microsoft Fabric?

Dataset

**Source:** UCI Online Retail dataset

The dataset contains transactional retail data with the following fields:

- InvoiceNo

- StockCode

- Description

- Quantity

- InvoiceDate

- UnitPrice

- CustomerID

- Country

## Notes on the dataset

- Includes over 541,909 raw rows

- Covers transactions across 2010–2011

- Contains cancellations, returns, missing customer IDs, and invalid values that required cleaning

- Does not include profit, so the project focuses on sales, customer behavior, product demand, and geography

## Tools Used

**Microsoft Fabric**

- Lakehouse

- Notebook (PySpark)

- Warehouse

- Power BI semantic model

- Power BI report

**PySpark**

**SQL**

**DAX**
