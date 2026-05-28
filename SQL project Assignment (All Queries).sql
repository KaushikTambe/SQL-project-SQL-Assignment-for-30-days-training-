30 Days SQL Micro Course Assignment
-- 1. Total Number of Patients
-- Write an SQL query to find the total number of patients across all hospitals. SELECT SUM(patients_count) AS Total_Patients FROM hospital_data;
-- 2. Average Number of Doctors per Hospital
-- Retrieve the average count of doctors available in each hospital.

SELECT hospital_name, AVG(doctors_count) AS average_doctors_per_hospital FROM hospital_data
GROUP BY hospital_name;


-- 3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.

SELECT department, SUM(patients_count) AS Total_Patients FROM hospital_data
GROUP BY department
ORDER BY total_patients DESC LIMIT 3;

-- 4. Hospital with the Maximum Medical Expenses
-- Identify the hospital that recorded the highest medical expenses.

SELECT hospital_name, SUM(medical_expenses) AS Total_Expenses FROM hospital_data
GROUP BY hospital_name ORDER BY Total_Expenses DESC LIMIT 1;

-- 5. Daily Average Medical Expenses
-- Calculate the average medical expenses per day for each hospital.

SELECT hospital_name,
AVG(medical_expenses / (discharge_date - admission_date)) AS Daily_Avg_Expense
FROM hospital_data GROUP BY hospital_name;
 
-- 6. Longest Hospital Stay
-- Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

SELECT *, DATEDIFF(discharge_date, admission_date) AS stay_length FROM hospital_data
ORDER BY stay_length DESC LIMIT 1;

-- 7. Total Patients Treated Per City
-- Count the total number of patients treated in each city.

SELECT location AS city, SUM(patients_count) AS Total_Patients FROM hospital_data
GROUP BY location;

-- 8. Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department.

SELECT department,
AVG(discharge_date - admission_date) AS avg_stay_days FROM hospital_data
GROUP BY department;


-- 9. Identify the Department with the Lowest Number of Patients
-- Find the department with the least number of patients.

SELECT department, SUM(patients_count) AS Total_Patients FROM hospital_data
GROUP BY department ORDER BY Total_Patients ASC LIMIT 1;
 
-- 10. Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.

SELECT TO_CHAR(admission_date, 'YYYY-MM') AS month, SUM(medical_expenses) AS total_expenses
FROM hospital_data GROUP BY month ORDER BY month;
