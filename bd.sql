CREATE DATABASE tecno_casa;
use tecno_casa;

CREATE TABLE usuarios(
	idusuario int primary key auto_increment,
	email varchar(150),
	clave varchar(60),
    nombre varchar(50)
)ENGINE=INNODB;

SELECT * FROM usuarios;