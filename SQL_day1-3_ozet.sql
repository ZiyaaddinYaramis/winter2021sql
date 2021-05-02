                        --DAY01,02,03
    
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
    
    NOT: Veri girisi yapilmayan degiskenlere NULL atanir.
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
    gelen sayfadan Date format'i elle degistirip ok click'lerek istedigimiz 
    formata getirilebilir.
    
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
-- Bu yöntemde Kisitlamaya istedigimiz ismi atayabiliriz 
-- ve DISABLE komutuyla istedigimizde pasif hale getirebiliriz. 

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
    xx-yy satirlari komple secip run script yaptigimizda REFERENCES edilen 
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
  
  
  
  
/* ======================= SELECT - WHERE ==================================*/
  
/* ============================================================================
    Verileri SELECT komutu ile veritabanindan çekerken filtreleme yapmak için 
   
    Syntax
    --------
    SELECT ile birlikte WHERE komutu kullan?labilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adi  WHERE kosul;
==============================================================================*/


/* -----------------------------------------------------------------------------
  ORNEK1: Sinav notu 80'den büyük olan ögrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/ 


SELECT * FROM ogrenciler 
WHERE sinav_notu>80; -- sinav_notu>80 olanlari gösterir



-- notu 80 den büyük olanlar?n sadece isim ve not bilgilerini listeleme

SELECT isim,sinav_notu  
FROM ogrenciler 
WHERE sinav_notu>80; --sinav_notu>80 olanlarin sadece 
                     --isim ve not bilgilerini listeleme
                     
                     
/* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan ögrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/                                                           
SELECT * FROM ogrenciler WHERE adres ='Ankara';   

/* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan ögrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
SELECT * FROM ogrenciler WHERE id =124;

-- DELETE ogrenciler WHERE id=125;



















/* ======================= SELECT - BETWEEN ==================================*/ 

-- NOT:BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari 
-- tek komutla yazabilme imkâni verir. Yazdigimiz 2 sinir da araliga dahildir.

/*============================================================================*/


/* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasinda olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
--1.Yöntem (AND) 
    SELECT * FROM personel
    WHERE id>='10002' AND id <='10005'; 
    
   --2.Yöntem (BETWEEN)
    SELECT id, isim,maas 
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; -- ALT VE ÜST LIMITLER DAHILDIR.
















/* ======================= SELECT - IN ======================================
    IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari 
    tek komutla yazabilme imkâni verir

    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adi
    WHERE sutun_adi IN (deger1, deger2, ...);
 ========================================================================== */



/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
    --1.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id = 10001 OR id = 10002 OR id = 10004;
    
     --2.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id IN(10001, 10002, 10004);















/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak saglar.

    SYNTAX:
    -------
    SELECT sutün1, sutün2,…  FROM  tablo_adi  
    WHERE sütun LIKE pattern
    
    PATTERN IÇIN
    -------------
    % 	 ---> 0 veya daha fazla karakteri belirtir. 
    _  	 ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */



/* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile baslayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE isim LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanlari listeleyiniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%'; -- _  1 karekter oldugunu belirtiyor
/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diger harflerinde y olanlar? listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';

/* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile baslamayanlari listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';

/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';

 /* -----------------------------------------------------------------------------
  ORNEK16:  maasinin son 2 hanesi 00 olmayanlari listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';

/* -----------------------------------------------------------------------------
  ORNEK17:  maasinin 4000 olmayanlari listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
    
/* -----------------------------------------------------------------------------
  ORNEK18: maasi 5 haneli olanlari listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
/* -----------------------------------------------------------------------------
  ORNEK19: maasinin  5 haneli olmayanlari listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
      
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
 -----------------------------------------------------------------------------*/  

    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/* ======================= SELECT - REGEXP_LIKE ================================
    Daha karmasik pattern ile sorgulama islemi için REGEXP_LIKE kullanilabilir.  

    Syntax:
    --------
    
    SELECT sutün1, sutün2,…  FROM  tablo_adi  
    WHERE REGEXP_LIKE(sutun_adi, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */



/* -----------------------------------------------------------------------------
  ORNEK21: Içerisinde 'hi' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- içerisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
/* -----------------------------------------------------------------------------
  ORNEK22: Içerisinde 'ot' veya 'at' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    -- VEYA islemi için | karakteri kullanilir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    
/* -----------------------------------------------------------------------------
  ORNEK23: Içerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
     -- 'c' => case-sentisitive demektir ve default case-sensitive aktiftir.
     -- 'i' => incase-sentisitive demektir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    
/* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile baslayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
    -- Baslangici göstermek için ^ karakteri kullanilir.
    SELECT * FROM  kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho','i'); -- 'i' Büyük-Küçük harf duyarsiz
    
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Bitisi göstermek için $ karakteri kullanilir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    
    
/* -----------------------------------------------------------------------------
  ORNEK26: h ile baslayip t ile biten 3 harfli kelimeleri büyük-küçük harfe 
  dikkat etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
    -- - (tire) karakteri bir aralik verir.
    -- köseli parantez tek bir karakter gösterir.
    
    /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z0-9]t','i'); -- [a-z0-9] a'dan z'ye 0'dan 9'a demektir
    */
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t');
    
/* -----------------------------------------------------------------------------
  ORNEK27: Ilk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalim.
 -----------------------------------------------------------------------------*/ 
    /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    */
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t');
    
    /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^h[ai]t$');
    */
    
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile baslayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
   /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
   */
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');
    
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo baridiran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
    
    -- {2}
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[o]{2}','i'); 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[a]{2}','i'); 
   
    
    SELECT *  FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[o]{2}');
