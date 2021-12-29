--1.
	CREATE TABLE hastaneler (
		ID TEXT,
		ISIM TEXT,
		SEHIR TEXT,
		OZEL TEXT,
		PRIMARY KEY (ID)
		);
		
	INSERT INTO hastaneler VALUES("H101", "ACI MADEM HASTANESI", "ISTANBUL", "Y");
	INSERT INTO hastaneler VALUES("H102", "HASZEKI HASTANESI", "ISTANBUL", "N");
	INSERT INTO hastaneler VALUES("H103", "MEDIKOL HASTANESI", "IZMIR", "Y");
	INSERT INTO hastaneler VALUES("H104", "NEMORYIL HASTANESI", "ANKARA", "Y");

		
--2.
	CREATE TABLE hastalar (
		KIMLIK_NO INT,
		ISIM TEXT,
		TESHIS TEXT,
		PRIMARY KEY (KIMLIK_NO)
		);

	INSERT INTO hastalar VALUES(12345678901, "Ali Can", "Gizli Seker");
	INSERT INTO hastalar VALUES(45678901121, "Ayse Yılmaz", "Hipertansiyon");
	INSERT INTO hastalar VALUES(78901123451, "Steve Jobs", "Pankreatit");
	INSERT INTO hastalar VALUES(12344321251, "Tom Hanks", "COVID19");

	
	
	
--3.
CREATE TABLE bolumler (
	BOLUM_ID TEXT,
	BOLUM_ADI TEXT,
	PRIMARY KEY (BOLUM_ID)
	);

	INSERT INTO bolumler VALUES("DHL", "Dahiliye");
	INSERT INTO bolumler VALUES("KBB", "Kulak-Burun-Boğaz");
	INSERT INTO bolumler VALUES("NRJ", "Noroloji");
	INSERT INTO bolumler VALUES("GAST", "Gastroloji");
	INSERT INTO bolumler VALUES("KARD", "Kardioloji");
	INSERT INTO bolumler VALUES("PSK", "Psikiyatri");
	INSERT INTO bolumler VALUES("GOZ", "Goz Hastaliklari");

	
	
--4.
	CREATE TABLE hasta_kayıtlar (
		KIMLIK_NO INT,
		HAST_ISIM TEXT DEFAULT NONAME,
		HASTANE_ADI TEXT DEFAULT NULL,
		BOLUM_ADI TEXT DEFAULT NULL,
		TESHIS TEXT DEFAULT NULL,
		PRIMARY KEY (KIMLIK_NO)
		);

	INSERT INTO hasta_kayıtlar VALUES(1111, "","","","");
	INSERT INTO hasta_kayıtlar VALUES(2222, "","","","");
	INSERT INTO hasta_kayıtlar VALUES(3333, "","","","");
		
		
--5.
	UPDATE hasta_kayıtlar
	SET HAST_ISIM = "Salvadore Dali", HASTANE_ADI = "John Hopkins", BOLUM_ADI = "Noroloji", TESHIS = "Parkinson", KIMLIK_NO = 99991111222
	WHERE KIMLIK_NO = 3333;
	
--5.
	UPDATE hasta_kayıtlar
	SET HAST_ISIM = "Ali Can", HASTANE_ADI = "NEMORYIL HASTANESI", BOLUM_ADI = "Dahiliye", TESHIS = "Gizli Şeker", KIMLIK_NO = 12345678901
	WHERE KIMLIK_NO = 1111;

--6.
	UPDATE hasta_kayıtlar
	SET HAST_ISIM = "Ayşe Yılmaz", HASTANE_ADI = "MEDIKOL HASTANESI", BOLUM_ADI = "Kulak-Burun-Boğaz", TESHIS = "COVID19", KIMLIK_NO = 78901123451
	WHERE KIMLIK_NO = 2222;



















