# SQL Developer Internship - Task 8

This repository contains the solution for **Task 8: Stored Procedures and Functions** from the SQL Developer Internship program.

---

## 📝 Task Overview
**Objective:** Learn to create and use reusable SQL blocks using **Stored Procedures** and **Functions**.  

**Tools Used:**  
- MySQL Workbench  

**Deliverables:**  
- One stored procedure demonstrating conditional logic  
- One SQL function for grade evaluation  

---

## 📂 Files in this Repository
- **sql-task-8.sql** → SQL script containing table setup, sample data, Stored procedure and Creating Functions workaround.
- **Task Screenshot** → Reference error output and stored procedure and funtions behavior.

---

## 🗂️ Database & Tables:

The task uses a custom database named **CUSTOMERS** with two tables:  
1. **Customer_info** – For testing stored procedures  
2. **exam_results** – For testing functions  

```sql
DROP DATABASE IF EXISTS CUSTOMERS;
CREATE DATABASE CUSTOMERS;
USE CUSTOMERS;
```
```sql
CREATE TABLE Customer_info(
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(100),
  Age INT,
  Items INT
);

 CREATE TABLE exam_results (
    student_id INT,
    name VARCHAR(100),
    marks INT
);
```

## 📥 Sample Data:
```sql
CALL ADDCustomer(101, 'Walt', 45, 3);
CALL ADDCustomer(102, 'John', 30, 1);
CALL ADDCustomer(105, 'Skylar', 28, 5);

INSERT INTO exam_results VALUES
(1, 'Rehan', 75),
(2, 'Faizan', 48),
(3, 'Arjun', 60);
```

---

💻 SQL Code - Implemented Stored Procedures and Functions Queries with Screenshots:

🔹 1. Stored Procedure – ADDCustomer 

```sql
-- Stored Procedure: Adds a customer only if they purchased more than 1 item.
-- 🎯 Purpose: Prevents insertion of customers with insufficient items.
-- 📥 Parameters: CusID, CustomerName, CustomerAge, CustomerItems.
-- 🧠 Logic: Uses IF condition to validate before inserting.

DELIMITER //
CREATE PROCEDURE ADDCustomer(
  IN CusID INT,
  IN CustomerName VARCHAR(100),
  IN CustomerAge INT,
  IN CustomerItems INT
) 
BEGIN 
    IF CustomerItems > 1 THEN 
        INSERT INTO Customer_info (CustomerID, Name, Age, Items)
        VALUES (CusID, CustomerName, CustomerAge, CustomerItems);
    ELSE
        SELECT 'Minimum required amount of items not selected';
    END IF;
    
    SELECT * FROM Customer_info;
END //
DELIMITER ;

-- Procedure Calls
CALL ADDCustomer(101, 'Walt', 45, 3);
CALL ADDCustomer(102, 'John', 30, 1);
CALL ADDCustomer(105, 'Skylar', 28, 5);
```
**Without Conditional Logic**

<img src= "https://github.com/user-attachments/assets/f13a40c2-3978-469e-8286-82245cb6b789" width="35%" />
<img src= "https://github.com/user-attachments/assets/27874bc5-c336-4532-bc2c-0cfff5905882" width="45%" />

**With Conditional Logic Result**

<img src= "https://github.com/user-attachments/assets/f84fc18f-4e20-48ff-bdcc-6b7c3db61511" width="35%" />
<img src= "https://github.com/user-attachments/assets/6130b847-39fd-4910-9f0e-adf985faccb2" width="30%" />
<img src= "https://github.com/user-attachments/assets/a8cd2a51-b4a5-406c-a6f3-dcf64823ff25" width="30%" />

🔹 2. Function – GetGradeStatus
```sql
-- Function: Returns 'Pass' or 'Fail' based on marks.
-- 🎯 Purpose: Demonstrates conditional logic inside SQL functions.
-- 📥 Parameter: marks (INT)
-- 📤 Output: 'Pass' if marks >= 50 else 'Fail'

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

-- Use Function to Evaluate Grades
SELECT name, marks, GetGradeStatus(marks) AS grade_status
FROM exam_results;
```
<img src= "https://github.com/user-attachments/assets/7cc4349d-d580-4d0d-91ce-b30b26514933" width="45%" />
<img src= "https://github.com/user-attachments/assets/70c1aa08-3f73-4415-befd-0f35737b0853" width="45%" />

---

## 📌 Key Learnings
- Stored Procedures modularize SQL logic and allow reusability.
- Functions simplify conditional logic and computations within queries.
- Both can use parameters, variables, and IF conditions.
- Help maintain cleaner and more maintainable SQL codebases.
 
---

✅ **Completed Task 8: Stored Procedures and Functions **
