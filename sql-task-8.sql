DROP DATABASE IF EXISTS CUSTOMERS;
CREATE DATABASE CUSTOMERS;
USE CUSTOMERS;
 
 -- Stored procedure with conditional logic(IF)
-- ✅ Stored Procedure: Adds a student only if age is above 10
-- 🎯 Purpose: Prevents registration of underage students
-- 📥 Parameters: studentName, studentAge, studentGrade
-- 🧠 Logic: Uses IF condition to validate age before inserting
-- 📤 Output: Inserts student or returns message if too young

 CREATE TABLE Customer_info(
CustomerID INT PRIMARY KEY,
Name VARCHAR(100),
Age INT,
Items INT 
);

DELIMITER // -- DELIMITER is used to define custom end markers for multi-statement blocks like procedures and functions
			 -- It tells SQL to wait until it sees '//' instead of ';' before ending the whole block
			 -- 🧠 Needed when writing procedures or functions that use many semicolons inside

CREATE PROCEDURE ADDCustomer(
IN CusID INT,
IN CustomerName VARCHAR(100),
IN CustomerAge INT,
IN CustomerItems INT
) 
BEGIN 
    IF CustomerItems > 1 THEN 
     INSERT INTO Customer_info (CustomerID, Name, Age, Items )
     VALUES (CusID, CustomerName, CustomerAge, CustomerItems);
    ELSE
       SELECT 'Minimum required amount of items not selected';
	END IF;
    
    SELECT * FROM Customer_info;
END //
DELIMITER ;

CALL ADDCustomer(101, 'Walt', 45, 3);
CALL ADDCustomer(102, 'John', 30, 1);
CALL ADDCustomer(105, 'Skylar', 28, 5);


-- Using the same database for Creating a Function
CREATE TABLE exam_results (
    student_id INT,
    name VARCHAR(100),
    marks INT
);

INSERT INTO exam_results VALUES
(1, 'Rehan', 75),
(2, 'Faizan', 48),
(3, 'Arjun', 60);

DELIMITER //
CREATE FUNCTION GetGradeStatus(marks INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(10);

    IF marks >= 50 THEN
        SET status = 'Pass';
    ELSE
        SET status = 'Fail';
    END IF;
    RETURN status;
     
END //
DELIMITER ;

SELECT name, marks, GetGradeStatus(marks) AS grade_status
FROM exam_results;

 


