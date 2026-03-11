# KINDLY NAME YOUR TABLE TO hr_attrition_employee so this code can work perfectly

-- 1. Average Monthly Income by Job Role
SELECT JobRole, AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM hr_attrition_employee
GROUP BY JobRole;

-- 2. Employee count per Department
SELECT Department, COUNT(*) AS EmployeeCount
FROM hr_attrition_employee
GROUP BY Department;

-- 3. Count of employees working overtime vs not
SELECT OverTime, COUNT(*) AS CountEmployees
FROM hr_attrition_employee
GROUP BY OverTime;

-- 4. Average DistanceFromHome of employees who left
SELECT AVG(DistanceFromHome) AS AvgDistance
FROM hr_attrition_employee
WHERE Attrition = 'Yes';

-- 5. Highest and lowest DailyRate per BusinessTravel
SELECT BusinessTravel,
       MAX(DailyRate) AS MaxDailyRate,
       MIN(DailyRate) AS MinDailyRate
FROM hr_attrition_employee
GROUP BY BusinessTravel;



-- GROUPED ANALYSIS
-- 1. Average YearsAtCompany per MaritalStatus and Gender
SELECT MaritalStatus, Gender, AVG(YearsAtCompany) AS AvgYears
FROM hr_attrition_employee
GROUP BY MaritalStatus, Gender;

-- 2. Average TotalWorkingYears by EducationField
SELECT EducationField, AVG(TotalWorkingYears) AS AvgWorkingYears
FROM hr_attrition_employee
GROUP BY EducationField;

-- 3. Total employees per JobLevel and WorkLifeBalance
SELECT JobLevel, WorkLifeBalance, COUNT(*) AS EmployeeCount
FROM hr_attrition_employee
GROUP BY JobLevel, WorkLifeBalance;

-- 4. Average PercentSalaryHike per PerformanceRating
SELECT PerformanceRating, AVG(PercentSalaryHike) AS AvgHike
FROM hr_attrition_employee
GROUP BY PerformanceRating;

-- 5. Total Monthly Income of employees with StockOptionLevel > 0 grouped by Department
SELECT Department, SUM(MonthlyIncome) AS TotalIncome
FROM hr_attrition_employee
WHERE StockOptionLevel > 0
GROUP BY Department;


-- FILTERED QUERY
-- 1. Employees with >10 YearsAtCompany and never promoted
SELECT *
FROM hr_attrition_employee
WHERE YearsAtCompany > 10 AND YearsSinceLastPromotion = 0;

-- 2. Employees with >3 TrainingTimesLastYear and WorkLifeBalance < 2
SELECT *
FROM hr_attrition_employee
WHERE TrainingTimesLastYear > 3 AND WorkLifeBalance < 2;

-- 3. Employees with JobSatisfaction < 3 in Sales or R&D
SELECT *
FROM hr_attrition_employee
WHERE JobSatisfaction < 3 AND Department IN ('Sales', 'Research & Development');

-- 4. Employees earning more than average MonthlyIncome
SELECT *
FROM hr_attrition_employee
WHERE MonthlyIncome > (SELECT AVG(MonthlyIncome) FROM hr_attrition_employee);


-- Trends and Insights
-- 1. Correlation between JobInvolvement and PerformanceRating (via averages)
SELECT JobInvolvement, AVG(PerformanceRating) AS AvgPerformance
FROM hr_attrition_employee
GROUP BY JobInvolvement;

-- 2. EducationField with highest average EnvironmentSatisfaction
SELECT EducationField, AVG(EnvironmentSatisfaction) AS AvgSatisfaction
FROM hr_attrition_employee
GROUP BY EducationField
ORDER BY AvgSatisfaction DESC
LIMIT 1;

-- 3. Attrition distribution by Age group
SELECT CASE
         WHEN Age < 30 THEN '<30'
         WHEN Age BETWEEN 30 AND 50 THEN '30-50'
         ELSE '>50'
       END AS AgeGroup,
       COUNT(*) AS AttritionCount
FROM hr_attrition_employee
WHERE Attrition = 'Yes'
GROUP BY AgeGroup;

-- 4. Compare frequent vs rare travelers and YearsWithCurrManager
SELECT BusinessTravel, AVG(YearsWithCurrManager) AS AvgYearsManager
FROM hr_attrition_employee
WHERE BusinessTravel IN ('Travel_Frequently', 'Travel_Rarely')
GROUP BY BusinessTravel;

-- 5. Average HourlyRate for employees who changed companies >2 times
SELECT AVG(HourlyRate) AS AvgHourlyRate
FROM hr_attrition_employee
WHERE NumCompaniesWorked > 2;


-- Advance SUBQUERY
-- Top 5 highest earners with JobRoles and Departments
SELECT EmployeeID, JobRole, Department, MonthlyIncome
FROM hr_attrition_employee
ORDER BY MonthlyIncome DESC
LIMIT 5;

