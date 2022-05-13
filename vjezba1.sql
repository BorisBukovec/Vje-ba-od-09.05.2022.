# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\botao\EdunovaPP25-11\SQL\vjezba1.sql
drop database if exists knjiga;
create database knjiga default charset utf8mb4;
use knjiga;

create table katalog(
    sifra int not null primary key auto_increment,
    autor int not null,
    naslov varchar(50),
    izdavac int not null,
    mjesto int not null
);
create table autor(
   sifra int not null primary key auto_increment,
   ime varchar (50),
   prezime varchar (50),
   datumrodenja datetime 
);
create table izdavac(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    aktivan boolean
);
create table mjesto(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    postanskibroj varchar(10),
    drzava varchar(50)
);
alter table autor change sifra sifra int not null;
drop table autor;
drop table izdavac;
drop table katalog;
drop table mjesto;

create table autor(
    sifra int not null primary key,
    ime varchar (50) not null,
    prezime varchar (100) not null,
    datumrodenja datetime
);
create table izdavac(
    sifra int not null primary key,
    naziv varchar (100) not null,
    aktivan boolean
);
create table mjesto(
    sifra int not null primary key,
    naziv varchar(100) not null,
    postanskiBroj varchar(50)
);
create table katalog(
    sifra int not null primary key,
    autor int,
    naslov varchar(100) not null,
    izdavac int,
    mjesto int,
    cijena decimal(18,2)
);
alter table katalog add foreign key (autor) references autor (sifra);
alter table katalog add foreign key (izdavac) references izdavac (sifra);
alter table katalog add foreign key (mjesto) references mjesto (sifra);

CREATE INDEX naziv_index ON katalog(naslov);

INSERT into mjesto (sifra, naziv,drzava)
values (2,'Kopenagen','Danska');
INSERT into mjesto (naziv, sifra, drzava, postanskiBroj)
values ('Rijeka', 3, 'Hrvatska', '51000');
INSERT into mjesto (naziv, sifra, drzava, postanskiBroj)
values ('osijek', 4, 'Hrvaska', '31000');
INSERT into autor (sifra, ime, prezime, datumrodenja)
values (1,'Ivana','Brlić Mažuranić', '1874-04-18');
INSERT into autor (sifra, ime, prezime, datumrodenja)
values (2,'August','Šenoa', '1838-11-14');
INSERT into autor (sifra, ime, prezime, datumrodenja)
values (3,'Robert','Preišić', null);
INSERT into izdavac (sifra, naziv)
values (1,'Hrvatska revija');
INSERT into izdavac (sifra, naziv)
values (2,'Lavendel og rosmarin');
INSERT into izdavac (sifra, naziv)
values (3,'Riječ');
INSERT into izdavac (sifra, naziv)
values (4,'Biblioteka ON LINE');
INSERT into izdavac (sifra, naziv)
values (5,'Hrvatski pedagoški književni zbor');
INSERT into katalog (sifra, autor, naslov, izdavac, mjesto)
values (1, 1, 'Mir u Duši', 1, 1);