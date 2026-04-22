create database project;
use project;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Salary decimal(10,2)
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(50)
 
);
CREATE TABLE Procedures (
    ProcedureID INT PRIMARY KEY,
    ProcedureName VARCHAR(100),
    Cost decimal(10,2)
);
CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    PatientID INT,
    ProcedureID INT,
    TotalAmount decimal(11,2),
    BillDate DATE
   
);

insert into patients values ( 1 , "Rahul " , 24, "Male", "9748563248", "Bankura"),
(2, "Sudip" ,27 , "Male","9874563288", "Purulia"),
(3, "Sibam", 30 , "Male", "9754218347", "Mednipur"),
(4,"Keya", 26 , "Female" , "9745632589" , "Durgapur"),
(5, "Papiya", 24, "Female", "9324476724", "Birbhum");

INSERT INTO Doctors (DoctorID, Name, Specialization, Phone, Salary) VALUES
(1, 'Dr. Amit Sharma', 'Cardiology', '9876543210', 90000.00),
(2, 'Dr. Priya Verma', 'Neurology', '9123456789', 95000.00),
(3, 'Dr. Rajesh Kumar', 'Orthopedics', '9988776655', 85000.00),
(4, 'Dr. Sneha Gupta', 'Pediatrics', '9871234567', 80000.00),
(5, 'Dr. Anil Mehta', 'Dermatology', '9765432109', 75000.00);

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 5, 5, '2026-04-10', 'Completed'),
(2, 3, 2, '2026-04-12', 'Completed'),
(3, 1, 4, '2026-04-15', 'Scheduled'),
(4, 2, 3, '2026-04-16', 'Cancelled'),
(5, 4, 1, '2026-04-18', 'Completed');
INSERT INTO Procedures (ProcedureID, ProcedureName, Cost) VALUES
(1, 'General Checkup', 500.00),
(2, 'Blood Test', 800.00),
(3, 'X-Ray', 1500.00),
(4, 'MRI Scan', 5000.00),
(5, 'Heart Surgery', 150000.00);
INSERT INTO Billing (BillID, PatientID, ProcedureID, TotalAmount, BillDate) VALUES
(1, 1, 1, 500.00, '2026-04-10'),
(2, 2, 2, 1500.00, '2026-04-12'),
(3, 3, 4, 900.00, '2026-04-15'),
(4, 4, 3, 2000.00, '2026-04-16'),
(5, 5, 5, 150000.00, '2026-04-18');