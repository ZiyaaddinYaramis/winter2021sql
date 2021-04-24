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

SELECT * FROM ogrenciler WHERE sinav_notu>80; --sinav_notu>80 olanlari gösterir

SELECT isim,sinav_notu  FROM ogrenciler WHERE sinav_notu>80; --sinav_notu>80 olanlarin sadece 
                                                            --isim ve not bilgilerini listeleme
                                                           
SELECT * FROM ogrenciler WHERE adres ='Ankara';   

SELECT * FROM ogrenciler WHERE id =124;

DELETE ogrenciler WHERE id=125;


CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
?
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES('10002', 'Mehmet Y?lmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ay?e Can', 4000);
?
    SELECT * FROM personel;
    

DROP TABLE ogrenciler;
DROP TABLE personel;
---------------------------------------------------------------
--1.Yöntem (AND) 
    SELECT * FROM personel
    WHERE id>='10002' AND id <='10005'; 
    
   --2.Yöntem (BETWEEN)
    SELECT id, isim,maas 
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; -- ALT VE ÜST L?M?TLER DAH?LD?R.
    
     
/* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Y?lmaz ile Veli Han aras?ndaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
   
    SELECT * FROM  personel
    WHERE isim BETWEEN 'Mehmet Y?lmaz' AND 'Veli Han'; -- M ile V arasini dahil olarak siraladi
    
/* -----------------------------------------------------------------------------
  ORNEK6: id’si 10002 - 10004 aras?nda olmayan personelin bilgilerini listele
-------------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
              
/* ======================= SELECT - IN ======================================
    IN birden fazla mant?ksal ifade ile tan?mlayabilece?imiz durumlar? 
    tek komutla yazabilme imkân? verir
?
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_ad?
    WHERE sutun_ad? IN (deger1, deger2, ...);
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
    kullanabilmemize olanak sa?lar.
?
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_ad?WHERE sütunN LIKE pattern
    
    PATTERN ?Ç?N
    -------------
    % 	 ---> 0 veya daha fazla karakteri belirtir. 
    _  	 ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile ba?layanlar? listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE isim LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanlar? listeleyiniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%'; -- _  1 karekter oldugunu belirtiyor
/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup di?er harflerinde y olanlar? listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';
?
/* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile ba?lamayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';
?
/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';
?
/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';
?
 /* -----------------------------------------------------------------------------
  ORNEK16:  maa??n?n son 2 hanesi 00 olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';
?
/* -----------------------------------------------------------------------------
  ORNEK17:  maa??n?n 4000 olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
    
 /* -----------------------------------------------------------------------------
  ORNEK18: maa?? 5 haneli olanlar? listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
  /* -----------------------------------------------------------------------------
  ORNEK19: maa??n?n  5 haneli olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
      
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
 -----------------------------------------------------------------------------*/  
?
    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';

