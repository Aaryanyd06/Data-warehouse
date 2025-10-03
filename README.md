# Sales Data Warehouse & Analytics Pipeline

This project implements a complete ETL/ELT (Extract, Transform, Load) pipeline to build a sales data warehouse. It follows the Medallion architecture (Bronze, Silver, Gold) to progressively refine raw data into a clean, structured, and business-ready format suitable for analytics and reporting.

## Project Overview

The primary goal of this project is to consolidate sales-related data from different source systems (CRM and ERP) into a single source of truth. The pipeline processes raw data, performs extensive cleaning and standardization, and models the data into a star schema for efficient querying and analysis.

## Architecture: The Medallion Model

The project is structured into three distinct data layers within the data warehouse:

* **Bronze Layer**: This layer serves as the initial landing zone for raw data extracted from source systems. The data is kept in its original, unaltered format.
* **Silver Layer**: Data from the Bronze layer is cleaned, conformed, and standardized in this layer. This involves handling duplicates, correcting data types, standardizing values, and joining tables to create a consolidated view.
* **Gold Layer**: The final layer, where the refined data from the Silver layer is modeled into a star schema consisting of fact and dimension tables. This layer is optimized for business intelligence, reporting, and advanced analytics.

## Technologies Used

* **Database**: SQL Server (using T-SQL syntax)

## How to Run the Project

To set up and run the entire pipeline, execute the SQL scripts in the following order.

**Important**: Before starting, you must update the file paths in `Loading_data_bronze.sql` to point to the location of your raw CSV data files.

1.  **Schema Creation**:
    * `creating_schema.sql`: Creates the `bronze`, `silver`, and `gold` schemas in your database.

2.  **Bronze Layer Setup (Ingestion)**:
    * `Create_table_bronze.sql`: Creates the tables in the `bronze` schema to hold raw data.
    * `Loading_data_bronze.sql`: Loads raw data from CSV files into the bronze tables using `BULK INSERT`.

3.  **Silver Layer Setup (Cleaning & Transformation)**:
    * `create_table_silver.sql`: Creates the target tables in the `silver` schema.
    * `load_silver.sql`: Executes the stored procedure that cleans, transforms, and moves data from the Bronze to the Silver layer.
    * `quality_checks_silver.sql`: Performs data quality checks (e.g., for nulls or duplicates) on the silver tables.

4.  **Gold Layer Setup (Data Modeling)**:
    * `Gold_layer.sql`: Creates the final dimension and fact tables (`dim_customer`, `dim_product`, `dim_date`, `fact_sales`) and populates them from the silver tables.
    * `quality_checks_gold.sql`: Performs data quality checks on the final gold layer tables.

5.  **Analytics and Reporting**:
    * `DataAnalysis1.sql` & `Advance_analytics.sql`: Execute complex queries and create views for in-depth analysis.
    * `Report_customer.sql` & `Report_products.sql`: Generate specific, pre-defined reports for customers and products.

## Project Scripts

| Script                       | Layer     | Description                                                                                             |
| ---------------------------- | --------- | ------------------------------------------------------------------------------------------------------- |
| `creating_schema.sql`        | Setup     | Creates the `bronze`, `silver`, and `gold` database schemas.                                   |
| `Create_table_bronze.sql`    | Bronze    | Defines the schema and creates tables for raw data ingestion.                                  |
| `Loading_data_bronze.sql`    | Bronze    | Uses `BULK INSERT` to load data from source files into Bronze tables.                            |
| `create_table_silver.sql`    | Silver    | Defines the schema and creates tables for the cleaned and conformed data.                        |
| `load_silver.sql`            | Silver    | Contains the stored procedure with all business logic for cleaning and transforming the data.        |
| `quality_checks_silver.sql`  | Silver    | Contains queries to validate the data integrity in the Silver layer tables.                     |
| `Gold_layer.sql`             | Gold      | Creates and populates the star schema (Fact & Dimension tables) for analytics.                  |
| `quality_checks_gold.sql`    | Gold      | Contains queries to validate the data integrity in the Gold layer tables.                       |
| `Advance_analytics.sql`      | Analytics | Provides views and queries for advanced analytical purposes.                                   |
| `DataAnalysis1.sql`          | Analytics | Contains various queries for exploring and analyzing the data.                                   |
| `Report_customer.sql`        | Reporting | Generates a detailed report focused on customer demographics and sales.                          |
| `Report_products.sql`        | Reporting | Generates a detailed report focused on product performance and sales.                           |

## Data Catalog

For a detailed description of all tables and columns in each layer (Bronze, Silver, and Gold), please refer to the `data_catalog.md` file. This document serves as the official data dictionary for the project.
