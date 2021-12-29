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
 
 /*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
	/*------------------------------------------------------------------------------------------
	/*  CREATE TABLE
	/*------------------------------------------------------------------------------------------
	
	/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
	age(INT) ve hire_date (Date) sutunuları bulunmalıdır.
	*/
	
	CREATE TABLE personel (   --ikinci defa çalıştırınca hata veriyor--
	first_name VARCHAR(20),
	last_name TEXT,	
	age INT,
	hire_date DATE
	);
 
 /* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir. Bu hatayı
	almamak için IF NOT EXISTS keywordu kullanılabilir */
	CREATE TABLE IF NOT EXISTS  personel (
		first_name VARCHAR(20),--max karakter sayısı--
		last_name VARCHAR(20),
		age INT,
		hire_date DATE
	);
 
 /*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
	place_id, country, hotel_name, employee_id, vacation_length,budget 	*/
	CREATE TABLE vacation_plan (
		place_id INTEGER,
		country TEXT,
		hotel_name TEXT,
		employee_id INTEGER,
		vacation_length INT,
		bugdet REAL
		);
 
 --silmek istersek:
 /*------------------------------------------------------------------------------------------
	/*  DROP TABLE
	/*------------------------------------------------------------------------------------------
	/* personel tablosunu siliniz */
	DROP TABLE personel; --aynı komutu tekrar çalıştırnca yok ki diyor.. if exist kullanılabilir bu uyarıyı görmemk için
	
	DROP TABLE if	EXISTS personel;
 
 /* Bir tabloyu silerken tablo bulunamazsa hata verir. BU hatayı görememek için
	IF EXISTS keywordu kullanılabilir.*/
	DROP TABLE IF EXISTS personel;
 
 -- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite bu komutu 
	-- desteklememektedir. Truncate komutu  bir tabloyu değil içindeki tüm verileri 
	-- silmek için kullanılır.
 
 /*------------------------------------------------------------------------------------------
	/*  INSERT INTO
	/*----------------------------------------------------------------------------------------*/

	/* vacation_plan tablosuna 2 kayıt gerçekletiriniz.*/
	INSERT INTO vacation_plan VALUES(); -- sırasına göre hatasız girilmeli.. yoksa hata verir..
 
	INSERT INTO vacation_plan VALUES(48, "TR", "HAPPY HOTEL", 1, 7, 4500);
 
	INSERT INTO vacation_plan VALUES(34, "TR", "BEACH HOTEL", 2, 10, 5000);
	INSERT INTO vacation_plan VALUES(12, "NL", "COMFORT HOTEL", 3, 4, 3000);
 
 -- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
	-- tekrar tabloya girilmiş olur. 
	
	/*vacation_plan tablosuna vacation_lenght ve budget sutunlarını eksik olarak veri girişi 
	yapınız*/ --PARÇALI GİRİŞ ÖRNEĞİ..
	INSERT INTO vacation_plan (place_id,country,hotel_name,employee_id) VALUES (35, "TR", "İZMİR HOTEL",6);
	-- NOT : giriş yapılmayan sutunlara NULL atanır.
	
	/*------------------------------------------------------------------------------------------
	/*  CONSTRAINTS - KISITLAMALAR 
	/*-----------------------------------------------------------------------------------------

	NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

    UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

    FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 

    DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağlar.
	/*----------------------------------------------------------------------------------------*/
	
	CREATE TABLE workers (
		id INT PRIMARY KEY,
		id_number VARCHAR(11) UNIQUE NOT NULL,
		name TEXT DEFAULT "NONAME",
		salary INT NOT NULL
		);
		
	INSERT INTO workers VALUES(1, '12345678910','AHMET CAN', 7000 );
	INSERT INTO workers VALUES( 2, '12345678910', 'MUSTAFA ALİ', 12000);  -- HATA (UNIQUE)
	INSERT INTO workers  (id,	id_number, salary) VALUES(3, '12345223465', 5000);
	INSERT INTO workers VALUES(4, '44343323465' , 'AYHAN BAK',NULL) -- HATA (NOT NULL)
		
	/*vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu ise FK olarak  değiştirirek
vacation_plan2 adinda yeni bir tablo oluşturunuz. Bu tablo, employees tablosu ile ilişkili olmalıdır*/ 
	
	CREATE TABLE vacation_plan2 (
		id INT,
		place_id INTEGER,
		country TEXT,
		hotel_name TEXT,
		employee_id INTEGER, --FOREİGN KEY diğer tabloda Primary olma zorunluğu var SQLite da--
		vacation_length INT,
		bugdet REAL,
		PRIMARY KEY (id),
		FOREIGN KEY (employee_id) REFERENCES employees(EmployeeId)			
		);
	
	/* Employees tablosundaki EmployeeId'si 1 olan kişi için bir tatil planı giriniz.*/
	INSERT INTO vacation_plan2 VALUES(1, 34, "TR", "HAPPY HOTEL", 1, 5, 5660);
	
	/* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) olan kişi için bir tatil planı giriniz.*/
	INSERT INTO vacation_plan2 VALUES(2, 48,'TR','COMFORT HOTEL',9,10,7000);  --HATA, 9 no lu EmployeeId yok çünkü--
	
	INSERT INTO vacation_plan2 VALUES(3, 48, "TR", "COMFORT HOTEL", 8, 5, 5000);
	
	/*JOIN işlemi ile 2 tablodan veri çekme*/
	SELECT e.FirstName,e.LastName,v.hotel_name, v.vacation_length
	FROM employees e
	JOIN vacation_plan2 v
	ON e.EmployeeId=v.employee_id;
	
	/*------------------------------------------------------------------------------------------
	/*  ALTER TABLE (ADD, RENAME TO, DROP)
	/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
	/*------------------------------------------------------------------------------------------
	
	/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
	yeni bir sutun ekleyelim */
	ALTER TABLE vacation_plan2
	ADD name TEXT DEFAULT "isimsiz";
	
	/*vacation_plan2 tablosundaki name sutununu siliniz */
	ALTER TABLE vacation_plan2
	DROP COLUMN name;
	
	/* workers tablosunun adını people olarak değiştiriniz */
	ALTER TABLE workers
	RENAME TO people;
	
	/*------------------------------------------------------------------------------------------
	/*  UPDATE,DELETE
		-- SYNTAX
		----------
		-- UPDATE tablo_adı
		-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
		-- WHERE koşul;
		
		--DELETE tablo_adı
		--WHERE koşul;
   /*-----------------------------------------------------------------------------------------*/
   
   /*vacation_plan2 tablosundaki employee_id=1 olan kaydin  hotel_name'ini Komagene Hotel olarak
   güncelleyiniz.*/
	UPDATE vacation_plan2
	SET hotel_name = "komagene hotel"
	WHERE employee_id = 1;
	
	/* people tablosunda salary sutunu 5000 'den fazla olanların salary(maaşına)
   %10 zam yapacak sorguyu yazınız*/
	UPDATE people
	SET salary * 1.1
	WHERE salary > 5000;
	
	/* people tablosunda salary sutunu 7000 'den az olanların salary(maaşına)
   %10 zam yapacak sorguyu yazınız*/ 
   
   UPDATE people
   SET salary = salary*1.2
   WHERE salary < 7000;
	
	/*people tablosundaki tüm kayıtkarın salary sutununu 10000 olarak güncelleyiniz */
   UPDATE people
   SET salary=10000;
   
   /*vacation_plan2 tablosundaki employee_id=1 olan kaydı siliniz*/
   DELETE FROM vacation_plan2
   WHERE employee_id=1;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
 
 
 
 
 