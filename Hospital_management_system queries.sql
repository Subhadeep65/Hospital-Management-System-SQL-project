-- Basic level question 
-- 1)Retrieve all patients whose age is greater than 25.
select * from patients where age >25;
-- 2)List all doctors whose specialization is Cardiology.
select * from doctors where Specialization = "Cardiology";
-- 3)Show all appointments scheduled after 2026-04-12.
select * from appointments where AppointmentDate > "2026-04-12";
-- 4)Find all procedures with cost greater than 3000.
select * from procedures where cost > 3000;
-- 5)Display all billing records for a specific patient (e.g., PatientID = 1).
select* from billing where PatientID = 1;


-- Intermediate Level questions 
-- 1)Show patient names along with their appointment dates.
select p.PatientID,  Name , AppointmentDate from patients p join appointments a on p.PatientID = a.PatientID;
-- 2) List doctor names and the number of appointments they handled.
select d.DoctorID, Name , AppointmentID , AppointmentDate from doctors d join appointments ap on d.DoctorID = ap.DoctorID;
-- 3)Find total revenue generated from all procedures.
select ProcedureID,  sum(cost) as "Total_revenue" from procedures group by ProcedureID;
-- 4)Display patient name, procedure name, and total bill amount
select  Name , ProcedureName, TotalAmount from  patients pa join procedures pro join billing bi  on pa.PatientID = pro.PatientID = bi.PatientID ;
-- 5)Find the average cost of procedures.
SELECT PatientID, AVG(Cost) AS Average_Procedure_Cost
FROM Procedures group by PatientID;
-- 6)Show the number of patients treated by each doctor.
select d.DoctorID , d.Name , count(PatientID) from doctors d join appointments apm on d.DoctorID = apm.DoctorID where apm.Status = "Completed"group by d.DoctorID, d.Name ;
-- 7)List all patients who have never booked an appointment.
select p.PatientID,p.Name from patients p left join appointments ap_t on p.PatientID = ap_t.PatientID where p.PatientID is null;
-- 8)Find the doctor who handled the maximum number of appointments.
select dc.Name , count(apo.AppointmentID) as "Total_apponintment" from doctors dc join appointments apo on dc.DoctorID = apo.DoctorID group by dc.Name, dc.DoctorID order by Total_apponintment desc limit 1;


-- Advanced Level

-- 1)Find the second highest salary among doctors.
Select Name, max(Salary) as "Max salary" from doctors group by Name; 
-- (*  GROUP BY CLAUSE is not applicable here because there have no any kind of similar rows or repeted values are present , here all values are unique for itch rows )

select Name , Salary from doctors where salary> 90000; 
-- 2) Get patients who have spent more than the average billing amount.

SELECT 
    p.PatientID,
    p.Name,
    SUM(b.TotalAmount) AS Total_Spent
FROM Patients p
JOIN Billing b 
    ON p.PatientID = b.PatientID
GROUP BY p.PatientID, p.Name
HAVING SUM(b.TotalAmount) > (
    SELECT AVG(TotalAmount) 
    FROM Billing
);
-- 3)Display cumulative billing amount ordered by bill date.
select BillDate, TotalAmount, 
sum(TotalAmount) as "Cumulative_billing" 
 from billing
 group by BillDate, TotalAmount ;
--  4)Rank doctors based on number of appointments handled.
select d.DoctorId, d.Name,
count(a.AppointmentID) as "Total_appointment",
rank() over(order by count(a.AppointmentID) DESC ) as "Doctor_rank"
from doctors d join appointments a on d.DoctorID = a.DoctorID 
group by d.DoctorId, d.Name;
-- 5)Find procedures that were never used in billing.
select p.ProcedureID, p.ProcedureName 
from procedures p left join 
billing b on p.ProcedureID = b.ProcedureID
 where b.ProcedureID is null;
 


-- Tricky Interview Questions
-- 1)Difference between INNER JOIN and LEFT JOIN with example from this schema.
-- inner join is used join two or more  tables which have atlest one same column , one table column act like foreign key to add multiple tables, and it show all marge table data . 
-- and left joint used to show the null value between two tables in right side , it join two or multiple tables but it show particular null values present in between two tables. 

-- 2)What happens if a foreign key constraint fails?
-- If a foreign key constraint fails, the database rejects the operation (INSERT, UPDATE, or DELETE) to maintain referential integrity and prevent invalid  records.

-- 3)How would you normalize these tables further?
-- Analyze current tables (Patients, Doctors, Appointments, Procedures, Billing)
-- Identify design problems
-- Suggest better structure (split tables, remove duplication, add keys)
-- 4)How to handle NULL values in billing data?
SELECT *
FROM Billing
WHERE TotalAmount IS NOT NULL;
-- NULL values in billing data can be handled using 
--  ISNULL for replacement, filtering using IS NULL/IS NOT NULL,
--  and prevented using NOT NULL constraints. Proper handling ensures accurate financial calculations and reporting."





