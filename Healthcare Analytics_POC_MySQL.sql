create database healthcare;
use healthcare;

-- Total Patient
select count(patient_id) as Count_Of_Patient from patient_cleaned1;

-- Total Doctor
select count(Doctor_id) as Count_Of_Doctor from doctor;

-- Total Visit
select count(Visit_ID) as "Total Visit" from visit;

-- Avg Age of Patient
SELECT CEIL(AVG(Age)) AS "avg age of Patients"
FROM patient_cleaned1;

-- Treatment Cost per Visit
select avg(`Treatment Cost`) from treatment;

-- sum of Revenue
SELECT SUM(CAST(`Treatment Cost` AS UNSIGNED)) AS Revenue
FROM treatment;

-- Total lab test Conducted
select count(Result_id) as Total_Lab_Conducted from `lab results`;


-- Follow up Required 
SELECT `Follow-up Required`, COUNT(*) AS Count
FROM visit
WHERE `Follow-up Required` IN ("Yes", "No")
GROUP BY `Follow-up Required`;

-- Top 5 Diagnosed condition
SELECT Diagnosis, COUNT(*) AS count
FROM visit
GROUP BY Diagnosis
ORDER BY count DESC
LIMIT 5;

-- Abnormal Lab Result
select `Normal Range` from `lab results`;
select Result ,count(*) as Count from `lab results` group by Result;

-- Doctor Workload
SELECT  
  (SELECT COUNT(patient_id) FROM patient_cleaned1)  / 
  (SELECT COUNT(Doctor_id) FROM doctor)  AS Doctor_workload;


