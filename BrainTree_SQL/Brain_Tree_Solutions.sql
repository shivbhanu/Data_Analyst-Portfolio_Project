use braintree;
show tables;

## Question 1.1 :
select 
-- country_code,
case when country_code is null or country_code = '' then 'FOO' else country_code end as cc
from continent_map 
group by country_code
having count(*) > 1 
order by country_code;



## Question 1.2 : 
select * from 
(select 
country_code, continent_code, row_number() over(partition by country_code order by continent_code ) as rnk
from (select 
-- case when country_code = '' then 'FOO' else country_code end as country_code, 
country_code, 
continent_code
 from continent_map ) a )a 
 where rnk = 1 
 order by 1,2;
 
 
## Question 2.1 
select continent_name, a.country_code, country_name, concat(gdp_gw, '%') as gp, rnk  from 
(select 
continent_code, country_code, year, gdp, gdp_ly, round((gdp*1.00/gdp_ly -1 )*100.00,2)  as gdp_gw, 
rank() over(partition by continent_code order by round((gdp*1.00/gdp_ly -1 )*100.00,2) desc) as rnk 

from 
(select 
a.country_code, year, gdp_per_capita as gdp, b.continent_code, 
lag(gdp_per_capita) over(partition by a.country_code order by year) as gdp_ly
 from per_capita a left join continent_map b on a.country_code = b.country_code)a
 where year = 2012
 order by continent_code, gdp_gw desc)a  left join continents b on a.continent_code = b.continent_code 
 left join countries c on a.country_code  = c.country_code
 where rnk between 10 and 12;
 
 
 ## Question 3.1 
 
select 

concat(round(sum(case when continent_name = 'Asia' then gdp_per_capita end)*100.00/sum(gdp_per_capita), 2),'%') as Asia,
concat(round(sum(case when continent_name = 'Europe' then gdp_per_capita end)*100.00/sum(gdp_per_capita), 2),'%') as Eurpoe,
concat(round(sum(case when continent_name not in  ('Asia', 'Europe') then gdp_per_capita end)*100.00/sum(gdp_per_capita), 2),'%') as Rest

from per_capita a left join continent_map b on a.country_code = b.country_code 
left join continents c on b.continent_code = c.continent_code
where year = 2012
;


## Question 4.1 

select 
count(distinct country_name) as c_count, 
round(sum(gdp_per_capita),2) as related_gdp

from per_capita a left join countries b on a.country_code = b.country_code
where year = 2007
and lower(country_name) like '%an%'
;


## Question 4.2

select 
count(distinct country_name) as c_count, 
round(sum(gdp_per_capita),2) as related_gdp

from per_capita a left join countries b on a.country_code = b.country_code
where year = 2007
and (country_name) like '%an%'
;


## Question 5 

with cn_12 as (select distinct b.country_code
-- , year, gdp_per_capita
from (Select * from per_capita where year = 2012 )a  right  join countries b on a.country_code = b.country_code
where a.country_code is null 
)


select 
year, count(distinct country_code) as cc, round(sum(gdp_per_capita),2) as gdp_sum

from per_capita where year < 2012 
and country_code in (select * from cn_12)
group by 1 order by 1
;


## Question 6.1 : 
with base as 
(select 
country_name, continent_name, a.country_code, b.continent_code, year, gdp_per_capita
from per_capita a left join continent_map b on a.country_code = b.country_code
left join continents c on b.continent_code = c.continent_code
left join countries d on a.country_code = d.country_code)

select * from 
(select 
continent_name,
country_code,
country_name,
gdp_per_capita, 
sum(gdp_per_capita) over(partition by continent_name ) as running_total

from base 
where year = 2009 
order by continent_name, 
substr(country_name,2,3) desc) a 
where running_total >= 70000;


## Question 7
with base as 
(select 
country_name, continent_name, a.country_code, b.continent_code, year, gdp_per_capita
from per_capita a left join continent_map b on a.country_code = b.country_code
left join continents c on b.continent_code = c.continent_code
left join countries d on a.country_code = d.country_code)

select * from 
(select 
*, rank() over(partition by continent_name order by gdp_per_capita desc) as rnk

from (select continent_name, country_code, country_name , round(avg(gdp_per_capita),2) as gdp_per_capita from base
where continent_name is not null 
group by 1,2,3 
 )a
 ) a 
where rnk = 1 ;

