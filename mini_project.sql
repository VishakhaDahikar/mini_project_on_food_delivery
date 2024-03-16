use assgnment;
select * from sql_project;
-- Q1	Online food order decision based on customer Age
with cte as(
select *, 
case
when Age < 20 then 'child'
when Age > 20 and age < 25  then 'younger'
when  Age >=25 and age < 30 then  'Adult' 
else 'senior_citigen'
end 
as age_group
   from sql_project)
   select Age_group
   ,count(age_group) order_by_age from cte
   group by 1
   order by 2 desc;


-- Q2	Online food order decision based on size of the family

select distinct(family_size) from sql_project;
with cte as (
select *,
case
	when family_size =1 then 'single'
    when family_size =2 then 'couple'
    when family_size >2 and family_size <= 4 then 'nuclear_family'
    else  'join_family'
    end
    as family_wise
    from sql_project)
    select family_wise,count(family_wise) as no_of_orders from cte
    group by 1
    order by 2 desc;
-- Q3	Who orders more Male or Female??

select * from sql_project;
select gender,count(gender) as total_orders from sql_project
group by 1
order by 2 desc;

-- Q4	Who orders more Married or unmarried??
select Marital_Status,count(Marital_Status) as total_order_by_Married from sql_project
group by 1
order by 2 desc;
-- Q5	Analyze food ordering behaviour across income level
select distinct(monthly_income) from sql_project;
select monthly_income,count(monthly_income)*100/sum(count(monthly_income))   from sql_project
;

SELECT 
    monthly_income,
    COUNT( monthly_income) AS total_order,
    ROUND((COUNT( monthly_income) * 100.0) / SUM(COUNT( monthly_income)) OVER (), 2) AS percentage
FROM sql_project
GROUP BY  monthly_income
ORDER BY total_order DESC;
-- Q6	Food ordering pattern based on qualification
select * from sql_project;
select Educational_Qualifications,count(Educational_Qualifications) as qualified_base from sql_project
group by 1
order by 2 desc;

-- Q7	Food ordering pattern based on occupation
select * from sql_project;
select Occupation,count(Occupation) as occupation_base from sql_project
group by 1
order by 2 desc;
-- Q8	Check the feedback
select * from sql_project;
select Feedback,count(Feedback) as Feedback_wise from sql_project
group by 1
order by 2 desc;