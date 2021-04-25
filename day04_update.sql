/* ============================== UPDATE SET ===================================    
    
    ilk olarak asagidaki gibi tedarikciler adinda bir tablo olusturunun ve 
    vergi_no sutununu primary key yapiniz.Ayrica asagidaki verileri tabloya giriniz.
    
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonrasinda asagidaki gibi urunler adinda bir baska tablo olusturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunlari
    yardmiyla iliski kurunuz. Verileri giriniz.
    
    
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay?e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y?lmaz');
    
==============================================================================*/ 


CREATE TABLE tedarikciler
    (
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
    CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
    );

    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
  
    SELECT * FROM tedarikciler;
  
    
CREATE TABLE urunler
    (  
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayse Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yilmaz');
    
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
    
    -- SYNTAX
    ---------
    -- UPDATE tablo_adi
    -- SET sutun_adi = yeni_deger
    -- WHERE sutun_adi;
    
    
/*-----------------------------------------------------------------------------
  ORNEK1: vergi_no’su 101 olan tedarikcinin ismini ‘LG’ olarak güncelleyeniz.
-----------------------------------------------------------------------------*/


    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE vergi_no = 101;


    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
/*-----------------------------------------------------------------------------
  ORNEK2: Tedarikciler tablosundaki tum firma isimlerini ‘Samsung’ olarak güncelleyeniz.
-----------------------------------------------------------------------------*/    
    UPDATE tedarikciler
    SET firma_ismi = 'SAMSUNG';
    
    
    DELETE FROM urunler; -- Drop table tabloyu siler ama DELETE icerigini siler.
                         -- Not!!! önce child'in icerigini silmelisin
    DELETE FROM tedarikciler;
    
/* -----------------------------------------------------------------------------
  ORNEK3: vergi_no’su 102 olan tedarikcinin ismini 'Samsung' ve irtibat_ismi’ni 
  'Ali Veli' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
    
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung', irtibat_ismi =' Ali Veli'
    WHERE vergi_no = 102;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
/* -----------------------------------------------------------------------------
  ORNEK4: firma_ismi Samsung olan tedarikcinin irtibat_ismini 'Ayse Yilmaz' 
  olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/ 
    UPDATE tedarikciler
    SET irtibat_ismi = 'Ayse Yilmaz'
    WHERE firma_ismi = 'Samsung';
    
    
    
    SELECT * FROM tedarikciler;
/* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki 'Phone' degerlerini Telefon olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET urun_isim='Telefon'
    WHERE urun_isim='Phone';
    
    
    
    SELECT * FROM urunler;
 
/* -----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id degeri 1004'ten büyük olanlarin urun_id
  degerlerini bir arttiriniz
 -----------------------------------------------------------------------------*/ 
     
     UPDATE urunler
     SET urun_id = urun_id + 1
     WHERE urun_id > 1004 ;
     
     
     SELECT * FROM urunler;
  
 /* ----------------------------------------------------------------------------
  ORNEK7: urunler tablosundaki tüm ürünlerin urun_id degerini ted_vergino 
  sutun degerleri ile toplayarak güncelleyiniz.
 -----------------------------------------------------------------------------*/  
    UPDATE urunler
    SET urun_id = urun_id + ted_vergino;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
/*-----------------------------------------------------------------------------
 ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci 
 tablosunda irtibat_ismi 'Adam Eve' olan firmanin ismi (firma_ismi) ile 
 degistiriniz.
 -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET urun_isim = (SELECT firma_ismi FROM tedarikciler 
                     WHERE irtibat_ismi = 'Adam Eve')
    WHERE musteri_isim = 'Ali Bak';
  
/*------------------------------------------------------------------------------
 ORNEK9: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
 degistirin
 -----------------------------------------------------------------------------*/

    UPDATE urunler
    SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler
                        WHERE firma_ismi ='Apple')
    WHERE urun_isim = 'Laptop';
 
 