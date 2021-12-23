
	/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
	LastName, City ve Address bilgilerini listeleyen sorguyu yazınız*/
	
	SELECT FirstName, LastName, City, Address
	FROM customers
	WHERE FirstName LIKE '____';
	
	
	/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
	LastName ve City bilgilerini listeleyen sorguyu yazınız*/
	SELECT FirstName, LastName, City
	FROM customers
	WHERE LastName like "Sch%" or LastName like "Go%";
	
	--- SESSION - 3  ------------------
	/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	-- invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu
	
	SELECT count(InvoiceId) as fatura_sayısı
	FROM invoices;
	
	
	/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
	SELECT count(DISTINCT  Composer) as besteci_sayısı -- DISTINCT tekrarsızları alıyor..
	FROM tracks;
	
	----------------------  ÖDEV   -----------------------------------
	/* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız, sadece
	yılı çeken fonksiyonlar var.. Google la ve bul..*/
	
	SELECT count(distinct strftime("%Y", "InvoiceDate"))
	from invoices; --yusuf atmış..:))
	
		-- MIN,MAX
	-------------------------------------------------------------------------------------------------	
	/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
	sorguyu yaziniz */
	
	SELECT name as Song_Name, min(Milliseconds) as Duration
	FROM tracks;
	
	
	/* Student tablosunda min ve max değerli*/
	
	SELECT min(Grade), max(Grade)
	FROM tracks;
	
	
	-- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
	SELECT sum(total) toplam_gelir
	from invoices;
	
	-------------------      ÖDEV      ---------------------------------
	/* invoices  tablosunda 2009 ile 2013 tarihileri(tamamı dahil) arasındaki faturaların toplam değerini listeyiniz */
	
	
	/* İnvoices tablosundaki faturalrın ortalama değerini listeleyiniz*/
	SELECT round(avg(total), 4) as ortalama_gelir
	FROM invoices;
	
	
	/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	SELECT round(avg(Milliseconds))
	FROM tracks;
	
	/*BU yöntem hard-coded old. için çok mantıklı bir çözüm değil.
alt-ssorgu(sub-query) ile daha doğru bir yaklaşım olacaktır. 
sonraki bölümlerde alt-sorguyu ayrıntılı şekilde iişleyeceğiz.	*/
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > 393599;
	
	-- ya da: sub-query olarak---
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > (SELECT round(avg(Milliseconds))
	FROM tracks);
	
	--- GROUP BY.. ----
	--- WHERE den sonra kullanılıyor, ORDER BY dan önce kullanılıyor..--
	
	
/*===================================================
 GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
	SELECT Composer, COUNT(name) as song_count
	FROM tracks
	WHERE Composer is NOT NULL
	GROUP BY Composer;
	
	
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	SELECT country, COUNT(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country
	ORDER BY nu_of_cust DESC;
	
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
	SELECT country, City, COUNT(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country, City;
	
	
 	/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
	SELECT BillingCountry, round(avg(total), 2) as ord_fatura
	FROM invoices
	WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31 23:59.59"
	GROUP BY BillingCountry;
	
	
/*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--		JOIN VE CRUD OPERASYONLARI INTERVIEW LERDE SORULUYOR...!!!

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
--       DEFAULT U INNER JOIN DİR.. YAZILMAZSA INNER JOIN ÇALIŞIR..!!
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 SELECT markalar.marka_id, markalar.marka_adi,
 siparisler.siparis_adedi, siparisler.siparis_tarihi
 FROM markalar
 JOIN siparisler
 on markalar.marka_id = siparisler.marka_id;
 
 
 
 
 
 
	