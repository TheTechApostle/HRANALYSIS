# HR Employee Attrition SQL and Python Project

## 📌 Overview
This project analyzes employee attrition data using SQL queries.  
The dataset is stored in a table called **`hr_attrition_employee`**, which contains information about employees such as demographics, job details, compensation, and attrition status.  

The goal of this project is to practice **SQL for data analysis** by answering real-world HR questions.

---

## 🗂️ Table: `hr_attrition_employee`

### Columns
- **EmployeeID** – Unique identifier for each employee  
- **Age** – Employee age  
- **Gender** – Male/Female  
- **MaritalStatus** – Single, Married, Divorced  
- **Department** – Sales, HR, Research & Development, etc.  
- **JobRole** – Specific job title  
- **JobLevel** – Level of seniority  
- **MonthlyIncome** – Salary per month  
- **DailyRate** – Daily pay rate  
- **HourlyRate** – Hourly pay rate  
- **DistanceFromHome** – Distance between home and office  
- **YearsAtCompany** – Tenure at the company  
- **YearsSinceLastPromotion** – Time since last promotion  
- **NumCompaniesWorked** – Number of companies worked before  
- **WorkLifeBalance** – Rating (1–4)  
- **JobSatisfaction** – Rating (1–4)  
- **PerformanceRating** – Rating (1–4)  
- **PercentSalaryHike** – Percentage increase in salary  
- **StockOptionLevel** – Stock option level (0–3)  
- **TrainingTimesLastYear** – Number of training sessions attended  
- **BusinessTravel** – Travel frequency (Rarely, Frequently, Non-Travel)  
- **EducationField** – Field of study  
- **EnvironmentSatisfaction** – Rating (1–4)  
- **Attrition** – Whether the employee left (`Yes`/`No`)  
- **YearsWithCurrManager** – Years with current manager  
- **JobInvolvement** – Rating (1–4)

---

## 🔎 Analyses Performed

### 1. Basic Analysis
- Average Monthly Income by Job Role  
- Employee count per Department  
- Overtime vs Non-overtime employee counts  
- Average DistanceFromHome of employees who left  
- Highest and lowest DailyRate per BusinessTravel category  

### 2. Grouped Analysis
- Average YearsAtCompany by MaritalStatus and Gender  
- Average TotalWorkingYears by EducationField  
- Employee count per JobLevel and WorkLifeBalance  
- Average PercentSalaryHike per PerformanceRating  
- Total Monthly Income of employees with StockOptionLevel > 0 grouped by Department  

### 3. Filtered Queries
- Employees with >10 YearsAtCompany and no promotions  
- Employees with >3 trainings and poor WorkLifeBalance  
- Employees with low JobSatisfaction in Sales or R&D  
- Employees earning more than average MonthlyIncome  

### 4. Trends & Insights
- Correlation between JobInvolvement and PerformanceRating  
- EducationField with highest EnvironmentSatisfaction  
- Attrition distribution by Age group (<30, 30–50, >50)  
- Frequent vs Rare travelers and YearsWithCurrManager  
- Average HourlyRate for employees who changed companies >2 times  

### 5. Advanced Subqueries
- Top 5 highest earners with JobRoles and Departments  

---

## ⚙️ How to Run
1. Import the dataset into your SQL environment (e.g., MySQL, PostgreSQL, SQL Server).  
2. Ensure the table name is **`hr_attrition_employee`**.  
3. Run the queries provided in the `queries.sql` file (or directly from this README).  
4. Capture screenshots of both **query and result** for submission.  

---

## 📊 Example Query
```sql
-- Average Monthly Income by Job Role
SELECT JobRole, AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM hr_attrition_employee
GROUP BY JobRole;
