--create database tpo_final
--go
use tpo_final
go


create table reino(
	nom_reino varchar(50) primary key not null,
	continente varchar(20) not null,
	zona varchar (10) check(zona='Norte' or zona='sur' or zona='este' or zona='oeste') not null,
	cant_habitantes_reino int check(cant_habitantes_reino>=0) not null,
	)

create table castillo(
	nom_castillo varchar(50) unique not null,
	fortificacion varchar(20) not null,
	cant_sirvientes int check(cant_sirvientes>=0) not null,
	nom_reino varchar(50) not null,
	constraint fk_reino_castillo foreign key (nom_reino)
	references reino(nom_reino)
	)

create table ciudades(
	ciudad varchar(50) not null,
	nom_reino varchar(50) not null,
	constraint fk_reino_ciudad foreign key (nom_reino)
	references reino(nom_reino)
	)

create table casa(
	nom_casa varchar(50) primary key not null,
	lema varchar(100) not null,
	animal_emblema varchar (20) not null,
	color_emblema varchar(20) not null,
	fundacion varchar(20) not null,
	religion varchar(20) not null,
	nom_reino varchar(50) not null,
	constraint fk_reino_casa foreign key (nom_reino)
	references reino(nom_reino)
	)

create table personaje(
	id_personaje numeric(4) primary key not null,
	nom_personaje varchar(40) not null,
	anio_nacimiento varchar(10) not null,
	bastardo varchar(2) check(bastardo='si' or bastardo='no') not null,
	estatus varchar(8) check(estatus='vivo' or estatus='muerto' or estatus='inactivo')not null,
	inicio_profesion varchar(100),
	nom_casa varchar(50) not null,
	constraint fk_casa_personaje foreign key (nom_casa)
	references casa(nom_casa)
	)

create table profesion(
	nom_profesion varchar(50) primary key not null,
	tipo_profesion varchar(50) not null,
	id_personaje numeric(4) not null,
	constraint fk_personaje_profesion foreign key (id_personaje)
	references personaje(id_personaje)
	)

create table maestro(
	nom_maestro varchar(50) not null,
	nom_profesion varchar(50) not null,
	constraint fk_profesion_maestro foreign key (nom_profesion)
	references profesion(nom_profesion)
	)

create table linaje_padre(
	padre_nom varchar (40),
	anio_nac_padre varchar(10),
	id_personaje  numeric(4) not null,
	constraint fk_personaje_padre foreign key (id_personaje)
	references personaje(id_personaje)
	)

create table linaje_madre(
	madre_nom varchar (40),
	anio_nac_madre varchar(10),
	id_personaje  numeric(4) not null,
	constraint fk_personaje_madre foreign key (id_personaje)
	references personaje(id_personaje)
	)

create table linaje_hijo(
	hijo_nom varchar (40),
	anio_nac_hijo varchar(10),
	id_personaje  numeric(4) not null,
	constraint fk_personaje_hijo foreign key (id_personaje)
	references personaje(id_personaje)
	)

create table especie(
	nom_especie varchar(50) primary key not null,
	extinta varchar(2) check(extinta='si' or extinta='no') not null,
	id_personaje numeric(4) not null,
	constraint fk_personaje_especie foreign key (id_personaje)
	references personaje(id_personaje)
	)

create table habilidades(
	nom_especie varchar(50) not null,
	habilidad varchar(20),
	hostil varchar(2) check(hostil='si' or hostil='no')not null,
	constraint fk_especie_habilidad foreign key (nom_especie)
	references especie(nom_especie)
	)

create table guerra(
	anio_guerra varchar(20) not null,
	lugar_guerra varchar(50) not null,
	cant_muertes varchar(10) not null,
	ganador varchar(50) not null,
	nom_casa varchar(50) not null,
	constraint fk_casa_guerra foreign key (nom_casa)
	references casa(nom_casa)
	)


insert into reino values
('El Norte', 'Poniente', 'norte', 2000000),
('Tierras del Oeste', 'Poniente', 'oeste', 1200000),
('Valle de Arryn', 'Poniente', 'este', 1600000),
('Dorne', 'Poniente', 'sur', 1300000),
('Islas de Hierro', 'Poniente', 'oeste', 900000)
insert into castillo values
('Atalaya de la viuda', 'Torres', 250, 'El Norte'),
('Diez Torres', 'Torres', 163, 'Islas de Hierro'),
('Tor', 'Vallado', 100, 'Dorne'),
('Nido de Aguilas', 'Zanja', 95, 'Valle de Arryn'),
('Colmillo Dorado', 'zanja', 100, 'Tierras del Oeste')
insert into ciudades values
('Kayce', 'Tierras del Oeste'),
('Puerto Gaviota', 'Valle de Arryn'),
('Puerto Blanco', 'El Norte'),
('Pyke', 'Islas de Hierro'),
('Los Tablones', 'Dorne')
insert into casa values
('Martell', '"Nunca doblegado, nunca roto"', 'Sol', 'Naranja', 'Hace unos mil años', 'Catolica', 'Dorne'),
('Greyjoy', '"Nosotros no sembramos"', 'Kraken', 'oro', 'Edad de los heroes', 'Islam', 'Islas de Hierro'),
('Bolton', '"Nuestras espadas estan afiladas"', 'Hombre', 'Rojo', 'Hace mas de mil años', 'Islam', 'El Norte'),
('Lannister de Roca Casterly', '"¡oye mi rugido!', 'Leon', 'Oro', 'Edad de los heroes', 'Catolica', 'Tierras del Oeste'),
('Arryn del Nido de Águilas', '"Tan Alto como el Honor"', 'Halcon', 'Plata', 'No se sabe', 'Messi', 'Valle de Arryn')
insert into guerra values
('6000-4000 Ac', 'Valle de Arryn', 'muchas', 'Andalos', 'Arryn del Nido de Águila'),
('6000-4000 Ac', 'El Norte', 'Muchas', 'Andalos', 'Bolton'),
('6000-4000 Ac', 'Dorne', 'numerosas', 'Andalos', 'Martell'),
('6000-4000 Ac', 'Tierras del Oeste', 'altas', 'Andalos', 'Lannister de Roca Casterly'),
('6000-4000 Ac', 'Islas de Hierro', 'altas', 'Andalos', 'Greyjoy')
insert into personaje values
(0001, 'Jose Perez', '280', 'si', 'inactivo', 'Empezo desde los 10', 'Greyjoy'),
(0002, 'Martin Gonzalez', '263', 'si', 'vivo', 'no tiene', 'Islas de Hierro'),
(0003, 'Mateo Messi', '278', 'si', 'vivo', 'en la Edad de los Heroes', 'Bolton'),
(0004, 'Toni Stark', '230', 'si', 'muerto', 'Desde niño', 'Bolton'),
(0005, 'Bruce Banner', '222', 'no', 'vivo', 'no tiene', 'Dorne')
insert into profesion values
('Arquero', 'Guerra', 0001),
('Caballero', 'Guerra', 0001),
('Herrero', 'Forjar armas', 0003),
('Comerciante', 'Comercio', 0004),
('aquero', 'guerra', 0003)
insert into maestro values
('Cristian', 'Arquero'),
('maria', 'Comerciante'),
('anna', 'Comerciante'),
('juan', 'Caballero'),
('pedro', 'Arquero')
insert into linaje_padre values
('will smith', '193', 0005),
('Clint Gonzalez', '213', 0002),
('Amadeo Perez', '220', 0001),
('Leo Messi', '186', 0003),
('Howard Stark', '176', 0004)
insert into linaje_madre values
('no', 'no', 0001),
('Cristina Rodriguez', '227', 0002),
('Antonella Roccuzzo', '200', 0003),
('Maria Stark', '190', 0004),
('no', 'no', 0005)
insert into linaje_hijo values
('Jose Perez jr', '243', 0001),
('no', 'no', 0002),
('no', 'no', 0003),
('Morgan Stark', '262', 0004),
('no', 'no', 0005)
insert into especie values
('Humano', 'no', 0001),
('Humano', 'no', 0002),
('Fútbol', 'no', 0003),
('Iron Man', 'no', 0004),
('Hulk', 'si', 0005)
insert into habilidades values
('Fúbol', 'Correr', 'no'),
('Iron Man', 'Volar', 'no'),
('Iron Man', 'Indestructible', 'no'),
('Iron Man', 'Ataque a larga distancia', 'no'),
('Hulk', 'fuerza', 'si')

select nom_reino, ciudad
from ciudades

select reino.nom_reino, castillo.nom_castillo
from reino
inner join castillo on reino.nom_reino=castillo.nom_reino

select reino.nom_reino, casa.nom_casa
from reino
inner join casa on reino.nom_reino=casa.nom_reino

select casa.nom_casa, guerra.anio_guerra, guerra.lugar_guerra
from casa
inner join guerra on casa.nom_casa=guerra.nom_casa

select personaje.nom_personaje, personaje.anio_nacimiento, casa.nom_casa
from casa
inner join personaje on casa.nom_casa=personaje.nom_casa

select count(guerra.ganador) as 'cantidad de victorias', guerra.ganador
from guerra
group by guerra.ganador

select personaje.nom_personaje, personaje.anio_nacimiento, especie.nom_especie
from personaje
inner join especie on personaje.id_personaje=especie.id_personaje

create procedure create_reino(
	@nom_reino varchar(50),
	@continente varchar(20),
	@zona varchar(10),
	@cant_habitantes_reino int
	)
as
	
	insert into reino values
	(@nom_reino, @continente, @zona, @cant_habitantes_reino);

create procedure update_reino(
	@nom_reino varchar(50),
	@continente varchar(20),
	@zona varchar(10),
	@cant_habitantes_reino int
	)
as
	
	update reino set continente=@continente, zona=@zona, cant_habitantes_reino=@cant_habitantes_reino where nom_reino=@nom_reino;

create procedure delete_reino(
	@nom_reino varchar(50)
	)
as
	delete from reino where nom_reino=@nom_reino;

create procedure create_castillo(
	@nom_castillo varchar(50),
	@fortificacion varchar(20),
	@cant_sirvientes int,
	@nom_reino varchar(50)
	)
as
	
	insert into castillo values
	(@nom_castillo, @fortificacion, @cant_sirvientes, @nom_reino);

create procedure update_castillo(
	@nom_castillo varchar(50),
	@fortificacion varchar(20),
	@cant_sirvientes int,
	@nom_reino varchar(50)
	)
as
	
	update castillo set fortificacion=@fortificacion, cant_sirvientes=@cant_sirvientes, nom_reino=@nom_reino where nom_castillo=@nom_castillo;

create procedure delete_castillo(
	@nom_castillo varchar(50)
	)
as
	delete from castillo where nom_castillo=@nom_castillo;

create procedure create_ciudades(
	@ciudad varchar(50),
	@nom_reino varchar(50)
	)
as
	
	insert into ciudades values
	(@ciudad, @nom_reino);

create procedure update_ciudades(
	@ciudad varchar(50),
	@nom_reino varchar(50)
	)
as
	
	update ciudades set ciudad=@ciudad where nom_reino=@nom_reino;

create procedure delete_ciudades(
	@ciudad varchar(50)
	)
as
	delete from ciudades where ciudad=@ciudad;

create procedure create_casa(
	@nom_casa varchar(50),
	@lema varchar(100),
	@animal_emblema varchar(20),
	@color_emblema varchar(20),
	@fundacion varchar(20),
	@religion varchar(20),
	@nom_reino varchar(50)
	)
as
	
	insert into casa values
	(@nom_casa, @lema, @animal_emblema, @color_emblema, @fundacion, @religion, @nom_reino);

create procedure update_casa(
	@nom_casa varchar(50),
	@lema varchar(100),
	@animal_emblema varchar(20),
	@color_emblema varchar(20),
	@fundacion varchar(20),
	@religion varchar(20),
	@nom_reino varchar(50)
	)
as
	
	update casa set lema=@lema, animal_emblema=@animal_emblema, color_emblema=@color_emblema, fundacion=@fundacion, religion=@religion, nom_reino=@nom_reino where nom_casa=@nom_casa;

create procedure delete_casa(
	@nom_casa varchar(50)
	)
as
	delete from casa where nom_casa=@nom_casa;

create procedure create_guerra(
	@anio_guerra varchar(20),
	@lugar_guerra varchar(50),
	@cant_muertes varchar(10),
	@ganador varchar(50),
	@nom_casa varchar(50)
	)
as
	
	insert into guerra values
	(@anio_guerra, @lugar_guerra, @cant_muertes, @ganador, @nom_casa);

create procedure update_guerra(
	@anio_guerra varchar(20),
	@lugar_guerra varchar(50),
	@cant_muertes varchar(10),
	@ganador varchar(50),
	@nom_casa varchar(50)
	)
as
	
	update guerra set cant_muertes=@cant_muertes, ganador=@ganador, nom_casa=@nom_casa where anio_guerra=@anio_guerra and lugar_guerra=@lugar_guerra;

create procedure delete_guerra(
	@anio_guerra varchar(20),
	@lugar_guerra varchar(50)
	)
as
	delete from guerra where anio_guerra=@anio_guerra and lugar_guerra=@lugar_guerra;

create procedure create_personaje(
	@id_personaje numeric(4),
	@nom_personaje varchar(40),
	@anio_nacimiento varchar(10),
	@bastardo varchar(2),
	@estatus varchar(8),
	@inicio_profesion varchar(100),
	@nom_casa varchar(50)
	)
as
	
	insert into personaje values
	(@id_personaje, @nom_personaje, @anio_nacimiento, @bastardo, @estatus, @inicio_profesion, @nom_casa);

create procedure update_personaje(
	@id_personaje numeric(4),
	@nom_personaje varchar(40),
	@anio_nacimiento varchar(10),
	@bastardo varchar(2),
	@estatus varchar(8),
	@inicio_profesion varchar(100),
	@nom_casa varchar(50)
	)
as
	
	update personaje set nom_personaje=@nom_personaje, anio_nacimiento=@anio_nacimiento, bastardo=@bastardo, estatus=@estatus, inicio_profesion=@inicio_profesion, nom_casa=@nom_casa where id_personaje=@id_personaje;

create procedure delete_personaje(
	@id_personaje numeric(4)
	)
as
	delete from personaje where id_personaje=@id_personaje;

create procedure create_profesion(
	@nom_profesion varchar(50),
	@tipo_profesion varchar(50),
	@id_personaje numeric(4)
	)
as
	
	insert into profesion values
	(@nom_profesion, @tipo_profesion, @id_personaje);

create procedure update_profesion(
	@nom_profesion varchar(50),
	@tipo_profesion varchar(50),
	@id_personaje numeric(4)
	)
as
	
	update profesion set tipo_profesion=@tipo_profesion, id_personaje=@id_personaje where nom_profesion=@nom_profesion;

create procedure delete_profesion(
	@nom_profesion varchar(50)
	)
as
	delete from profesion where nom_profesion=@nom_profesion;

create procedure create_maestro(
	@nom_maestro varchar(50),
	@nom_profesion varchar(50)
	)
as
	
	insert into maestro values
	(@nom_maestro, @nom_profesion);

create procedure update_maestro(
	@nom_maestro varchar(50),
	@nom_profesion varchar(50)
	)
as
	
	update maestro set nom_maestro=@nom_maestro where nom_profesion=@nom_profesion;

create procedure delete_maestro(
	@nom_maestro varchar(50)
	)
as
	delete from maestro where nom_maestro=@nom_maestro;

create procedure create_linaje_padre(
	@padre_nom varchar(40),
	@anio_nac_padre varchar(10),
	@id_personaje numeric(4)
	)
as
	
	insert into linaje_padre values
	(@padre_nom, @anio_nac_padre, @id_personaje);

create procedure update_linaje_padre(
	@padre_nom varchar(40),
	@anio_nac_padre varchar(10),
	@id_personaje numeric(4)
	)
as
	
	update linaje_padre set padre_nom=@padre_nom, anio_nac_padre=@anio_nac_padre where id_personaje=@id_personaje;

create procedure delete_linaje_padre(
	@padre_nom varchar(40)
	)
as
	delete from linaje_padre where padre_nom=@padre_nom;

create procedure create_linaje_madre(
	@madre_nom varchar(40),
	@anio_nac_madre varchar(10),
	@id_personaje numeric(4)
	)
as
	
	insert into linaje_madre values
	(@madre_nom, @anio_nac_madre, @id_personaje);

create procedure update_linaje_madre(
	@madre_nom varchar(40),
	@anio_nac_madre varchar(10),
	@id_personaje numeric(4)
	)
as
	
	update linaje_madre set madre_nom=@madre_nom, anio_nac_madre=@anio_nac_madre where id_personaje=@id_personaje;

create procedure delete_linaje_madre(
	@madre_nom varchar(40)
	)
as
	delete from linaje_madre where madre_nom=@madre_nom;

create procedure create_linaje_hijo(
	@hijo_nom varchar(40),
	@anio_nac_hijo varchar(10),
	@id_personaje numeric(4)
	)
as
	
	insert into linaje_hijo values
	(@hijo_nom, @anio_nac_hijo, @id_personaje);

create procedure update_linaje_hijo(
	@hijo_nom varchar(40),
	@anio_nac_hijo varchar(10),
	@id_personaje numeric(4)
	)
as
	
	update linaje_hijo set hijo_nom=@hijo_nom, anio_nac_hijo=@anio_nac_hijo where id_personaje=@id_personaje;

create procedure delete_linaje_hijo(
	@hijo_nom varchar(40)
	)
as
	delete from linaje_hijo where hijo_nom=@hijo_nom;

create procedure create_especie(
	@nom_especie varchar(50),
	@extinta varchar(2),
	@id_personaje numeric(4)
	)
as
	
	insert into especie values
	(@nom_especie, @extinta, @id_personaje);

create procedure update_especie(
	@nom_especie varchar(50),
	@extinta varchar(2),
	@id_personaje numeric(4)
	)
as
	
	update especie set extinta=@extinta, id_personaje=@id_personaje where nom_especie=@nom_especie;

create procedure delete_especie(
	@nom_especie varchar(50)
	)
as
	delete from especie where nom_especie=@nom_especie;

create procedure create_habilidad(
	@nom_especie varchar(50),
	@habilidad varchar(20),
	@hostil varchar(2)
	)
as
	
	insert into habilidades values
	(@nom_especie, @habilidad, @hostil);

create procedure update_habilidad(
	@nom_especie varchar(50),
	@habilidad varchar(20),
	@hostil varchar(2)
	)
as
	
	update habilidades set nom_especie=@nom_especie, hostil=@hostil where habilidad=@habilidad;

create procedure delete_habilidad(
	@habilidad varchar(20)
	)
as
	delete from habilidades where habilidad=@habilidad;

