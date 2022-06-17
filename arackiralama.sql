create schema arackiralama;
use arackiralama;
create table personel(
p_sicil_no int not null  primary key,
p_ad varchar(50) not null,
p_soyad varchar(50) not null,
p_yas int,
p_isbaslangic date,
p_isayrilis date default null
);

create table arac(
arac_no int not null auto_increment primary key,
yıl int,
marka int,
model int,
arac_km decimal(10.3),
arac_kasko bool,
kiralama_ucreti decimal(13.4)
);

create table musteri(
musteri_no int not null auto_increment primary key,
m_ad varchar(50),
m_soyad varchar(50),
m_egitimdurumu varchar(50),
m_adres varchar(100),
m_telefon nvarchar(11)
);

create table marka(
marka_no int not null auto_increment primary key,
marka varchar(50)
);

create table model(
model_no int not null auto_increment primary key,
model varchar(50)
);

create table kiralama(
musteri_no int,
arac_no int,
p_sicil_no int,
kiralama_tarihi datetime
);

alter table arac add constraint arac1 foreign key (marka) references marka(marka_no);
alter table arac add constraint arac2 foreign key (model) references model(model_no);
alter table kiralama add constraint kiralama1 foreign key (musteri_no) references musteri(musteri_no);
alter table kiralama add constraint kiralama2 foreign key (arac_no) references arac(arac_no);
alter table kiralama add constraint kiralama3 foreign key (p_sicil_no) references personel(p_sicil_no);


insert into personel (p_sicil_no,p_ad,p_soyad,p_yas,p_isbaslangic) values
(123456,"Ahmet","Tektaş",25,'2020.05.19'),
(123461,"Kamil","Ak",60,'2017.05.11'),
(123457,"Veli","Kaya",50,'2019.10.18'),
(123458,"Görkem","Can",28,'2018.06.29'),
(123459,"Fatma","Kaplan",34,'2020.07.09'),
(123460,"Mert","Doğan",22,'2020.03.02'),
(123462,"Cevat","Taş",38,'2019.09.14'),
(123463,"Murat","Yıldız",32,'2018.08.15'),
(123464,"Aslan","Cömert",26,'2020.02.22'),
(123465,"Doğukan","Kılıç",23,'2020.03.25');

insert into marka (marka) values 
("BMW"),
("Ford"),
("Honda"),
("Mercedes"),
("Skoda"),
("Fiat"),
("Volkswagen"),
("Dacia"),
("Seat"),
("Renault");

insert into model (model) values
("116"),
("Fiesta"),
("City"),
("C200"),
("Kodiaq"),
("Egea"),
("Polo"),
("Sandero"),
("İbiza"),
("Clio");

insert into arac (yıl,marka,model,arac_km,arac_kasko,kiralama_ucreti) Values
(2021,1,1,60.000,true,400),
(2019,2,2,80.000,true,350),
(2013,3,3,80.000,true,200),
(2020,4,4,120.000,true,200),
(2020,5,5,140.000,false,200),
(2017,6,6,200.000,true,150),
(2020,7,7,40.000,true,150),
(2018,8,8,90.000,False,150),
(2019,9,9,100.000,true,150),
(2019,10,10,170.000,false,200);

 insert into musteri (m_ad,m_soyad,m_egitimdurumu,m_adres,m_telefon) Values
 ('Haşim','Parlak','İlkokul Mezunu','Can Sok. No:2 İstanbul',5362582585),
 ('Ahmet','Arif','Ortaokul Mezunu','Kaya Sok. No:29 İstanbul',5565585566),
 ('Kaya','Kağıt','Üniversite Mezunu','Şiir Sok. No:32 İstanbul',5512226548),
 ('Yıldız','Cam','Lise Mezunu','Kitap Sok. No:75 İstanbul',5551116666),
 ('Ayşe','Fatma','Lise Mezunu','Kuş Sok. No:92 İstanbul',5544667878),
 ('Fatma','Çam','Ortaokul Mezunu','Su Sok. No:21 İstanbul',5566655554),
 ('Doğukan','Taş','İlkokul Mezunu','Çeşme Sok. No:55 İstanbul',5566655544),
 ('Volkan','Bayraktar','Üniversite Mezunu','Kedi Sok. No:52 İstanbul',5564455544),
 ('Kasım','Güneş','Lise Mezunu','Köpek Sok. No:32 İstanbul',5561111544),
 ('Caner','Kuş','Ortaokul Mezunu','Ördek Sok. No:12 İstanbul',5564667554);

insert into kiralama (musteri_no,arac_no,p_sicil_no,kiralama_tarihi) values
(1,1,123456,'2020.04.12 12:20:00'),
(2,2,123457,'2020.04.22 19:30:00'),
(3,3,123458,'2020.04.14 11:30:00'),
(4,4,123459,'2020.05.24 15:30:00'),
(5,5,123460,'2020.07.11 17:30:00'),
(6,3,123461,'2020.11.11 11:30:00'),
(7,9,123462,'2020.01.18 16:30:00'),
(8,6,123463,'2020.11.21 13:30:00'),
(9,3,123464,'2020.12.14 23:30:00'),
(10,2,123465,'2020.03.13 18:30:00');

-- Var Olan Aracin Fiyatını Güncellemek 
select * from arac;
Update arac Set kiralama_ucreti=350 where arac_no=1;

-- Musteri Tablosundaki Ismi A Veya D ile Başlayan Musterilerin Hangi Aracları Kiraladıklarını görmek.
 
 
 select m1.musteri_no as musteri_Numarasi, m1.m_ad as Musteri_Adi,
 m1.m_soyad as Musteri_Soyad, k1.arac_no as Arac_Numarasi,
 m2.marka as Araba_Markasi,m3.model as Araba_Modeli
 from musteri m1 
 inner join kiralama k1 on k1.musteri_no=m1.musteri_no
 inner join arac a1 on k1.arac_No=a1.Arac_No
 inner join marka m2 on a1.marka=m2.marka_No
 inner join model m3 on a1.model=m3.model_No
 where m_ad like "A%" or m_ad like "D%";


-- En pahalı aracı kiralayan müşterinin bilgilerini ve arabanın bilgilerini getiren sorguyu yazın.

select m1.musteri_no as Musteri_Numarasi, m1.m_ad as Musteri_Adi,
m1.m_soyad as musteri_Soyad, k1.arac_no as Arac_Numarasi,
m2.marka as Araba_markasi,m3.model as Araba_Modeli
,a1.kiralama_ucreti from musteri m1 
inner join kiralama k1 on k1.musteri_No=m1.Musteri_No
inner join arac a1 on k1.arac_No=a1.arac_no
inner join marka m2 on a1.marka=m2.marka_no
inner join model m3 on a1.model=m3.model_no
ORDER BY a1.kiralama_ucreti DESC limit 1 ;

-- aracları Markalarına Göre Kategorize eden sorgu
select a1.arac_no as Arac_Numarasi, m2.marka as Araba_Markasi ,count(m2.marka) from arac a1 
inner join marka m2 on a1.marka=m2.marka_no
group by a1.marka;

-- Markalarına göre araçların kaç kez kiralandığını veren sorguyu yazın.
select k1.arac_no as Arac_Numarasi,
m2.marka as Araba_Markasi,m3.model as Araba_Modeli
, count(k1.arac_no) from musteri m1 
inner join kiralama k1 on k1.musteri_no=m1.musteri_no
inner join arac a1 on k1.arac_no=a1.arac_no
inner join marka m2 on a1.marka=m2.marka_no
inner join model m3 on a1.model=m3.model_no GROUP BY m2.marka_no;

-- Araç kiralamaya en çok ücret ödeyen müşteriden en az ücret ödeyen müşteriye doğru sıralama yapan sorguyu yazınız
select m1.musteri_no as Musteri_Numarasi, m1.m_ad as Musteri_Adi,
m1.m_soyad as Musteri_Soyad, k1.arac_no as Arac_Numarasi,
m2.marka as Araba_Markasi,m3.model as Araba_Modeli
,a1.kiralama_ucreti from musteri m1 
inner join kiralama k1 on k1.musteri_no=m1.musteri_no
inner join arac a1 on k1.arac_no=a1.arac_no
inner join marka m2 on a1.marka=m2.marka_no
inner join model m3 on a1.model=m3.model_no
ORDER BY a1.kiralama_ucreti DESC;
-- araç km bilgisi ve model bilgisi marka adı

select arac.arac_km,model.model from arac inner join model on arac.model=model.model_no;