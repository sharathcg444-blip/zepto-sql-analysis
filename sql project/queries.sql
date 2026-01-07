
select * from employee_salary;
CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

select * from zepto;

1./*count of rows*/
select count(*) as total_rows from zepto;
2./*null value*/
select * from zepto
WHERE sku_id IS NULL
   OR category IS NULL
   OR name IS NULL
   OR mrp IS NULL
   OR discountpercent IS NULL
   OR availablequantity IS NULL
   OR discountedsellingprice IS NULL
   OR weightingms IS NULL
   OR outofstock IS NULL
   OR quantity IS NULL;

 3./*different product categories */ 
 select distinct category from zepto order by category;

 4./*how many in stock how many out of stock*/
 select outofstock, count(sku_id) from zepto
 group by outofstock;
5./* product names present multiple times */ 
select name, count(name) from zepto
group by name having count(name)>2 order by count(name) desc;

 select  count(name) from zepto
having count(name)>2;
 
6./*check price is zero*/
select * from zepto
where discountedsellingprice = 0;

7./*convert paise to rupee*/
update zepto
set mrp =mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

8./*top 10 discount percent products*/
select distinct name, mrp,discountpercent from zepto
order by discountpercent desc limit 10;

9./*products with high mrp and out of stock*/
select * from zepto
where outofstock=true order by  discountedsellingprice desc limit 5;

10./*calculate estimate revenue for each category*/

select category, sum(availablequantity * discountedsellingprice)total_revenue from zepto
group by category
order by total_revenue;

11./*find all products where mrp>500 and discount is less than 10%*/
select * from zepto
where mrp>500 and discountpercent<10 order by mrp desc;

12./*identify the top 5 categories offering the highest average discount percentage*/
select category, round(avg(discountpercent),2) as avg_disc_price from zepto
group by category order by avg_disc_price desc limit 5;

13./*find the price per gram for products above 100g and sort by best value*/
select distinct name, weightingms,discountedsellingprice,round(discountedsellingprice/weightingms,2) 
As price_per_gm from zepto
where weightingms >=100
order by price_per_gm;

14./*group the products into like low,medium and bulk based on their weight*/
select distinct name, weightingms, 
case when weightingms<1000 then 'low'
     when weightingms<5000 then 'medium'
     else  'bulk' end
    As weight_status 
from zepto order by weight_status desc;
15./*total inventary weight per category*/
select category, sum(availablequantity * weightingms) as total_weight from zepto
group by category order by total_weight desc;

16./*total inventary weight */
select  sum(availablequantity * weightingms) as total_weight from zepto

17./*Display all records from the zepto table.*/
select * from zepto;

18./*Show distinct category values available in the dataset*/
select distinct category from zepto;

19./*Count total number of products in the table*/
select count(distinct name) from zepto;

20./*Find the maximum discountpercent offered.*/
select max(discountpercent) from zepto;

21./*Find the minimum discountedsellingprice.*/
select name,min(discountedsellingprice) as min_d from zepto 
group by name order by min_d limit 3;

22./*Display products where discountpercent is greater than 20.*/
select name,discountpercent from zepto
where discountpercent>20 order by discountpercent ;

23./*List products with availablequantity = 0*/
select name,outofstock from zepto
where availablequantity = 0;

24./*Count how many products belong to each category*/
select category, count(name) from zepto
group by category;

25./*Show categories ordered alphabetically*/
select distinct category from zepto
order by category;

26./*Display top 5 most expensive products based on discountedsellingprice*/

select distinct name,discountedsellingprice from zepto
order by discountedsellingprice desc limit 5;

27./*Find the average discounted selling price per category.*/
select category, round(avg(discountedsellingprice),2) from zepto
group by category;

28./*Show categories where average discount is greater than 15%.*/
select category,discountpercent from zepto
group by category,discountpercent having avg(discountpercent)>15 order by discountpercent desc;

29./*Calculate total available quantity per category*/
select category,sum(quantity) as available_stock from zepto
group by category order by available_stock desc;

30./*Find total revenue per product*/
select name, sum(availablequantity * discountedsellingprice) as revenue_per_product from zepto
group by name;

31./*Calculate total revenue per category*/
select category, sum(discountedsellingprice* discountedsellingprice) as total_revenue from zepto
group by category order by total_revenue desc;

32./*Find the category with the highest total revenue*/

select category, sum(quantity * discountedsellingprice) as total_revenue from zepto
group by category order by total_revenue desc ;

33./*Display top 5 categories by average discount percent.*/

select category, round(avg(discountpercent),2) as avg_dis_price from zepto
group by category  order by avg_dis_price desc limit 5;

35./*Count products with discountpercent = 0 per category.*/
select count(name) from zepto
where discountpercent = 0;

36./*Show categories having more than 10 products*/
select category from zepto  
group  by category having count(name)>10;

 37./* select all names from bevarages */
select  name from zepto
where  category = 'Beverages';

38./*Rank products by discountpercent within each category.*/

WITH ranked_products AS ( SELECT name,category,discountpercent,
  RANK() OVER (PARTITION BY category ORDER BY discountpercent DESC) AS rnk
    FROM zepto
)
SELECT * FROM ranked_products;

39./*Find the top 3 discounted products per category.*/

with ranked_products as(select name,category,discountpercent, 
row_number() over(partition by category order by discountpercent desc) as rnk from zepto )


select * from ranked_products
where rnk<4;

40./*Calculate running total revenue ordered by category.*/

WITH running_tot AS (
    SELECT
       
        category,
        discountedsellingprice,
        SUM(discountedsellingprice)
		OVER ( ORDER BY category
              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW  ) AS running_total,
			  rank() over(partition by category order by discountedsellingprice desc) as rank_cat
    FROM zepto 
)
SELECT * FROM running_tot
where rank_cat<2;











