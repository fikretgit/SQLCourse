--1.
	CREATE TABLE calisanlar (
		id CHAR(4),
		isim VARCHAR2(50),
		maas NUMBER(5),
		CONSTRAINT id_pk PRIMARY KEY (id)
	);
	
	INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
	INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yılmaz' ,12000);
	INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
	INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);

	
	CREATE TABLE aileler (
	id CHAR(4),
	cocuk_sayisi VARCHAR2(50),
	ek_gelir NUMBER(5),
	CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
	);
	
	INSERT INTO aileler VALUES('1001', 4, 2000);
	INSERT INTO aileler VALUES('1002', 2, 1500);
	INSERT INTO aileler VALUES('1003', 1, 2200);
	INSERT INTO aileler VALUES('1004', 3, 2400);
	
	
--2.
	UPDATE calisanlar
	SET maas = maas * 1.2
	WHERE isim = "Veli Han";
	
	
--3.
	UPDATE calisanlar
	SET maas = maas * 1.2 
	WHERE maas < (
	SELECT avg(maas)
	FROM calisanlar);
	
--4. 
	SELECT c.isim, a.cocuk_sayisi 
	FROM calisanlar c
	JOIN aileler a
	ON c.id = a.id;
	
--5.
	SELECT c.id, c.isim, (c.maas + a.ek_gelir) as toplam_gelir
	FROM calisanlar c
	LEFT JOIN aileler a
	on c.id=a.id;
	
--6. 
	UPDATE calisanlar
	SET maas = maas * 1.1 
	WHERE 2000 > 
	(SELECT (calisanlar.maas + aileler.ek_gelir)/(aileler.cocuk_sayisi+2)
	FROM aileler
	WHERE calisanlar.id=aileler.id);
	
	
	
	
	
	
	
	
	
	
	
	
	