
/* ======================= SELECT - WHERE ==================================*/

CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );


CREATE TABLE ogrenciler
(
id NUMBER(9),
isim VARCHAR2(50),
adres VARCHAR2(100),
sinav_notu NUMBER(3)
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);

SELECT * FROM ogrenciler;


/* ============================================================================
    Verileri SELECT komutu ile veritabanindan çekerken filtreleme yapmak için 
   
    Syntax
    --------
    SELECT ile birlikte WHERE komutu kullan?labilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adiWHERE kosul;
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
CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES('10002', 'Mehmet Yilmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayse Can', 4000);

    SELECT * FROM personel;
    
   -- DROP TABLE ogrenciler;
   -- DROP TABLE personel; 
    
    
-- NOT:BETWEEN iki mant?ksal ifade ile tanimlayabilecegimiz durumlar? 
-- tek komutla yazabilme imkâni verir. Yazdi??m?z 2 sinir da aral??a dahildir.
    
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
    
     
/* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yilmaz ile Veli Han arasindaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
   
    SELECT * FROM  personel
    WHERE isim BETWEEN 'Mehmet Yilmaz' AND 'Veli Han'; -- M ile V arasini dahil olarak siraladi
    
/* -----------------------------------------------------------------------------
  ORNEK6: id’si 10002 - 10004 arasinda olmayan personelin bilgilerini listele
-------------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
              
/* ======================= SELECT - IN ======================================
    IN birden fazla mant?ksal ifade ile tanimlayabilecegimiz durumlar? 
    tek komutla yazabilme imkân? verir

    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adi
    WHERE sutun_adi IN (deger1, deger2, ...);
/* ========================================================================== */
    
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
    
/* -----------------------------------------------------------------------------
  ORNEK8: Maa?? sadece 7000  ve 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
    
/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak saglar.

    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_ad?WHERE sütunN LIKE pattern
    
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
    Daha karma??k pattern ile sorgulama i?lemi için REGEXP_LIKE kullan?labilir.  

    Syntax:
    --------
    REGEXP_LIKE(sutun_ad?, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT * FROM kelimeler;
    
/* -----------------------------------------------------------------------------
  ORNEK21: ?çerisinde 'hi' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- içerisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
/* -----------------------------------------------------------------------------
  ORNEK22: ?çerisinde 'ot' veya 'at' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    -- VEYA i?lemi için | karakteri kullan?l?r.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    
/* -----------------------------------------------------------------------------
  ORNEK23: ?çerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
     -- 'c' => case-sentisitive demektir ve default case-sensitive aktiftir.
     -- 'i' => incase-sentisitive demektir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    
/* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile ba?layan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
    -- Ba?lang?c? göstermek için ^ karakteri kullan?l?r.
    SELECT * FROM  kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho','i'); -- 'i' Büyük-Küçük harf duyars?z
    
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Biti?i göstermek için $ karakteri kullan?l?r.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    
    
/* -----------------------------------------------------------------------------
  ORNEK26: h ile ba?lay?p t ile biten 3 harfli kelimeleri büyük-küçük harfe 
  dikkat etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
    -- - (tire) karakteri bir aral?k verir.
    -- kö?eli parantez tek bir karakter gösterir.
    
    /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z0-9]t','i'); -- [a-z0-9] a'dan z'ye 0'dan 9'a demektir
    */
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t');
    
/* -----------------------------------------------------------------------------
  ORNEK27: ?lk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayal?m.
 -----------------------------------------------------------------------------*/ 
    /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    */
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t');
    
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile ba?layan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
    /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    */
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');
    
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo bar?d?ran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
    
    -- {2}
    /*
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[o]{2}','i'); 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[a]{2}','i'); 
    */
    
    SELECT *  FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[o]{2}');














