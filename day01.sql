/* ========================================================= 
                        TABLO OLU?TURMA  (CRUD - Create)                  
============================================================*/


/*
Bu sekilde de oluyor
*/

-- C: Create, R: Read, U: Update, D: Delete


CREATE TABLE student -- yeni bir tablo
 ( -- Buraya da aciklama yazilabilir
    std_id    CHAR(3),
    std_name  VARCHAR2(20),
    std_age   NUMBER
);

/*  
CREATE TABLE tabloAd?
(
de?i?kenAd? de?i?kenTipi,
de?i?kenAd? de?i?kenTipi,
…………
de?i?kenAd? de?i?kenTipi
);
*/


/*
Kodu komple  comment yapmak istersek, kod blogunu mause ile secip sag click yap
ve Toggle Line Comments e click'liyerek  komple secili yer comment haline cevirilebilir.
Tekrar Toggle Line Comments e click'liyerek eski haline cevirebilirsiniz
*/




/* ========================================================= 
                     VER? G?R??? 
===========================================================*/
-- INSERT INTO tablo_ad? VALUES (de?i?ken1, de?i?ken2, … )

INSERT INTO student VALUES ('101','Ahmet Can',30);
INSERT INTO student VALUES ('102','MEHMET ALI',25);
INSERT INTO student VALUES ('103','AYSE YILMAZ',34);
INSERT INTO student VALUES ('104','JOHN STAR',56);
INSERT INTO student VALUES ('105','MARY BROWN',17);




/* ========================================================= 
                    PARÇALI VER? G?R??? 
===========================================================*/

/*
ÖRNEK: Parçal? Giri?
INSERT INTO student(std_id,std_name) VALUES('1005','MUSTAFA KARAR');
NOT: Veri giri?i yap?lmayan de?i?kenlere NULL atan?r.
*/

INSERT INTO student (std_id,std_name) VALUES ('106','Jonh Travolta');


/* ========================================================= 
                    TABLODAN VER? SORGULAMA  (CRUD - Read)  
===========================================================*/


SELECT * FROM student; -- read yapiyoruz okuyoruz yani Query yapiyoriz 
                       -- Query Result sekmesi bu kod ile acilir


DROP TABLE student; -- student isimli table'i siler


/*========================================================= 
                         CRUD ÖRNEK  
 ===========================================================
             
 Veritaban?m?zda urunler ad?nda bir Tablo olu?tural?m.
 urun_id  => NUMBER
 urun_ad? => VARCHAR2(50)
 fiyat => NUMBER(5,2)
 tett => DATE,      
 stok_adedi => NUMBER(10)  
 Tabloya, Ürün giri?i yapal?m.Örne?in C?PS, KOLA, AYRAN, B?SKÜV?,  
 (100, ‘C?PS’, 5.50, ‘01-05-2022’, 500)
 Verilerimizi çekelim.
 ===========================================================*/


CREATE TABLE urunler (
    urun_id     NUMBER,
    urun_adi    VARCHAR2(50),
    fiyat       NUMBER(5, 2),
    tett        DATE,
    stok_adedi  NUMBER(10)
);

INSERT INTO urunler VALUES (101,'C?PS',5.25,'01-05-2022',1500);
INSERT INTO urunler VALUES (102,'B?SKÜV?',2.50,'01-07-2024',300);
INSERT INTO urunler VALUES (103,'GOFRET',1.50,'05-09-2023',120);
INSERT INTO urunler VALUES (104,'KOLA',4.50,'21-09-2025',50);
INSERT INTO urunler VALUES (105,'AYRAN',2.50,'01-05-2021',5);


SELECT * FROM urunler;

/*

TARIH FORMATINDAKI FARKLILIKLARI CÖZME;

Tarih formatinda genelde farkliliklardan öturu hatalar olusmaktadir.
window pc'lerde Tools sekmesinden Preferences e gris yaparak NLS aratilir
gelen sayfadan Date format'i elle degistirip ok click'lerek istedigimiz formata 
getirilebilir.
*/

/* ===========================================================*/