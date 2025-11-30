<%-- 
    Document   : paginaInicio
    Created on : 6 set. 2025, 20:34:56
    Author     : efrai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <!-- Head.jsp -->
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="Tecno Casa"/>
    </jsp:include>
    <body>

        <!-- Navbar.jsp -->
        <jsp:include page="/components/navbar.jsp" flush="true" />


        <!-- Sección Carosuel Productos -->
        <section style="background: #ff0000;">
            <div class="container-fluid py-2">
                <h4 class="text-center mt-0 text-light">Productos TECNOLÓGICOS para el Hogar</h4>
                <h4 class="text-center text-warning">¡Envío a todo el Perú!</h4>
            </div>
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_celular.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_cocina.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_laptops.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_tv.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_refri.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_lavadora.webp" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>

        <!-- Sección Productos -->
        <section>
            <div style="background: #000000;" class="container-fluid py-2">
                <h3 class="text-center text-light display-7">Encuentra lo que necesitas</h3>
            </div>
            <div class="container py-5">
                <div id="contenedor-productos" class="row row-cols-2 row-cols-md-5 g-4">

                    <c:forEach var="p" items="${listaProductos}">
                        <div class="col">
                            <div class="card h-100 shadow-sm">
                                <img src="${pageContext.request.contextPath}/imgs/${p.img}" width="240" height="250" class="card-img-top" alt="">
                                <div class="card-body d-flex flex-column">
                                        <h6 class="text-muted">${p.marca.nombre}</h6>
                                    <p class="card-title flex-grow-1">${p.modelo}</p>
                                    <div class="mt-auto">
                                        <p class="text-danger fw-bold mb-2">S/ ${p.precio}</p>
                                        <a href="./views/detalle-Producto.jsp?id=${p.idProducto}" class="btn btn-danger w-100">Ver Detalle</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>


        <!-- Sección Sugerencias -->
        <section class="container my-5">
            <h2 class="mb-4 text-center">Sugerencias</h2>
            <div class="row align-items-center">
                <div class="col-md-6 text-center">
                    <img src="${pageContext.request.contextPath}/imgs/sugerencia.png" class="img-fluid" alt="Sugerencias">
                </div>
                <div class="col-md-6">
                    <form class="p-4 border rounded shadow-sm bg-light">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" id="nombre" class="form-control" placeholder="Escribe tu nombre">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Correo</label>
                            <input type="email" id="email" class="form-control" placeholder="ejemplo@email.com">
                        </div>
                        <div class="mb-3">
                            <label for="comentario" class="form-label">Comentario</label>
                            <textarea id="comentario" class="form-control" rows="3" placeholder="Escribe tu sugerencia..."></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Enviar</button>
                    </form>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="/components/footer.jsp" flush="true" />
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

