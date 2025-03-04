--Make column "datetime" as unique

Alter table [Coffe sales]
add constraint datetime unique(datetime)

select * from [Coffe sales]

--Find Dublicate

select datetime, count(datetime) as value_count from [Coffe sales] group by datetime having count(datetime)>1 --No Dublicates


--Total_Revenue_2024

select round(sum(money),2) as Total_Revenue_2024 from [Coffe sales]


--Card Vs Cash wise sales over the year

select cash_type , round(sum(money),2) as Cash_Type_Revenue_2024 from [Coffe sales]
group by cash_type

--Monthly Revenue
select
case
	when month(date) = 1 then 'Jan'
	when month(date) = 2 then 'Feb'
	when month(date) = 3 then 'Mar'
	when month(date) = 4 then 'Apr'
	when month(date) = 5 then 'May'
	when month(date) = 6 then 'Jun'
	when month(date) = 7 then 'Jul'
	when month(date) = 8 then 'Aug'
	when month(date) = 9 then 'Sep'
	when month(date) = 10 then 'Oct'
	when month(date) = 11 then 'Nov'
	when month(date) = 12 then 'Dec'
end as Month,round(sum(money),2) as Monthly_Revenue
from [Coffe sales] group by month(date) order by round(sum(money),2) desc

--Day Revenue

select date , round(sum(money),2) as Day_Revenue from [Coffe sales]
group by date order by date


-- Product wise revenue by year

select coffee_name, round(sum(money),2) as Product_Revenue_by_Year from [Coffe sales]
group by coffee_name order by round(sum(money),2) desc

-- Monthly Revenue by Product wise

select coffee_name,
datename(month,date) as Month,  round(sum(money),2) as Monthly_Revenue
from [Coffe sales] group by datename(month,date),coffee_name 
order by coffee_name, datename(month,date)


--Over All Week_Day_Revenue

select datename(weekday,date) as Week_Day,round(sum(money),2) as Week_Day_Revenue
from [Coffe sales] group by datename(weekday,date) 
order by  datename(weekday,date) asc

--Over All Week_Day_Revenue by Product

select coffee_name,datename(weekday,date) as Week_Day,round(sum(money),2) as Week_Day_Revenue_by_Product
from [Coffe sales] 
group by datename(weekday,date),coffee_name

-- Hourly Trent

select datepart(hour,datetime) as Hour_,
sum(round(money,2)) as Hourly_Revenue
from [Coffe sales] group by datepart(hour,datetime) order by datepart(hour,datetime)

-- Horly Trent Top 3 Highest sale hour

select top 3datepart(hour,datetime) as Hour_,
sum(round(money,2)) as Hourly_Revenue
from [Coffe sales] group by datepart(hour,datetime) order by sum(round(money,2)) desc

-- Horly Trent Top 3 Lowest sale hour

select top 3 datepart(hour,datetime) as Hour_,
sum(round(money,2)) as Hourly_Revenue
from [Coffe sales] group by datepart(hour,datetime) order by sum(round(money,2)) asc



--Minute Trent

select datepart(hour,datetime) as Hour_, 
datepart(minute,datetime) as Minute_,
sum(round(money,2)) as Minute_Revenue
from [Coffe sales] group by datepart(hour,datetime),datepart(minute,datetime) 
order by datepart(hour,datetime),datepart(minute,datetime) 

-- Product sale count Trent  over the year

select coffee_name, count(coffee_name) count_of_sales from [Coffe sales] group by coffee_name order by count(coffee_name)

-- Product sale count Trent  over the week

select coffee_name , datename(weekday,datetime) as weekday,  count(coffee_name) as count_of_sale from [Coffe sales] 
group by datename(weekday,datetime), coffee_name






select date, 
datepart(month,datetime) as month_,
datepart(day,datetime) as day_,
datepart(hour,datetime) as Hour_, 
datepart(minute,datetime) as minute_, 
datepart(second,datetime) as second_, 
round(money,2) as Revenue 
from [Coffe sales] 

select * from [Coffe sales]


-- AVG Sales 

select round(avg(money),2) as AVG_Sales_Over_Year from [Coffe sales]

select datename(month,datetime) as month ,round(avg(money),2)  as AVG_Sales_Over_Month from [Coffe sales] 
group by datename(month,datetime) 
order by round(avg(money),2) desc 

select datename(weekday,datetime) as Week, round(avg(money),2) AVG_Week_Sales  from [Coffe sales]
group by datename(weekday,datetime)

select datepart(hour,datetime) as Hour , round(avg(money),2) as AVG_Hour_Sales from [Coffe sales] 
group by datepart(hour,datetime)
order by datepart(hour,datetime) 


