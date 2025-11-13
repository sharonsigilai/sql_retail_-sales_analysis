CREATE TABLE retail_sales 
			(
			transactions_id INT,
			sale_date DATE,	
			sale_time TIME,	
			customer_id	INT,
			gender	VARCHAR(15),
			age	INT,
			category VARCHAR(15),	
			quantiy	INT,
			price_per_unit FLOAT,
			cogs	FLOAT,
			total_sale FLOAT
				);

SELECT
	COUNT (*)
FROM retail_sales

--DATA CLEANING--

SELECT*
FROM retail_sales
WHERE transactions_id IS NULL
SELECT*
FROM retail_sales
WHERE sale_date IS NULL

SELECT*
FROM retail_sales
WHERE sale_time IS NULL

SELECT*FROM retail_sales
WHERE 
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR	
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR 
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL
	-- DELETING NULL VALUES--

	DELETE FROM retail_sales
	WHERE 
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR	
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR 
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL

--counting 1997 records after deletion--
SELECT COUNT(*)
FROM retail_sales

-- DATA EXPLORATION--

--how many sales do we have?--
SELECT COUNT (*) as Total_sale
FROM retail_sales

--How many unique customers do we have_

SELECT COUNT(DISTINCT customer_id)  as customers
FROM retail_sales

	--How many unique categories do we have--
	SELECT DISTINCT category  as categories
FROM retail_sales
	

--Data analysis and business key problems and answers--
--Q1 Write SQL query to retrieve all columns for sales made on '2022-11-05'
--Q2 Write SQL query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 10in the month of Nv-2022--



--Q1 Write SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT*
FROM retail_sales
WHERE sale_date= '2022-11-05'

--Q2 Write SQL query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 4 in the month of Nv-2022--

SELECT*
FROM retail_sales
WHERE category= 'Clothing'
AND
TO_CHAR(sale_date, 'yyyy-MM')='2022-11' 
AND quantiy>=4

--q3 Write SQL query to calculate the total sales (total_sale)for each category

SELECT 
	category,
	SUM(total_sale)as net_sale,
	COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1

--q4 Write SQL query to find the average of customers who purchased items from the 'Beauty'category
SELECT 
ROUND(AVG(age), 2)as average_age
FROM retail_sales
WHERE category='Beauty'

--Q5 Write SQL query to find all transactions where the total_sale is grater than 1000
 SELECT*
 FROM retail_sales 
 WHERE total_sale>1000

--Q6 Write SQL query to find the total number of transactions (transaction_id) made by each gender in each category
SELECT category,
gender,
COUNT(*)as total_transactions
FROM retail_sales 
GROUP BY category,
gender,
ORDER BY 1

--Q7 Write SQL query to calculate the average sale for each month, find out best selling month in each year

SELECT 
		EXTRACT (YEAR FROM sale_date)as year,
		EXTRACT (MONTH FROM sale_date)as month,
		AVG(total_sale) as average_sale
		--RANK () OVER( PARTITION BY EXTRACT(YEAR FROM sale_date)ORDER BY AVG(total_sale)DESC) as rank
FROM retail_sales 
GROUP BY 1,2
ORDER BY 1,3 DESC









