CREATE TABLE Roles (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE Usuario (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_usuario VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
clave VARCHAR(255) NOT NULL,
id_rol INT NOT NULL,
FOREIGN KEY (id_rol) REFERENCES Roles(id)
);

CREATE TABLE Categoria (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR(100) NOT NULL,
descripcion_categoria VARCHAR(255)
);

CREATE TABLE Marca (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_marca VARCHAR(100) NOT NULL
);

CREATE TABLE Producto (
id INT AUTO_INCREMENT PRIMARY KEY,
modelo VARCHAR(100) NOT NULL,
imagen VARCHAR(255),
id_marca INT NOT NULL,
id_categoria INT NOT NULL,
id_usuario INT NOT NULL,
FOREIGN KEY (id_marca) REFERENCES Marca(id),
FOREIGN KEY (id_categoria) REFERENCES Categoria(id),
FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Reclamo (
id INT AUTO_INCREMENT PRIMARY KEY,
correo VARCHAR(100) NOT NULL,
tipo CHAR(1) CHECK (tipo IN ('0', '1')),
descripcion TEXT,
imagen VARCHAR(255),
apellidos VARCHAR(100),
dni VARCHAR(20)
);