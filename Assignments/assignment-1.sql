--1.
	SELECT InvoiceId, CustomerId, Total
	FROM invoices
	ORDER BY CustomerId ASC , Total DESC;
	
--2.
	SELECT InvoiceId, Total, CustomerId
	FROM invoices
	ORDER BY Total DESC, CustomerId ASC;
	
--3.
	/* these two queries gave us a different results by looking at the different values.. first query gives us the values that have CustomerId in Ascendigng order so 
	all InvoiceId and their Total amount of dolar are ordered by these queries.. the second query is like that..*/
	
	
--4.
	SELECT *
	FROM invoices
	WHERE Total >= 10
	LIMIT 10;
	
--5.
	SELECT *
	FROM invoices
	WHERE Total < 10
	LIMIT 5;
	
--6.
	SELECT Name
	FROM tracks
	WHERE Name like  "B%s";
	
--7.
	SELECT *
	FROM invoices
	WHERE BillingCountry IN ("USA", "Germany", "Norway", "Canada")
	and InvoiceDate BETWEEN "2010-01-01 00:00.00" AND "2010-12-31 23:59.59"
	ORDER BY InvoiceDate DESC;
	
	
	
	
	
	
	