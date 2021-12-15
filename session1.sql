--SELECT name FROM tracks;
--SELECT Composer, name FROM tracks;
--SELECT * FROM tracks;
--SELECT DISTINCT Composer FROM tracks;
--SELECT DISTINCT AlbumId, MediaTypeId from tracks;
--SELECT name
--FROM tracks 
--WHERE Composer = "Jimi Hendrix"
-- SELECT * 
-- FROM invoices
-- WHERE total > 10;

/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtları Total değerine göre 
ARTAN sırada sıralayarak sorgulayiniz */
SELECT * FROM invoices WHERE total > 10 ORDER BY total ASC;
/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
	(InvoiceDate) 	en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 
SELECT * FROM invoices WHERE total > 10 ORDER BY InvoiceDate DESC LIMIT 10;


