 
SELECT * FROM project1.`sql - retail sales analysis_utf`
where
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantity is null
or
price_per_unit is null
or
cogs is null
or 
total_sale is null;

-- data exploration --
select count(*) as total_sale from project1.`sql - retail sales analysis_utf`
-- business key problems --
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from project1.`sql - retail sales analysis_utf`
where sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 2 in the month of Nov-2022
select * from project1.`sql - retail sales analysis_utf`
where category = 'Clothing'
and 
quantity > 2
and 
sale_date >= '2022-11-01'
and
sale_date > '2022-12-1'

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select 
category,
sum(total_sale * price_per_unit) as total_sales
from project1.`sql - retail sales analysis_utf`
group by
category;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
 round (avg(age), 2) as avg_age
from project1.`sql - retail sales analysis_utf`
where category = 'Beauty'


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from project1.`sql - retail sales analysis_utf`
where total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select
category,
gender,
count(*) as cogs
from project1.`sql - retail sales analysis_utf`
group
by
category,
gender

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select
month(sale_date) as month,
year(sale_date) as year,
avg(price_per_unit * quantity) as avg_sale
from project1.`sql - retail sales analysis_utf`
group by 
year(sale_date),
month(sale_date)
order by
year,
month;

select month, year, avg_sale
from(
month,
year,
avg_sale,
rank() over(partition by year order by avg_sale desc) as rank_in_year
)ranked
where rank_in_year = 1;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select
customer_id,
sum(total_sale) as total_sales 
 from project1.`sql - retail sales analysis_utf`
group by 1
order by 2 desc
limit 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category
select
category,
count(distinct customer_id) as unique_customer
from  project1.`sql - retail sales analysis_utf`
group by category








