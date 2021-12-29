--1.
	CREATE TABLE bolumler (
		bolum_id INT,
		bolum_isim TEXT,
		konum TEXT,
		PRIMARY KEY (bolum_id)
		);

	INSERT INTO bolumler VALUES(10, "MUHASEBE", "IST");
	INSERT INTO bolumler VALUES(20, "MUDURLUK", "ANKARA");
	INSERT INTO bolumler VALUES(30, "SATIS", "IZMIR");
	INSERT INTO bolumler VALUES(40, "ISLETME", "BURSA");
	INSERT INTO bolumler VALUES(50, "DEPO", "YOZGAT");


--2.
	CREATE TABLE Personel (
		personel_id INT,
		personel_isim TEXT,
		meslek TEXT,
		mudur_id INT,
		ise_baslama date,
		maas REAL,
		bolum_id INT,
		PRIMARY KEY (personel_id),
		FOREIGN KEY (bolum_id) REFERENCES bolumler(bolum_id)
		);

	INSERT INTO Personel VALUES(7369, "AHMET", "KATIP", 7902, "17.12.1980", 800.0, 20);
	INSERT INTO Personel VALUES(7499, "BAHATTIN", "SATIS", 7698, "20.02.1981", 1600.0, 30);
	INSERT INTO Personel VALUES(7521, "NESE", "SATIS", 7698, "22.02.1981", 1250.0, 30);
	INSERT INTO Personel VALUES(7566, "MUZAFFER", "MUDUR", 7839, "2.04.1981", 2975.0, 20);
	INSERT INTO Personel VALUES(7654, "MUHAMMET", "SATIS", 7698, "28.09.1981", 1250.0, 30);
	INSERT INTO Personel VALUES(7698, "EMINE", "MUDUR", 7839, "1.05.1981", 2850.0, 30);	
	INSERT INTO Personel VALUES(7782, "HARUN", "MUDUR", 7839, "9.06.1981", 2450.0, 10);
	INSERT INTO Personel VALUES(7788, "MESUT", "ANALIST", 7566, "13.07.1987", 3000.0, 20);
	INSERT INTO Personel VALUES(7839, "SEHER", "BASKAN", "", "17.11.1981", 5000.0, 10);
	INSERT INTO Personel VALUES(7844, "DUYGU", "SATIS", 7698, "8.09.1981", 1500.0, 30);
	INSERT INTO Personel VALUES(7876, "ALI", "KATIP", 7788, "13.07.1987", 1100.0, 20);
	INSERT INTO Personel VALUES(7900, "MERVE", "KATIP", 7698, "3.12.1981", 950.0, 30);
	INSERT INTO Personel VALUES(7902, "NAZLI", "ANALIST", 7566, "3.12.1981", 3000.0, 20);
	INSERT INTO Personel VALUES(7934, "EBRU", "KATIP", 7782, "23.01.1982", 1300.0, 10);
	
--3.
--SORGU 1.
	SELECT b.bolum_isim, P.personel_isim
	FROM bolumler b
	JOIN Personel P
	ON b.bolum_id=P.bolum_id
	WHERE bolum_isim IN ("SATIS", "MUHASEBE")
	ORDER BY b.bolum_isim, P.personel_isim;


--SORGU 2.
	SELECT P.personel_isim, b.bolum_isim, P.ise_baslama
	FROM bolumler b
	LEFT JOIN Personel P
	ON b.bolum_id=P.bolum_id
	WHERE bolum_isim IN ("SATIS", "ISLETME", "DEPO");


 
--SORGU 3.
	SELECT P.personel_isim, b.bolum_isim, P.maas
	FROM bolumler b
	LEFT JOIN Personel P
	ON b.bolum_id=P.bolum_id
	ORDER BY b.bolum_id, P.maas DESC;


--SORGU 4.
	SELECT P.personel_isim, b.bolum_isim, P.maas
	FROM bolumler b
	JOIN Personel P
	ON b.bolum_id=P.bolum_id AND P.maas > 2000
	WHERE bolum_isim IN ("SATIS", "MUDURLUK")
	ORDER BY b.bolum_id, P.personel_isim;
	
	
--SORGU 5.
	SELECT b.bolum_isim, P.personel_isim, P.maas,
	(SELECT personel_isim
	FROM Personel
	WHERE personel_id = P.mudur_id) as mudur_ismi
	FROM bolumler b
	JOIN Personel P
	ON b.bolum_id=P.bolum_id
	WHERE P.mudur_id IN (7788, 7698)
	ORDER BY P.maas DESC;
	
	



