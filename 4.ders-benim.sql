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
 
 
	SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
	FROM markalar m
	INNER JOIN siparisler s
	on m.marka_id = s.marka_id; 
 
 
	SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
	FROM markalar m
	LEFT JOIN siparisler s
	on m.marka_id = s.marka_id; -- null lar da geldi, left yaptık çünkü.. inner kesişim veriyor.. 
 
 /* ÖDEV: Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz.*/

	SELECT * FROM tracks;
	SELECT * FROM genres;

	SELECT t.name as song_name, g.name as song_genre
	FROM tracks t
	JOIN genres g
	on t.GenreId = g.GenreId;
	
	
	
 /* ÖDEV: invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 
	SELECT * FROM invoices;
	SELECT * FROM customers;
	
	SELECT c.FirstName, c.LastName, i.InvoiceDate, i.total
	FROM customers c
	JOIN invoices i
	ON  i.CustomerId = c.CustomerId;
	
	
	
	/* ÖDEV: artists tablosunda bulunan her bir kişinin albums tablosunda 
bulunan tüm albümlerinin listeleyen sorguyu yazınız. 
Sorguda ArtistId, Name, Title ve AlbumId olmalıdır */
 
	SELECT ar.ArtistId, ar.name, al.Title, al.AlbumId
	FROM artists ar 
	LEFT JOIN albums al
	ON ar.ArtistId = al.ArtistId;

/*===================================================
 SUBQUERIES
====================================================*/

	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */

	SELECT TrackId, name, AlbumId
	FROM tracks
	WHERE AlbumId =(
	SELECT AlbumId
	FROM albums
	WHERE Title = "Faceless");
	
  -- join le yapalım:
  
 SELECT t.TrackId, t.name, t.AlbumId
 FROM tracks t
 JOIN albums a
 ON t.AlbumId = a.AlbumId
 WHERE a.Title = "Faceless";
 
 
	/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
	albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
	SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */			
 
	SELECT TrackId, name, AlbumId
	FROM tracks
	WHERE AlbumId IN(
	SELECT AlbumId
	FROM albums
	WHERE Title = "Faceless" OR Title = "Let There Be Rock");
 
 
 
	SELECT TrackId, name, AlbumId
	FROM tracks
	WHERE AlbumId IN(
	SELECT AlbumId
	FROM albums
	WHERE Title IN( "Faceless" , "Let There Be Rock"));
 
 
 
 
 
 
 
 
 
 
 