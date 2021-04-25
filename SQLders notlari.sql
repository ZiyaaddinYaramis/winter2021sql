    
    
    
    /*======================= DAY01 ======================================*/
   
  
    /* ========================================================= 
                            TABLO OLUSTURMA  (CRUD - Create)                  
    ============================================================*/


    /*
    Bu sekilde de oluyor
    */
    
    -- C: Create, R: Read, U: Update, D: Delete



  /*  
  
    CREATE TABLE tabloAdi
    (
    degiskenAdi degiskenTipi,
    degiskenAdi degiskenTipi,
    …………
    degiskenAdi degiskenTipi
    
    CREATE TABLE student -- yeni bir tablo
     ( -- Buraya da aciklama yazilabilir
        std_id    CHAR(3),
        std_name  VARCHAR2(20),
        std_age   NUMBER
    );
    
    
    */
  
    
    /*
    Kodu komple  comment yapmak istersek, kod blogunu mause ile secip sag click yap
    ve Toggle Line Comments e click'liyerek  komple secili yer comment haline cevirilebilir.
    Tekrar Toggle Line Comments e click'liyerek eski haline cevirebilirsiniz
    */

  
  
    /* ========================================================= 
                         VERI GIRISI 
    ===========================================================*/
    -- INSERT INTO tablo_adi VALUES (degisken1, degisken2, … )
  
  
  
  
    /* ========================================================= 
                        PARÇALI VERI GIRISI 
    ===========================================================*/
    
    /*
    ÖRNEK: Parçali Giris
    INSERT INTO student(std_id,std_name) VALUES('1005','MUSTAFA KARAR');
    
    NOT: Veri girisi yapslmayan degiskenlere NULL atanir.
    */
    
    
    
    
    
    
    /* ========================================================= 
                        TABLODAN VERI SORGULAMA  (CRUD - Read)  
    ===========================================================*/
    
    
    SELECT * FROM student; -- read yapiyoruz okuyoruz yani Query yapiyoriz 
                           -- Query Result sekmesi bu kod ile acilir
    
    
    DROP TABLE student; -- student isimli table'i siler
    
    
    
    
    /*
    
    TARIH FORMATINDAKI FARKLILIKLARI CÖZME;
    
    Tarih formatinda genelde farkliliklardan öturu hatalar olusmaktadir.
    window pc'lerde Tools sekmesinden Preferences e gris yaparak NLS aratilir
    gelen sayfadan Date format'i elle degistirip ok click'lerek istedigimiz formata 
    getirilebilir.
    */
    
    
    
    /*======================= DAY02 ======================================*/
    /*======================= DAY02 ======================================*/
    
    
    
    /*======================= CONSTRAINTS - KISITLAMALAR ======================================
               
    NOT NULL        - Bir Sütunun  NULL içermemesini garanti eder. 
    UNIQUE          - Bir sütundaki tüm degerlerin BENZERSIZ olmasini garanti eder.  
    PRIMARY KEY     - Bir sütünün NULL içermemesini ve sütundaki verilerin BENZERSIZ olmasini 
                    garanti eder.(NOT NULL ve UNIQUE birlesimi gibi)
    FOREIGN KEY     - Baska bir tablodaki Primary Key’i referans göstermek için kullanilir. 
                    Böylelikle, tablolar arasinda iliski kurulmus olur. 
    CHECK           - Bir sutundaki tüm verilerin belirlenen özel bir sarti saglamasini garanti eder. 
    DEFAULT         - Herhangi bir deger atanamadiginda Baslangiç degerinin atanmasini saglar.
    ========================================================================================*/
    
      
  
    /*
    
    CREATE TABLE calisanlar
    (
        id CHAR(5)PRIMARY KEY, -- PRIMARY KEY benzersiz olmaktir
        isim VARCHAR2(50) NOT NULL UNIQUE, -- Birden fazla kisitlama eklenebilir
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    */
    
    
    
    
    
    ----------------------------------------------------------------
-- KISITLAMALAR (ORNEK1 - PRIMARY KEY)
----------------------------------------------------------------

 CREATE TABLE calisanlar
    (
        id CHAR(5)PRIMARY KEY, -- PRIMARY KEY benzersiz olmaktir
        isim VARCHAR2(50) /*NOT NULL*/ UNIQUE, -- Birden fazla kisitlama eklenebilir
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES('10002', 'Mehmet Yilmaz' ,12000, '14-04-2018');
    INSERT INTO calisanlar VALUES('10003', '', 5000, '14-04-2018');
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-04-2018');
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-04-2018');    
    --INSERT INTO calisanlar VALUES('10006', 'Mustafa Ali', NULL, '14-04-2018'); 
    -- null olmaz maas NUMBER(5) NOT NULL,
    
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;   
    
    -- 10001 id'li calisani silme (ileride bu konuyu görecegiz).
    DELETE calisanlar
    WHERE id = '10001';
    /*
    DELETE calisanlar
    WHERE id = '10001';
    
    komutu ile 10001 id'li  veriyi sildik
    */
    
    
    
        ----------------------------------------------------------------
        -- KISITLAMALAR (ORNEK2 - PRIMARY KEY ALTERNATIF YÖNTEM)
        ----------------------------------------------------------------
        -- Bu yöntemde Kisitlamaya istedi?imiz ismi atayabiliriz 
        -- ve DISABLE komutuyla istedi?imizde pasif hale getirebiliriz. 

CREATE TABLE calisanlar
    (
        id CHAR(5),
        isim VARCHAR2(50)UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT  id_pk PRIMARY KEY(id) --DISABLE
        
        /*
        CONSTRAINT komudu ile olusturulan id 'i PRIMARY KEY yaptik 
        ve id_pk adini verdik. bu da bir yoldur ve anternatifdir.
        */
    );
 
    INSERT INTO calisanlar VALUES('10001','Ahmet Aslan',7000,'13-04-2018');
    INSERT INTO calisanlar VALUES( '10002','Mehmet Yilmaz' ,12000, '14-04-2018');
    INSERT INTO calisanlar VALUES('10003', 'Cuneyt Ozkan', 5000, '14-04-2018');
    
    DROP TABLE calisanlar;
    
        ----------------------------------------------------------------
        -- KISITLAMALAR (ORNEK3 - FOREIGN KEY)
        ----------------------------------------------------------------
    
    CREATE TABLE adresler(
    
    adres_id CHAR(5), --REFERENCES calisanlar(id), -- parent-child iliskisi kurduk
    sokak VARCHAR2(50),
    cadde VARCHAR2(30),
    sehir VARCHAR2(15),
    CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
    
        /*
        CONSTRAINT komudu ile olusturulan adres_id 'i FOREIGN KEY yaptik 
        ve id_fk adini verdik. bu da bir yoldur ve anternatifdir.
        REFERENCES calisanlar(id) komutu ilede parent-child iliskisi kurduk
        */
    );
    
    
    INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
    INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
    INSERT INTO adresler VALUES('10002','Aga Sok', '30.Cad.','Antep');
    -- FK'ye null de?eri atanabilir.
    INSERT INTO adresler VALUES('','Aga Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','Aga Sok', '30.Cad.','Antep');
    
        -- Parent ta olmayan bir id ye child da ekleme yapilamaz.
        -- INSERT INTO adresler VALUES('10004','Gel Sok', '60.Cad.','Van');
    
    SELECT * FROM adresler;
    SELECT * FROM calisanlar;
    
    SELECT * FROM calisanlar,adresler
    WHERE id = '10001';
    
    /*
    91-92 satirlari komple secip run script yaptigimizda REFERENCES edilen 
    tablolari Query Result ta toplu olarak görebiliriz
    */
    
    
    -- Child tablo silinmeden parent tablo silinemez.
    DROP TABLE calisanlar;
    DROP TABLE adresler;
    
    
    
    
    
    
    CREATE TABLE sehirler(
    alan_kodu NUMBER(3)DEFAULT 00,
    isim VARCHAR2(20) DEFAULT 'noname',
    nufus NUMBER(8) CHECK(nufus>0)
    );
    
    INSERT INTO sehirler VALUES(54,'sakarya',1250000);
    INSERT INTO sehirler VALUES('','',18000000);
    
    -- Parcali Veri Girisi
    INSERT INTO sehirler (nufus) VALUES(500000); -- Parcali veri girisindeki 
                                                 -- defalt girisler gecerli oluyor
    
    SELECT  * FROM sehirler;
    
    DROP TABLE sehirler;
    
    
    
    
            /*
            
            1) CHECK ile bir alana girilebilecek degerleri sinirlayabiliriz.
               Ornegin yas sutuna negatif sayi girilmesinin engellenmesi gibi.
            2) DEFAULT kisitlamasi ile de veri girisi sirasinda bos birakilan 
               kisimlara null girilmesi yerine belirledigimiz bir degerin 
               girilmesi saglanabilir. 
            -- Bos birakildigi zaman SQL diyor ki burasi doldurulacak 
               demek ki ben buraya default atamayayim der.
            -- AMA parcali giris yaparsak bos birakilan yerler DEFAULT yerlerle doldurulur. 
               (Not : Create asamasinda Default deger atamazsak SQL'in default'u NULL'dur)
            */
    
    
    
    /*======================= DAY03 ======================================*/
    /*======================= DAY03 ======================================*/
    /*======================= DAY03 ======================================*/
  
  
  
  
  
  
  
  
  

/* ======================= SELECT - IN ======================================
    IN birden fazla mant?ksal ifade ile tanimlayabilecegimiz durumlar? 
    tek komutla yazabilme imkân? verir

    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adi
    WHERE sutun_adi IN (deger1, deger2, ...);
 ========================================================================== */
















/*============================== UPDATE SET ===================================

-- SYNTAX
    ---------
    -- UPDATE tablo_adi
    -- SET sutun_adi = yeni_deger
    -- WHERE sutun_adi;
    
    
    
    -- Drop table tabloyu siler ama DELETE icerigini siler.
    
    DELETE FROM urunler;
    
    -- Not!!! önce child'in icerigini silmelisin





*/