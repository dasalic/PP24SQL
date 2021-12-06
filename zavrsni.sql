drop database if exists zavrsni;
create database zavrsni character set utf8;
use zavrsni; --default_character_set=utf8 < d:\skriptapp24.sql

create table kupac(
    sifra   int not null primary key auto_increment,
    ime     varchar(50) not null,
    prezime varchar(50) not null,
    grad varchar(255),
    ulica varchar(255),
    broj char(5),
    kontakt varchar(50) not null,
    email   varchar(50) not null,
    napomena varchar(255),
    brojkupca int
);
create table kosarica(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2),
    kolicina int,
    brojnarudzbe decimal(18,2),
    proizvod varchar(50) not null
);
create table narudzba(
    sifra int not null primary key auto_increment,
    brojnarudzbe decimal(18,2) not null,
    kupac varchar(50),
    dostavnasluzba varchar(50) not null,
    vrstaplacanja varchar(50) not null,
    brojproizvoda int not null,
    datumdostave datetime
);

create table proizvod(
    sifra           int not null primary key auto_increment,
    naziv           varchar(50) not null,
    cijena          decimal(18,2),
    kolicina         decimal (18,2),
    brojproizvoda int not null
    );

alter table kupac add foreign key (brojkupca) references narudzba(sifra);
alter table narudzba add foreign key (brojproizvoda) references proizvod(sifra);
alter table proizvod add foreign key (brojproizvoda) references  kosarica(sifra);
alter table narudzba add foreign key (brojproizvoda) references kosarica(sifra);
