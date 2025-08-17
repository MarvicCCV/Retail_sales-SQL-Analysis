CREATE TABLE retail_data 
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(15),
		age SMALLINT, 
		category VARCHAR(30),	
		quantity INT,
		price_per_unit NUMERIC(10,3), 
		cogs NUMERIC(10,3),	
		total_sale NUMERIC(10,3)

	)

-- SQL QUERIES FOR DATA CLEANING

SELECT *
FROM retail_data;

-- Count the total amount of data
SELECT COUNT(*) AS data_count
FROM retail_data

-- Check the number of customers
SELECT COUNT(DISTINCT customer_id) AS num_of_customers
FROM retail_data

-- Group number of customer per gender
SELECT gender, COUNT(*) AS num_of_customer
FROM retail_data
GROUP BY gender

-- Check for Null values
SELECT * 
FROM retail_data
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
	AGE IS NULL
	OR 
	category IS NULL
	OR 
	quantity IS NULL
	OR 
	price_per_unit IS NULL
	OR 
	cogs IS NULL
	OR 
	total_sale IS NULL

-- Delete the records with null values

DELETE FROM retail_data
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
	AGE IS NULL
	OR 
	category IS NULL
	OR 
	quantity IS NULL
	OR 
	price_per_unit IS NULL
	OR 
	cogs IS NULL
	OR 
	total_sale IS NULL


	
-- DATA EXPLORATION 

SELECT DISTINCT category
FROM retail_data

SELECT category, COUNT(*) AS num_of_transactions
FROM retail_data
GROUP BY category

-- BUSINESS QUESTIONS TO BE ANSWERED
-- The following SQL queries were developed to answer specific business questions:
SELECT *
FROM retail_data

-- Q1: Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT *
FROM 
	retail_data
WHERE 
	sale_date = '2022-11-05'
ORDER BY 
	sale_time 

-- Q2: Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
SELECT *
FROM retail_data
WHERE category = 'Clothing' AND (EXTRACT MONTH FROM sale_date = 11 AND EXTRACT DAY FROM sale_date = 22) AND quantity > 4

-- Q3: Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category, SUM(total_sale) AS total_sales_per_category
FROM retail_data
GROUP BY category

-- Q4: Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
 
SELECT ROUND(AVG(age),2) AS beauty_customer_avg_age
FROM retail_data
WHERE category = 'Beauty'

-- Q5: Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT *
FROM 
	retail_data
WHERE total_sale > 1000
ORDER BY total_sale DESC

Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
**Write a SQL query to find the top 5 customers based on the highest total sales **:
Write a SQL query to find the number of unique customers who purchased items from each category.:
Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
