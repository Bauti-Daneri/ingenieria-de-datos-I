use tpo_final_2
go

create table servidor(
	ipe numeric(12) primary key not null,
	nom_servidor varchar(20) not null,
	almacenamiento int  check(almacenamiento>0)not null, --GB
	marca varchar(20)not null,
	oficina varchar(40) not null
	)

create table app(
	id_app numeric(4) primary key not null,
	nom_app varchar(255) not null,
	version_app varchar(10) not null,
	distribuidor varchar(40) not null,
	espacio_necesario int check(espacio_necesario>0) not null --MB
	)


create table computadora(
	id_computadora numeric(8) primary key not null,
	ram int check(ram>0) not null, --GB
	ipe numeric(12) not null,
	id_app numeric(4) not null,
	constraint FK_servidor_compu foreign key (ipe)
	references servidor(ipe),
	constraint FK_app_compu foreign key (id_app)
	references app(id_app)
	)

create table docente(
	dni int primary key check(dni>0) not null,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	domicilio varchar(50) not null,
	id_computadora numeric(8) not null,
	constraint Fk_compu_docente foreign key (id_computadora)
	references computadora(id_computadora)
	)

create table escuela(
	id_escuela numeric(6) primary key not null,
	num_escuela int check(num_escuela>0) not null,
	localidad_escuela varchar(50) not null,
	domicilio varchar(40) not null,
	nom_director varchar(50) not null
	)

create table taller(
	id_taller numeric(4) primary key not null,
	nom_taller varchar(50) not null,
	duracion int check(duracion>0)not null, --minutos
	dni int check(dni>0) not null,
	id_escuela numeric(6) not null,
	constraint fk_docente_taller foreign key (dni)
	references docente(dni),
	constraint fk_escuela_taller foreign key (id_escuela)
	references escuela(id_escuela)
	)


create table servidores_remplazo(
	ip_remplazo numeric(12) primary key not null,
	ipe numeric(12) not null,
	constraint fk_servidor_remplazo foreign key (ipe)
	references servidor(ipe)
	)

create table disco_rigido(
	id_computadora numeric(8) not null,
	marca varchar(20) not null,
	capacidad int check(capacidad>0) not null, --GB
	constraint fk_compu_disco foreign key (id_computadora)
	references computadora(id_computadora)
	)

create table fecha_taller(
	fecha date,
	id_taller numeric(4) not null,
	constraint fk_taller_fecha foreign key (id_taller)
	references taller(id_taller)
	)

create table recursos(
	recurso varchar(20),
	id_taller numeric(4) not null,
	constraint fk_recursos_taller foreign key (id_taller)
	references taller(id_taller)
	)

create table orientacion_escuela(
	orientacion varchar(20) not null,
	id_escuela numeric(6) not null,
	constraint fk_escuela_orientacion foreign key (id_escuela)
	references escuela(id_escuela)
	)


insert into servidor values
(255255255255, 'hugn servidores', 300, 'intel', 'microsoft'),
(255255255192, 'Union servidores', 1000, 'Samsung', 'Union'),
(255255255183, 'Microsoft', 3000000, 'intel', 'microsoft'),
(255255255172, 'Telecom', 240000, 'Azus', 'Fibertel'),
(255255255164, 'Apple', 5000000, 'Mac', 'Apple')
insert into app values
(0865, 'Google', '18.0.12', 'Google LLC', 20),
(0365, 'Office', '15.0.0.1', 'Microsoft Inc', 100),
(1865, 'Zoom', '21.02', 'Google LLC', 15),
(3842, 'Geogebra', '5.0.518.0', 'BYJU', 9),
(1567, 'Kahoot!', '6.0.0', 'ART +COM', 36)
insert into computadora values
(00002341, 2, 255255255255, 0865),
(00002342, 2, 255255255172, 0865),
(00002343, 2, 255255255172, 0365),
(00002344, 2, 255255255192, 3842),
(00002345, 2, 255255255192, 0365)
insert into disco_rigido values
(00002341, 'Seagate', 500),
(00002342, 'Samsung', 500),
(00002343, 'Seagate', 500),
(00002344, 'Seagate', 500),
(00002345, 'Seagate', 500)
insert into docente values
(18754200, 'Daniela', 'Balbusa', '9 de julio 176', 00002341),
(18754203, 'Martin', 'Rodriguez', 'San antonio Norte 222', 00002342),
(18754204, 'Jose', 'Firpo', 'Julio Roca 53', 00002343),
(18754205, 'Anna', 'Benedetti', 'Av Cabildo 2843', 00002344),
(18754206, 'Maria', 'Gonzalez', 'Av Santa Fe 3782', 00002345)
insert into escuela values
(012642, 34, 'Gualeguay', 'San Antonio Norte 148', 'Lautaro Martinez'),
(012319, 189, 'Gualeguay', 'San Antonio Norte 258', 'Leticia Lucero'),
(126410, 190, 'Buenos Aires', 'Av Coronel Diaz 3562', 'Manuel Belgrano'),
(000345, 189, 'Buenos Aires', 'Charcas 3949', 'Leonardo Ponzio'),
(012634, 27, 'Gualeguay', 'Meliton Juarez 25', 'Jorge Sampaoli')
insert into orientacion_escuela values
('Secundario', 012642),
('Secundario', 012319),
('Primario', 126410),
('Bachillerato', 000345),
('Secundario', 012642)
insert into taller values
(0110, 'Literatura', 90, 18754204, 012642),
(0001, 'Informatica', 90, 18754200, 000345),
(0111, 'Salud y Deportes', 90, 18754205, 012319),
(1101, 'Matematica', 120, 18754203, 000345),
(1100, 'Literatura', 40, 18754206, 126410)
insert into recursos values
(null, 0110),
('Proyector', 0111),
('Pantalla', 0111),
('WiFi', 0001),
('Proyector', 1100)
insert into fecha_taller values
('2022/12/07', 0110),
('2022/12/16', 0111),
('2022/12/23', 0111),
('2022/12/12', 0001),
('2023/01/07', 1100)


select computadora.id_computadora, app.nom_app
from computadora
inner join app on computadora.id_app=app.id_app

select computadora.id_computadora, docente.nombre, docente.apellido
from computadora
inner join docente on computadora.id_computadora=docente.id_computadora

select taller.id_taller, docente.nombre, docente.apellido
from docente
inner join taller on docente.dni=taller.dni

select num_escuela, domicilio
from escuela

select taller.nom_taller, recursos.recurso
from taller
inner join recursos on taller.id_taller=recursos.id_taller

select nom_director, num_escuela, localidad_escuela
from escuela

select id_taller, fecha
from fecha_taller


create procedure create_servidor(
	@ipe numeric(12),
	@nom_servidor varchar(20),
	@almacenamiento int,
	@marca varchar(20),
	@oficina varchar(40)
	)
as
	insert into servidor value
	(@ipe, @nom_servidor, @almacenamiento, @marca, @oficina);

create procedure update_servidor(
	@ipe numeric(12),
	@nom_servidor varchar(20),
	@almacenamiento int,
	@marca varchar(20),
	@oficina varchar(40)
	)
as
	update servidor set nom_servidor=@nom_servidor, almacenamiento=@almacenamiento, marca=@marca, oficina=@oficina where ipe=@ipe;

create procedure delete_servidor(
	@ipe numeric(12)
	)
as
	delete from servidor where ipe=@ipe;

create procedure create_app(
	@id_app numeric(4),
	@nom_app varchar(255),
	@version_app varchar(10),
	@distribuidor varchar(40),
	@espacio_necesario int
	)
as
	insert into app values
	(@id_app, @nom_app, @version_app, @distribuidor, @espacio_necesario);

create procedure update_app(
	@id_app numeric(4),
	@nom_app varchar(255),
	@version_app varchar(10),
	@distribuidor varchar(40),
	@espacio_necesario int
	)
as
	update app set nom_app=@nom_app, version_app=@version_app, distribuidor=@distribuidor, espacio_necesario=@espacio_necesario where id_app=@id_app;

create procedure delete_app(
	@id_app numeric(4)
	)
as
	delete from app where id_app=@id_app;

create procedure create_computadora(
	@id_computadora numeric(8),
	@ram int,
	@ipe numeric(12),
	@id_app numeric(4)
	)
as
	insert into computadora values
	(@id_computadora, @ram, @ipe, @id_app);

create procedure update_computadora(
	@id_computadora numeric(8),
	@ram int,
	@ipe numeric(12),
	@id_app numeric(4)
	)
as
	update computadora set ram=@ram, ipe=@ipe, id_app=@id_app where id_computadora=@id_computadora;

create procedure delete_computadora(
	@ipe numeric(12)
	)
as
	delete from computadora where ipe=@ipe;

create procedure create_docente(
	@dni int,
	@nombre varchar(20),
	@apellido varchar(20),
	@domicilio varchar(50),
	@id_computadora numeric(8)
	)
as
	insert into docente values
	(@dni, @nombre, @apellido, @domicilio, @id_computadora);

create procedure update_docente(
	@dni int,
	@nombre varchar(20),
	@apellido varchar(20),
	@domicilio varchar(50),
	@id_computadora numeric(8)
	)
as
	update docente set nombre=@nombre, apellido=@apellido, domicilio=@domicilio, id_computadora=@id_computadora where dni=@dni;

create procedure delete_docente(
	@dni int
	)
as
	delete from docente where dni=@dni;

create procedure create_escuela(
	@id_escuela numeric(6),
	@num_escuela int,
	@localidad_escuela varchar(50),
	@domicilio varchar(40),
	@nom_director varchar(50)
	)
as
	insert into escuela values
	(@id_escuela, @num_escuela, @localidad_escuela, @domicilio, @nom_director);

create procedure update_escuela(
	@id_escuela numeric(6),
	@num_escuela int,
	@localidad_escuela varchar(50),
	@domicilio varchar(40),
	@nom_director varchar(50)
	)
as
	update escuela set num_escuela=@num_escuela, localidad_escuela=@localidad_escuela, domicilio=@domicilio, nom_director=@nom_director where id_escuela=@id_escuela;

create procedure delete_escuela(
	@id_escuela numeric(6)
	)
as
	delete from escuela where id_escuela=@id_escuela;

create procedure create_taller(
	@id_taller numeric(4),
	@nom_taller varchar(50),
	@duracion int,
	@dni int,
	@id_escuela numeric(6)
	)
as
	insert into taller values
	(@id_taller, @nom_taller, @duracion, @dni, @id_escuela);

create procedure update_taller(
	@id_taller numeric(4),
	@nom_taller varchar(50),
	@duracion int,
	@dni int,
	@id_escuela numeric(6)
	)
as
	update taller set nom_taller=@nom_taller, duracion=@duracion, dni=@dni, id_escuela=@id_escuela where id_taller=@id_taller;

create procedure delete_taller(
	@id_taller numeric(4)
	)
as
	delete from taller where id_taller=@id_taller;

create procedure create_servidores_remplazo(
	@ip_remplazo numeric(12),
	@ipe numeric(12)
	)
as
	insert into servidores_remplazo values
	(@ip_remplazo, @ipe);

create procedure update_servidores_remplazo(
	@ip_remplazo numeric(12),
	@ipe numeric(12)
	)
as
	update servidores_remplazo set ipe=@ipe where ip_remplazo=@ip_remplazo;

create procedure delete_servidores_remplazo(
	@ip_remplazo numeric(12)
	)
as
	delete from servidores_remplazo where ip_remplazo=@ip_remplazo;

create procedure create_disco_rigido(
	@id_computadora numeric(8),
	@marca varchar(20),
	@capacidad int
	)
as
	insert into disco_rigido values
	(@id_computadora, @marca, @capacidad);

create procedure update_disco_rigido(
	@id_computadora numeric(8),
	@marca varchar(20),
	@capacidad int
	)
as
	update disco_rigido set marca=@marca, capacidad=@capacidad where id_computadora=@id_computadora;

create procedure delete_disco_rigido(
	@id_computadora numeric(8)
	)
as
	delete from disco_rigido where id_computadora=@id_computadora;

create procedure create_fecha_taller(
	@fecha date,
	@id_taller numeric(4)
	)
as
	insert into fecha_taller values
	(@fecha, @id_taller);

create procedure update_fecha_taller(
	@fecha date,
	@id_taller numeric(4)
	)
as
	update fecha_taller set fecha=@fecha where id_taller=@id_taller;

create procedure delete_fecha_taller(
	@id_taller numeric(4)
	)
as
	delete from fecha_taller where id_taller=@id_taller;

create procedure create_recursos(
	@recurso varchar(20),
	@id_taller numeric(4)
	)
as
	insert into recursos values
	(@recurso, @id_taller);

create procedure update_recursos(
	@recurso varchar(20),
	@id_taller numeric(4)
	)
as
	update recursos set recurso=@recurso where id_taller=@id_taller;

create procedure delete_recursos(
	@id_taller numeric(4)
	)
as
	delete from recursos where id_taller=@id_taller;

create procedure create_orientacion_escuela(
	@orientacion varchar(20),
	@id_escuela numeric(6)
	)
as
	insert into orientacion_escuela values
	(@orientacion, @id_escuela);

create procedure update_orientacion_escuela(
	@orientacion varchar(20),
	@id_escuela numeric(6)
	)
as
	update orientacion_escuela set orientacion=@orientacion where id_escuela=@id_escuela;

create procedure delete_orientacion_escuela(
	@id_escuela numeric(12)
	)
as
	delete from orientacion_escuela where id_escuela=@id_escuela;