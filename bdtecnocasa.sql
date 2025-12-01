USE tecno_casa;

CREATE TABLE Roles (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_rol VARCHAR(50) NOT NULL
);

INSERT INTO Roles (nombre_rol)values("Cliente"),("Administrador");
select * from Roles;

CREATE TABLE Usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
dni CHAR(8) NOT NULL UNIQUE,
clave VARCHAR(255) NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellidos VARCHAR(255) NOT NULL,
fecha_nacimiento VARCHAR(50) NOT NULL,
id_rol INT NOT NULL,
FOREIGN KEY (id_rol) REFERENCES Roles(id)
);

INSERT INTO Usuarios (dni, clave, nombres, apellidos, fecha_nacimiento, id_rol) VALUES
('12345678', 'admin123', 'Carlos', 'Ramírez', '15-12-2004', 2), -- Administrador
('87654321', 'admin456', 'María', 'Gonzales', '15-12-2004', 2), -- Administrador
('11223344', 'cliente123', 'Juan', 'Pérez', '15-12-2004', 1), -- Cliente
('44332211', 'cliente456', 'Ana', 'Torres', '15-12-2004', 1); -- Cliente


SELECT 
    u.id,
    u.dni,
    u.clave,
    u.nombres,
    u.apellidos,
    u.fecha_nacimiento,
    r.nombre_rol
FROM Usuarios u
INNER JOIN Roles r
    ON u.id_rol = r.id;


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
    pedido TEXT NOT NULL,
    estado ENUM('Pendiente', 'Proceso', 'Resuelto') NOT NULL DEFAULT 'Pendiente'
);

INSERT INTO Reclamo (nombre, apellido, direccion, dni, telefono, email, tipo_bien, monto, descripcion, tipo_reclamo, detalle, pedido, estado) VALUES 
('Juan', 'Pérez', 'Av. Arequipa 1234, Lince', '45678901', '987654321', 'juan.perez@gmail.com', 
'Producto', 5499.00, 
'Falla de pantalla en iPhone 16', 
'Reclamo', 
'El dispositivo presenta una línea verde vertical en la pantalla tras 3 días de uso sin haber sufrido caídas.', 
'Cambio inmediato del equipo por uno nuevo.', 
'Pendiente'),

('María', 'Gómez', 'Jr. de la Unión 550, Lima', '10293847', '912345678', 'maria.gomez@hotmail.com', 
'Servicio', 1849.00, 
'Incumplimiento de fecha de entrega', 
'Queja', 
'Compré el TV LG QNED hace una semana. La entrega estaba programada para ayer y no llegaron ni avisaron.', 
'Entrega inmediata y exoneración del costo de envío.', 
'Proceso'),

('Carlos', 'Ruiz', 'Calle Los Pinos 120, Miraflores', '72635412', '998877665', 'cruiz.arq@yahoo.com', 
'Producto', 2199.00, 
'Producto golpeado estéticamente', 
'Reclamo', 
'Al desembalar la Lavadora Samsung AI Wash, noté una abolladura en el panel lateral izquierdo.', 
'Descuento sobre el precio o cambio de producto.', 
'Pendiente'),

('Ana', 'Torres', 'Av. Javier Prado Este 4500, Surco', '09182736', '955443322', 'ana.torres90@gmail.com', 
'Servicio', 0.00, 
'Mala atención en tienda', 
'Queja', 
'El vendedor de la sección de telefonía fue grosero cuando pedí información sobre el Xiaomi Redmi A5.', 
'Solicito una disculpa formal y capacitación al personal.', 
'Resuelto'),

('Luis', 'Fernández', 'Urb. San José Mz B Lt 4, Callao', '44556677', '966778899', 'lucho.fernandez@outlook.com', 
'Producto', 3999.00, 
'Refrigeradora no congela', 
'Reclamo', 
'La Refrigeradora Samsung Side By Side no está haciendo hielo y el congelador no mantiene la temperatura.', 
'Visita técnica para reparación por garantía.', 
'Proceso'),

('Sofía', 'Vargas', 'Av. Brasil 300, Jesus Maria', '88223344', '911223344', 'sofia.vargas@gmail.com', 
'Producto', 2749.00, 
'Características no coinciden', 
'Reclamo', 
'El Televisor TCL decía incluir un control remoto mágico en la web, pero llegó con uno estándar.', 
'Entrega del accesorio faltante.', 
'Pendiente');

select * from reclamo;

-- SUGERENCIAS
CREATE TABLE sugerencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255),
    comentario TEXT,
    created_at DATE DEFAULT(NOW())
);

INSERT INTO sugerencias (nombre, correo, comentario)
VALUES
('Juan Pérez', 'juan@example.com', 'Me gusta mucho la página, sigan así.'),
('María López', 'maria@example.com', 'Sería genial agregar más categorías.'),
('Carlos Ruiz', 'carlos@example.com', 'Encontré un error en la sección de contacto.');



