<%-- 
    Document   : paginaInicio
    Created on : 6 set. 2025
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/components/head.jsp">
    <jsp:param name="title" value="Tecno Casa - Inicio"/>
</jsp:include>

<body style="background-color: #f8f9fa;">

    <jsp:include page="/components/navbar.jsp" flush="true" />

    <section class="top-red-bar">
        <div class="container-fluid">
            <h4 class="text-bar-white">Productos TECNOLÓGICOS para el Hogar</h4>
            <h4 class="text-bar-yellow">¡Envío a todo el Perú!</h4>
        </div>
    </section>

    <section class="p-0">
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/imgs/fondo_celular.webp" class="d-block w-100" alt="Celulares" style="max-height: 500px; object-fit: cover;">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/imgs/fondo_laptops.webp" class="d-block w-100" alt="Laptops" style="max-height: 500px; object-fit: cover;">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </button>
        </div>
    </section>

    <section class="bottom-black-bar">
        <div class="container-fluid">
            <h3>Encuentra lo que necesitas</h3>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div id="contenedor-productos" class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
                <c:forEach var="p" items="${listaProductos}">
                    <div class="col">
                        <div class="card-retail">
                            <div class="badge-oferta">PRECIO ONLINE</div>
                            <div class="text-center mb-3" style="height: 180px; display: flex; align-items: center; justify-content: center;">
                                <img src="${pageContext.request.contextPath}/imgs/${p.img}" style="max-height: 100%; max-width: 100%; object-fit: contain;" alt="${p.modelo}">
                            </div>
                            <div class="mt-auto">
                                <small class="text-muted fw-bold">${p.marca.nombre}</small>
                                <h6 class="card-title my-2" style="height: 40px; overflow: hidden;">${p.modelo}</h6>
                                <div class="d-flex align-items-end mb-3">
                                    <div class="me-2">
                                        <h4 class="text-danger fw-bold m-0">S/ <fmt:formatNumber value="${p.precio}" minFractionDigits="2"/></h4>
                                    </div>
                                </div>
                                <a href="./views/detalle-Producto.jsp?id=${p.idProducto}" class="btn btn-retail">
                                    Ver Producto <i class="bi bi-arrow-right-short"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <section class="container my-5 pb-5">
        <h2 class="mb-5 text-center fw-bold" style="color: #333;">Sugerencias</h2>
        <div class="row align-items-center justify-content-center">
            <div class="col-md-5 text-center mb-4 mb-md-0">
                <img src="${pageContext.request.contextPath}/imgs/sugerencia.png" class="img-fluid floating-anim" style="max-height: 250px;" alt="Sugerencias">
            </div>
            <div class="col-md-6">
                <div class="card border rounded-3 shadow-sm bg-white p-4">
                    <form action="TuServletDeSugerencias" method="POST">
                        <div class="mb-3">
                            <label for="nombre" class="form-label text-muted">Nombre</label>
                            <input type="text" id="nombre" name="nombre" class="form-control bg-light" placeholder="Escribe tu nombre">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label text-muted">Correo*</label>
                            <input type="email" id="email" name="email" class="form-control bg-light" placeholder="ejemplo@email.com" required>
                        </div>
                        <div class="mb-3">
                            <label for="comentario" class="form-label text-muted">Comentario*</label>
                            <textarea id="comentario" name="comentario" class="form-control bg-light" rows="4" placeholder="Escribe tu sugerencia..."required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">Enviar</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/components/footer.jsp" flush="true" />

</body>
</html>