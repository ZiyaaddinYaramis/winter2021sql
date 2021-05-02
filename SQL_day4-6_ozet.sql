/*======================= DAY04 ======================================*/
/*======================= DAY04 ======================================*/
/*======================= DAY04 ======================================*/
/*======================= DAY04 ======================================*/




/*============================== UPDATE SET ===================================

-- SYNTAX
    ----------
    -- UPDATE tablo_ad?
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE ko?ul;
    
    
    
    -- Drop table tabloyu siler ama DELETE icerigini siler.
    
    DELETE FROM urunler;
    
    -- Not!!! önce child'in icerigini silmelisin





*/

/* -----------------------------------------------------------------------------
  ORNEK1: vergi_no’su 101 olan tedarikcinin ismini 'LG' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
 
    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE vergi_no = 101;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
    
    
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
 ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, 
 
 
 tedarikci 
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/*======================= DAY05 ======================================*/
/*======================= DAY05 ======================================*/
/*======================= DAY05 ======================================*/
/*======================= DAY05 ======================================*/
/*======================= DAY05 ======================================*/





/* ============================== DELETE ===================================  */

    -- DELETE FROM tablo_adi;  Tablonun tüm içerigini siler.
    -- Bu komut bir DML komutudur. Dolayisiyla devaminda WHERE gibi cümlecikler
    -- kullanilabilir.
    
    
    -- DELETE FROM tablo_adi
    -- WHERE sutun_adi = veri;

 