USE tecno_casa;

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
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO Categoria (nombre) VALUES 
('Celular'),
('Televisiones'),
('Lavadora'),
('Refrigerador');

select * from Categoria;

CREATE TABLE Marca (
    idMarca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO Marca (nombre) VALUES 
('SAMSUNG'),
('XIAOMI'),
('ZTE'),
('APPLE'),
('LG'),
('TCL');

select * from Marca;

CREATE TABLE Producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    idMarca INT,
    modelo VARCHAR(250) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    img VARCHAR(250),
    idCategoria INT,
    FOREIGN KEY (idMarca) REFERENCES Marca(idMarca)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

INSERT INTO Producto (idMarca, modelo, precio, img, idCategoria) VALUES
-- Celulares
(1, 'Celular Libre Samsung A07 6.7" 128GB 4GB RAM Negro', 699.00, '137364_1.webp', 1),
(2, 'Celular Libre Xiaomi Redmi A5 6.8" 128GB 4GB RAM', 349.00, '20965704_1.webp', 1),
(3, 'Celular Libre ZTE V60 6.72" 256GB 8GB RAM Negro', 499.00, 'zte_v60_gris_07_2.webp', 1),
(4, 'iPhone 16 Pro Max 256GB Titanio del Desierto', 5499.00, 'iphone_16_pro_max_desert_titanium_pdp_image_position_0__gens.webp', 1),
(1, 'Celular Samsung Galaxy S25 6.2" 128GB 12GB RAM Silver Shadow', 2999.00, '135161_1_1.webp', 1),

-- Televisores
(5, 'Televisor LG Smart TV 55" QNED AI 4K UHD 55QNED82ASG', 1849.00, '136511_01.webp', 2),
(6, 'Televisor TCL Smart TV 75" QLED 4K UHD 75P8K', 2749.00, 'tcl_tv_qled_p8k_75_front_full_specs.webp', 2),
(1, 'Televisor Samsung Smart TV 55" Neo QLED 4K UHD Vision AI QN55QN70FAGXPE', 2299.00, '136546_1.webp', 2),
(1, 'Televisor Samsung Smart TV 65" QLED 4K UHD Vision AI QN65Q8FAAGXPE', 2349.00, '136142_1.webp', 2),
(5, 'Televisor LG Smart TV 55" OLED AI B5 4K UHD OLED55B5PSA', 3599.00, '136166_1.webp', 2),

-- Lavadoras
(5, 'Lavaseca LG WD9PVC4S6 AI DD Carga Frontal 9kg/5kg', 1499.00, '127839_1_1.webp', 3),
(1, 'Lavadora Samsung AI Wash EcoBubble 21kg Negra WA80F21B9BPE', 2199.00, '136036_1_1.webp', 3),

-- Refrigeradoras
(5, 'Refrigeradora LG Top Freezer GT24BPP Door Cooling 241L', 1099.00, '128666_1.webp', 4),
(1, 'Refrigeradora Samsung Side By Side RS60T5200B1/PE 602L', 3999.00, '124589_1_1_2.webp', 4),
(1, 'Refrigeradora Samsung Top Freezer 384Lt All Around Cooling RT38DG6730S9PE', 2099.00, '132796_1_1.webp', 4);

select * from Producto;


CREATE TABLE Reclamo (
    idReclamo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    dni CHAR(8) NOT NULL,
    telefono VARCHAR(9),
    email VARCHAR(100),
    tipo_bien ENUM('Producto', 'Servicio') NOT NULL,
    monto DECIMAL(10,2),
    descripcion VARCHAR(200) NOT NULL,
    tipo_reclamo ENUM('Reclamo', 'Queja') NOT NULL,
    detalle TEXT NOT NULL,
    pedido TEXT NOT NULL
);

select * from reclamo;