/*
Project: Indian Budget Analysis (1947–2026)

Objective:
Analyze historical Indian Union Budget trends using SQL.

Skills Demonstrated:
- Data Exploration
- Aggregate Functions
- Window Functions
- Ranking Functions
- CASE WHEN
- CTEs
- Business Analysis

Tools:
- MySQL Workbench
*/
-- ============================================================================================================================================================

-- create database nation_budget;
use nation_budget;

/*
--  alter table nation_budget_1947_2026 change column Year Year_Record int;
--  alter table nation_budget_1947_2026 change column Defense_Percentage  Defense_Allocation_Percentage decimal(4,2);
--  alter table nation_budget_1947_2026 change column Education_Percentage  Education_Allocation_Percentage decimal(4,2);
  alter table nation_budget_1947_2026 change column Health_Percentage  Health_Allocation_Percentage decimal(4,2);
  alter table nation_budget_1947_2026 change column Interest_Payments_Percentage  Interest_Payments_Allocation_Percentage decimal(4,2);
  alter table nation_budget_1947_2026 change column Infrastructure_Percentage  Infrastructure_Allocation_Percentage decimal(4,2);
  alter table nation_budget_1947_2026 change column Agriculture_Percentage  Agriculture_Allocation_Percentage decimal(4,2);
  alter table nation_budget_1947_2026 change column State_Transfers_Percentage  State_Transfers_Allocation_Percentage decimal(4,2);
  alter table nation_budget_1947_2026 change column Administration_and_Others_Percentage  Administration_and_Others_Allocation_Percentage decimal(4,2);
  alter table nation_budget_1947_2026 change column Social_Welfare_Percentage  Social_Welfare_Allocation_Percentage decimal(4,2);

 alter table nation_budget_1947_2026 change column Defense_Amount_Billions_USD  Defense_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column Education_Amount_Billions_USD  Education_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column Health_Amount_Billions_USD  Health_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column Interest_Payments_Amount_Billions_USD  Interest_Payments_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column Infrastructure_Amount_Billions_USD  Infrastructure_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column Agriculture_Amount_Billions_USD  Agriculture_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column State_Transfers_Amount_Billions_USD State_Transfers_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column Social_Welfare_Amount_Billions_USD  Social_Welfare_Budget decimal(5,2);
 alter table nation_budget_1947_2026 change column Administration_and_Others_Amount_Billions_USD  Administration_and_Others_Budget decimal(5,2);

-- Renamed column names for better readability and consistency.Added them in comment section because it showed error once they are renamed.
*/

-- ========================================================================================================================================================================
-- Section 1: Data Exploration (5 queries)

-- Q1. Display the first 10 records.
select * from nation_budget_1947_2026 limit 10;

-- Q2. Count the total number of records.
select count(*) as Total_Records from nation_budget_1947_2026;
-- There are total 80 records, one of each year from 1947 to 2026

-- Display all column names.
describe nation_budget_1947_2026;


-- Find the earliest and latest budget year.
select min(Year_Record) as Earliest_Year,max(Year_Record) as Latest_Year from nation_budget_1947_2026;

-- Check for NULL values.
/* 
select * from nation_budget_1947_2026 where Year_Record is null
or Defense_Allocation_Percentage  is null
or Education_Allocation_Percentage is null
or Health_Allocation_Percentage is null
or Interest_Payments_Allocation_Percentage is null 
or Total_Budget_Billions_USD is null 
or Infrastructure_Allocation_Percentage is null 
or Agriculture_Allocation_Percentage is null
or State_Transfers_Allocation_Percentage is null
or Social_Welfare_Allocation_Percentage  is null
or Administration_and_Others_Allocation_Percentage is null
or Defense_Budget is null
or Education_Budget is null
or Health_Budget is null
or Interest_Payments_Budget is null  
or Infrastructure_Budget is null
or Agriculture_Budget is null
or State_Transfers_Budget is null
or Social_Welfare_Budget is null
or Administration_and_Others_Budget is null
*/


-- ===========================================================================================================================================================================
-- Section 2: Aggregate Analysis (7 queries)

-- Q6. Total budget allocated.
select round(sum(Total_Budget_Billions_USD),2) as Total_Budget from nation_budget_1947_2026;

-- Q7. Average budget.
select round(avg(Total_Budget_Billions_USD),2) as Average_Budget from nation_budget_1947_2026;

-- Q8. Maximum budget.
select round(max(Total_Budget_Billions_USD),2) as Maximum_Budget from nation_budget_1947_2026;

-- Q9. Minimum budget.
select round(min(Total_Budget_Billions_USD),2) as Minimum_Budget from nation_budget_1947_2026;

-- Q10. Maximum budget with year.
select Year_Record,Total_Budget_Billions_USD from nation_budget_1947_2026 order by Total_Budget_Billions_USD desc limit 1;

-- Q11. Minimum budget with year.
select Year_Record,Total_Budget_Billions_USD from nation_budget_1947_2026 order by Total_Budget_Billions_USD asc limit 1;

-- Q12. Total expenditure on Education.
select sum(Education_Budget) as Total_Education_Budget from nation_budget_1947_2026;


-- ======================================================================================================================================================================================================
-- Section 3: Sorting & Filtering (6 queries)

-- Q13. Top 10 highest budget years.
select Year_Record,Total_Budget_Billions_USD as Top_10_Highest_Budget_Years from nation_budget_1947_2026 order by Total_Budget_Billions_USD desc limit 10;

-- Q14. Bottom 10 budget years.
select Year_Record,Total_Budget_Billions_USD as Top_10_Highest_Budget_Years from nation_budget_1947_2026 order by Total_Budget_Billions_USD asc limit 10;

-- Q15. Budget greater than average.
select Year_Record,Total_Budget_Billions_USD as Budget_Greater_Than_Average from nation_budget_1947_2026 where Total_Budget_Billions_USD > (select avg(Total_Budget_Billions_USD) from nation_budget_1947_2026);

-- Q16. Budget less than average.
select Year_Record,Total_Budget_Billions_USD as Budget_Less_Than_Average from nation_budget_1947_2026 where Total_Budget_Billions_USD < (select avg(Total_Budget_Billions_USD) from nation_budget_1947_2026);

-- Q17. Budgets after 2000.
select Year_Record,Total_Budget_Billions_USD as Budget_After_2000 from nation_budget_1947_2026 where Year_Record > 2000;

-- Q18. Budgets before 1991.
select Year_Record,Total_Budget_Billions_USD as Budget_Before_1991 from nation_budget_1947_2026 where Year_Record < 1991;


-- =================================================================================================================================================================================
-- Section 4: Department Analysis (6 queries)

-- Q19. Highest Education budget.
select max(Education_Budget) as Highest_Education_Budget from nation_budget_1947_2026;

-- Q20. Highest Health budget.
select max(Health_Budget) as Highest_Health_Budget from nation_budget_1947_2026;

-- Q21. Highest Defence budget.
select max(Defense_Budget) as Highest_Defense_Budget from nation_budget_1947_2026;

-- Q22. Average Education budget.
select avg(Education_Budget) as Average_Education_Budget from nation_budget_1947_2026;

-- Q23. Average Health budget.
select avg(Health_Budget) as Average_Health_Budget from nation_budget_1947_2026;

-- Q24. Average Defence budget.
select avg(Defense_Budget) as Average_Defense_Budget from nation_budget_1947_2026;


-- =======================================================================================================================================================================================
-- Section 5: Window Functions (8 queries)

-- Q25. Previous year's budget.
select Year_Record,Total_Budget_Billions_USD,lag(Total_Budget_Billions_USD) over(order by Year_Record) as Previous_Year_Budget from nation_budget_1947_2026;

-- Q26. Next year's budget using LEAD().
select Year_Record,Total_Budget_Billions_USD,lead(Total_Budget_Billions_USD) over(order by Year_Record) as Next_Year_Budget from nation_budget_1947_2026;

-- Q27. Running Total.
select Year_Record,Total_Budget_Billions_USD,sum(Total_Budget_Billions_USD) over(order by Year_Record) as Running_Total from nation_budget_1947_2026;

-- Q28. Year-over-Year budget increase.
select Year_Record,Total_Budget_Billions_USD,Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record) as Year_Over_Year_Budget_Increase from nation_budget_1947_2026; 

-- Q29. Highest growth year.
select Year_Record,Total_Budget_Billions_USD,Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record) as Highest_Growth_Year from nation_budget_1947_2026 order by Highest_Growth_Year desc limit 1;

-- Q30. Biggest budget decline.
select Year_Record,Total_Budget_Billions_USD,Total_Budget_Billions_USD - lead(Total_Budget_Billions_USD) over(order by Year_Record) as Biggest_Budget_Decline from nation_budget_1947_2026 order by Biggest_Budget_Decline desc limit 1;

-- Q31. Running average budget.
select Year_Record,Total_Budget_Billions_USD,avg(Total_Budget_Billions_USD) over(order by Year_Record) as Running_Average from nation_budget_1947_2026;


-- =============================================================================================================================================================================================================================================================
-- Section 6: Ranking Functions (5 queries)

-- Q33. Rank all years by budget.
select Year_Record,Total_Budget_Billions_USD,rank() over(order by Total_Budget_Billions_USD desc) as Budget_Rankings from nation_budget_1947_2026;

-- Q34. Dense Rank.
select Year_Record,Total_Budget_Billions_USD,dense_rank() over(order by Total_Budget_Billions_USD desc) as Dense_Budget_Rankings from nation_budget_1947_2026;

-- Q35. Row Number.
select Year_Record,Total_Budget_Billions_USD,row_number() over(order by Total_Budget_Billions_USD desc) as Budget_Row_Number from nation_budget_1947_2026;

-- Q36. Top 10 budget years using Rank.
select Year_Record,Total_Budget_Billions_USD,rank() over(order by Total_Budget_Billions_USD desc) as Top_10_Budget_Years from nation_budget_1947_2026 limit 10;

-- Q37. Second highest budget.
select Year_Record,Total_Budget_Billions_USD from (select Year_Record,Total_Budget_Billions_USD,rank() over(order by Total_Budget_Billions_USD desc) as All_Budget from nation_budget_1947_2026 limit 5) as Second_Highest_Budget where All_Budget = 2;
-- select Year_Record,Total_Budget_Billions_USD,rank() over(order by Total_Budget_Billions_USD desc) as All_Budget from nation_budget_1947_2026 limit 5


-- ===============================================================================================================================================================================================================================================================
-- Section 7: CASE WHEN (4 queries)

-- Q38. Categorize budgets.
select Year_Record,Total_Budget_Billions_USD,
	case
		when Total_Budget_Billions_USD < 250 then "LOW BUDGET"
        when Total_Budget_Billions_USD between 250 and 750 then "MEDIUM BUDGET"
        else "HIGH BUDGET"
	end as Budget_Category
from nation_budget_1947_2026;

-- Q39. Categorize years by decade.
select Year_Record,Total_Budget_Billions_USD,
	case
		when Year_Record between 1947 and 1967 then "INITIAL PHASE"
        when Year_Record between 1967 and 1987 then "DEVELOPMENT PHASE"
        when Year_Record between 1987 and 2007 then "POST LIBERALIZATION"
        when Year_Record between 2007 and 2027 then "MODERN ERA"
	end as "Decade_Wise_Categorization"
from nation_budget_1947_2026;

-- Q40. Growth / Decline / No Change.
select Year_Record,Total_Budget_Billions_USD,lag(Total_Budget_Billions_USD) over(order by Year_Record) as Budget_Changes,
	case
		when lag(Year_Record) over(order by Year_Record) is NULL then "NA"
        when Total_Budget_Billions_USD > lag(Total_Budget_Billions_USD) over(order by Year_Record) then "GROWTH"
        when Total_Budget_Billions_USD < lag(Total_Budget_Billions_USD) over(order by Year_Record) then "DECLINE"
		else "NO CHANGES"
	end as Budget_Status
from nation_budget_1947_2026;


-- ======================================================================================================================================================================================================
-- Section 8: CTEs (4 queries)

-- Q42. Highest growth year using CTE.
with budget_growth as (
	select Year_Record,Total_Budget_Billions_USD,
    Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record) as Growth from nation_budget_1947_2026 
)

select Year_Record,Growth from budget_growth where Growth =  (select max(Growth) from budget_growth);

-- Q43. Years where growth exceeded 20%.
with Growth_Ratio as (
	select Year_Record,Total_Budget_Billions_USD,
    round(((Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record)) / (lag(Total_Budget_Billions_USD) over(order by Year_Record))*100),2) as Growth_Percent
    from nation_budget_1947_2026
)

select Year_Record,Growth_Percent from Growth_Ratio where Growth_Percent > 20;

-- Q44. Top 5 growth years.
with Top_Growth as (
	select Year_Record,Total_Budget_Billions_USD,
    round(((Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record)) / (lag(Total_Budget_Billions_USD) over(order by Year_Record))*100),2) as Top_5_Growth_Year
    from nation_budget_1947_2026 order by Top_5_Growth_Year desc
)

select * from Top_Growth limit 5;

-- Q45. Years with declining budgets.
with Growth_Ratio as (
	select Year_Record,Total_Budget_Billions_USD,
    round(((Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record)) / (lag(Total_Budget_Billions_USD) over(order by Year_Record))*100),2) as Growth_Percent
    from nation_budget_1947_2026
)

select Year_Record,Growth_Percent from Growth_Ratio where Growth_Percent < 0;


-- ==============================================================================================================================================================================================================================
-- Section 9: Final Business Questions (5 queries)

-- Q46. Which decade had the highest average budget?
select Year_Record,Total_Budget_Billions_USD,
	case 
		when Year_Record between 1947 and 1949 then "1940s" 
        when Year_Record between 1950 and 1959 then "1950s" 
        when Year_Record between 1960 and 1969 then "1960s" 
        when Year_Record between 1970 and 1979 then "1970s" 
        when Year_Record between 1980 and 1989 then "1980s" 
        when Year_Record between 1990 and 1999 then "1990s" 
        when Year_Record between 2000 and 2009 then "2000s" 
        when Year_Record between 2010 and 2019 then "2010s" 
        when Year_Record between 2020 and 2026 then "2020s" 
	end as Decade_Budget,
	round(avg(Total_Budget_Billions_USD),2) as Average_Budget
from nation_budget_1947_2026
group by Decade_Budget order by avg(Decade_Budget) desc
limit 1;

-- Q47. Which year recorded the highest increase?
select Year_Record,Total_Budget_Billions_USD,
Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record) as Highest_Increase
from nation_budget_1947_2026 order by Highest_Increase desc limit 1;

-- Q48. Which year recorded the largest decrease?
with Largest_Decrease as (
	select Year_Record,Total_Budget_Billions_USD,
    Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record) as Largest_Difference
    from nation_budget_1947_2026
)

select * from Largest_Decrease where Largest_Difference is not null order by Largest_Difference asc limit 1;

-- Q49. Which budgets are above the overall average?
select Year_Record,Total_Budget_Billions_USD from nation_budget_1947_2026 where Total_Budget_Billions_USD > (select avg(Total_Budget_Billions_USD) from nation_budget_1947_2026);

-- Q50. Show a complete summary.
with budget_summary as(
	select 
		Year_Record,
		Total_Budget_Billions_USD as Total_Budget ,
		round(Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record),2) as Previous,
        round(lead(Total_Budget_Billions_USD) over(order by Year_Record) - Total_Budget_Billions_USD,2) as Next,
        round(((Total_Budget_Billions_USD - lag(Total_Budget_Billions_USD) over(order by Year_Record)) / (lag(Total_Budget_Billions_USD) over(order by Year_Record))*100),2) as Growth_Percent,
        rank() over(order by Total_Budget_Billions_USD) as Rank_Budget,
        sum(Total_Budget_Billions_USD) over(order by Year_Record) as Running_Total
	from nation_budget_1947_2026
)

select * from budget_summary;


-- =========================================================================================================================================================================================================================

/*
Insights : 
Q1. Display first 10 records : Overall View of Columns for references.
Q2. Count total records	: 80 records confirm that dataset covers the complete time period without missing yearly records.
Q3. Display column names : Identified all available variables for budget analysis :Year_Record int(11) ,Defense_Allocation_Percentage decimal(4,2) ,Education_Allocation_Percentage decimal(4,2) ,Health_Allocation_Percentage decimal(4,2) ,Interest_Payments_Allocation_Percentage decimal(4,2) ,Total_Budget_Billions_USD double ,Infrastructure_Allocation_Percentage decimal(4,2) ,Agriculture_Allocation_Percentage decimal(4,2) ,State_Transfers_Allocation_Percentage decimal(4,2) ,Social_Welfare_Allocation_Percentage decimal(4,2) ,Administration_and_Others_Allocation_Percentage decimal(4,2) ,Defense_Budget decimal(5,2) ,Education_Budget decimal(5,2) ,Health_Budget decimal(5,2) ,Interest_Payments_Budget decimal(5,2) ,Infrastructure_Budget decimal(5,2) ,Agriculture_Budget decimal(5,2) ,State_Transfers_Budget decimal(5,2) ,Social_Welfare_Budget decimal(5,2) ,Administration_and_Others_Budget decimal(5,2)
Q4. Earliest and latest year : 1947 and 2026 confirms the historical period available for analysis.
Q5. Check NULL values : Ensures data quality before performing analysis.
Q6. Total budget allocated : 17692.93 MILLION USD DOLLARS shows the cumulative government budget across the entire study period.
Q7. Average budget	Represents the typical annual budget over the years i.e 221.16 MILLION USD DOLLARS.
Q8. Maximum budget	Identifies the highest budget ever allocated 1155.15 MILLION USD DOLLARS.
Q9. Minimum budget	Identifies the smallest recorded budget 3.35 MILLION USD DOLLARS.
Q10. Maximum budget with year 2026 pinpoints the year with the highest government spending i.e 1155.15 MILLION USD DOLLARS.
Q11. Minimum budget with year 1947 identifies the year with the lowest budget allocation i.e 3.346 MILLION USD DOLLARS.
Q12. Total education expenditure measures the government's cumulative investment of 2503.75 MILLION USD DOLLARS in education.
Q13. Top 10 highest budget years highlights periods of peak government expenditure.
Q14. Bottom 10 budget years	identifies years with comparatively low spending.
Q15. Budgets greater than average shows years that exceeded the long-term average budget.
Q16. Budgets less than average highlights years where government spending was below average.
Q17. Budgets after 2000	useful for studying modern budget trends.
Q18. Budgets before 1991 helps analyze spending before major economic reforms.
Q19. Highest education budget of 163.57 MILLION USD DOLLARS identifies the year with the largest investment in education.
Q20. Highest health budget of 53.02 MILLION USD DOLLARS	shows when healthcare spending reached its peak.
Q21. Highest defence budget	of 88.14 identifies the year with maximum defence expenditure.
Q22. Average education budget of 31.3 MILLION USD DOLLARS indicates the average annual investment in education.
Q23. Average health budget of 8.22 MILLION USD DOLLARS shows the long-term average health allocation.
Q24. Average defence budget	of 20.42 MILLION USD DOLLARS indicates average annual defence spending.
Q25. Previous year's budget (LAG) makes year-over-year budget comparisons straightforward.
Q26. Next year's budget (LEAD) helps compare current and future budgets.
Q27. Running total	Demonstrates cumulative budget growth over time.
Q28. Year-over-year budget increase	shows the absolute change in budget from one year to the next.
Q29. Highest growth year 2021 identifies the year with the largest increase in budget allocation of 131.91 MILLION USD DOLLARS.
Q30. Biggest budget decline	of 66.52 MILLION USD DOLLARS reveals the year 2018 with the sharpest reduction in budget.
Q31. Running average smooths annual fluctuations to reveal long-term trends.
Q33. Rank all years by budget orders years from highest to lowest spending.
Q34. Dense Rank	Groups years with identical budgets without leaving rank gaps.
Q35. Row Number	Assigns a unique sequential number to each record.
Q36. Top 10 budget years using Rank	Highlights the ten largest annual budgets.
Q37. Second highest budget	Identifies the second-largest annual budget.
Q38. Categorize budgets	Classifies budgets into High, Medium, and Low for easier interpretation.
Q39. Categorize years by decade	Enables decade-wise trend analysis.
Q40. Growth labels each year based on whether the budget increased, decreased, or remained unchanged.
Q42. Highest growth year using CTE	Uses a CTE to identify the strongest year-over-year budget growth.
Q43. Years where growth exceeded 20%	Highlights exceptional periods of budget expansion.
Q44. Top 5 growth years	Identifies the years with the most significant growth rates.
Q45. Years with declining budgets Shows periods where government spending contracted.
Q46. Decade with highest average budget	Identifies the decade with the greatest average government spending.
Q47. Year with highest increase	Shows the year with the largest absolute increase in budget allocation.
Q48. Year with largest decrease	Identifies the year with the greatest budget reduction.
Q49. Budgets above overall average	Highlights years that outperformed the historical average budget.
Q50. Complete summary	Combines key metrics into one comprehensive analytical view for decision-making.

*/