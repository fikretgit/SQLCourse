	--Single-Row Subqueries:
	--1. 
	SELECT TrackId, Name, Milliseconds,
	max(Milliseconds) as Max_Duration
	FROM tracks;
	
	--2. 
	SELECT TrackId, Name, Milliseconds,
	min(Milliseconds) as Max_Duration
	FROM tracks;
	
	--3.
	SELECT TrackId, Name, Bytes, (SELECT round(avg(Bytes), 2) FROM tracks) as General_Average
	FROM tracks
	WHERE Bytes > (
	SELECT round(avg(Bytes), 2)
	FROM tracks)
	ORDER BY Bytes DESC;
	
	--Multiple - Row Subqueries:
	--1.
	SELECT CustomerId, FirstName, LastName
	FROM customers
	WHERE SupportRepId IN (
	SELECT EmployeeId 
	FROM employees
	WHERE EmployeeId = "3" or EmployeeId = "4");
	
	
	--2. 
	SELECT c.CustomerId, c.FirstName, c.LastName
	FROM customers c
	JOIN employees e
	ON c.SupportRepId = e.EmployeeId
	WHERE (SupportRepId = "3" or SupportRepId = "4");
	
	
	--DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements
	--1.
	CREATE TABLE courses (
	CourseId INTEGER,
	CourseName TEXT NOT NULL,
	EmployeeId INTEGER,
	CoursePrice INTEGER,
	PRIMARY KEY (CourseId),
	FOREIGN KEY (EmployeeId) REFERENCES employees (EmployeeId)
	);
	
	--2.
	INSERT INTO courses VALUES (10, "Marketing", 1, 1000);
	INSERT INTO courses VALUES (20, "Packaging", 3, 1500);
	INSERT INTO courses VALUES (30, "Cold_Storage", 5, 1750);
	INSERT INTO courses VALUES (40, "Transport", 7, 2000);
	INSERT INTO courses VALUES (50, "Sales", 8, 2500);
	
	--3.
	DELETE FROM courses
	WHERE EmployeeId = "8";
	
	--4.
	ALTER TABLE courses
	ADD StartDate date DEFAULT "00-00-00";
	
	--5.
	ALTER TABLE courses
	DROP COLUMN CoursePrice;
	
	--6.
	DROP TABLE courses;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	