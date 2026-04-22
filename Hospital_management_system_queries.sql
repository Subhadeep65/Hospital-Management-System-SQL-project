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
