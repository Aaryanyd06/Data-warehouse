create or alter procedure bronze.load_bronze as
begin
	begin try
truncate table bronze.crm_cust_info;
bulk insert bronze.crm_cust_info
from 'A:\SQL_Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
-- select * from bronze.crm_cust_info;



truncate table bronze.crm_prd_info;
bulk insert bronze.crm_prd_info
from 'A:\SQL_Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
-- select * from bronze.crm_prd_info;




truncate table bronze.crm_sales_details;
bulk insert bronze.crm_sales_details
from 'A:\SQL_Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
-- select * from bronze.crm_sales_details;



truncate table bronze.erp_loc_a101;
bulk insert bronze.erp_loc_a101
from 'A:\SQL_Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
-- select * from bronze.erp_loc_a101;




truncate table bronze.erp_cust_az12;
bulk insert bronze.erp_cust_az12
from 'A:\SQL_Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
-- select * from bronze.erp_cust_az12;




truncate table bronze.erp_px_cat_g1v2;
bulk insert bronze.erp_px_cat_g1v2
from 'A:\SQL_Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
-- select * from bronze.erp_px_cat_g1v2;
	end try
	begin catch
		print 'Error during loading of data'
		print 'Error message' + error_message()
	end catch
end

