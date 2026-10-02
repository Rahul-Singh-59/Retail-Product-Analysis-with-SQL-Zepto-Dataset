-- DATA CLEANING AND MANIPULATION
-- stock vs outofstock
select outofstock, count(sku_id)
from zepto
group by outofstock

--duplicate items or no of appearance more than 1
select name,count(sku_id) from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc

-- product with zero price
select * from zepto
where mrp = 0 or discountedsellingprice = 0

-- removing product with zero price
delete from zepto
where mrp = 0 or discountedsellingprice = 0

-- converting paise into rupees
update zepto
set mrp = mrp/100.0, 
discountedSellingPrice = discountedSellingPrice/100.0;

-- BUSINESS INSIGHTS
---Found top 10 best-value products based on discount percentage
select distinct name,mrp, discountpercent,discountedsellingprice from zepto
order by discountpercent desc
limit 10

---Identified top 5 high-MRP products that are currently out of stock
select distinct name,mrp,outofstock from zepto
where outofstock = true
order by mrp desc
limit 5

---Estimated potential revenue for each product category
select category, sum (discountedsellingprice * availablequantity) as total_revenue from zepto
group by category
order by total_revenue desc;

---Filtered expensive products (MRP > ₹500) with minimal discount
select distinct name, mrp, discountpercent from zepto
where mrp >= 500 and discountpercent < 10
order by mrp desc

--- Ranked top 5 categories offering highest average discounts
select category, round(avg(discountpercent),2) as avg_discount from zepto
group by category
order by avg(discountpercent) desc
limit 5
--- Calculated price per gram for products above 100g and sort by best value
select distinct name, weightingms, discountedsellingprice, round(discountedsellingprice / weightingms,2)
as price_per_gram
from zepto
where weightingms >= 100
order by price_per_gram desc

--- Grouped products based on weight into Low, Medium, and Bulk categories
select distinct name, weightingms,
case when weightingms < 1000 then 'low'
    when weightingms <= 5000 then 'medium'
    else 'bulk'
    end as weight_category
from zepto

---Total inventory per weight category
select category, sum(weightingms * availablequantity) as total_weight
from zepto
group by category
order by total_weight




