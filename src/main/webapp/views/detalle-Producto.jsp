<%-- 
    Document   : detalleProducto
    Created on : 5 oct. 2025, 14:54:10
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="Detalles del producto"/>
    </jsp:include>
    <body>

        <jsp:include page="/components/navbar.jsp" flush="true" />

        <section class="container py-5">

            <div class="row">
                <div class="col-md-6 text-center">
                    <div class="p-4 border rounded shadow-sm d-inline-block">
                        <img id="prod-img" src="" alt="Cargando..." class="img-fluid rounded" style="object-fit: contain; max-height: 400px;">
                    </div>
                </div>

                <div class="col-md-6 d-flex flex-column justify-content-center">

                    <h2 id="prod-marca-titulo" class="fw-bold text-uppercase text-secondary mb-2">
                        Cargando...
                    </h2>

                    <h4 id="prod-modelo" class="fw-semibold text-dark mb-3">
                        Por favor espere...
                    </h4>

                    <p class="fw-bold fs-5 text-muted mb-0">Precio</p>

                    <p id="prod-precio" class="text-danger fw-bold fs-1 mb-3">
                        S/ --.--
                    </p>

                    <div class="d-flex align-items-center mb-4">
                        <label for="cantidad" class="me-2 fw-semibold">Cantidad:</label>
                        <div class="input-group" style="width: 120px;">
                            <button class="btn btn-outline-secondary">-</button>
                            <input type="text" id="cantidad" class="form-control text-center" value="1">
                            <button class="btn btn-outline-secondary">+</button>
                        </div>
                    </div>

                    <div>
                        <button class="btn btn-danger btn-lg px-4 me-3">
                            <i class="bi bi-cart-fill me-1"></i> Añadir al carrito
                        </button>
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h4 class="bg-secondary text-white p-3 rounded-top mb-0 text-center">Ficha Técnica</h4>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered align-middle mb-0" style="table-layout: fixed; width: 100%;">
                        <tbody>
                            <tr>
                                <th class="bg-light" style="width: 15%;">Precio</th>

                                <td style="width: 35%;" id="ficha-precio">...</td> 

                                <th class="bg-light" style="width: 15%;">Marca</th>

                                <td style="width: 35%;" id="ficha-marca">...</td> 
                            </tr>
                            <tr>
                                <th>Modelo</th>
                                <td id="ficha-modelo" class="text-break">...</td> <th>Categoría</th>
                                <td id="ficha-categoria">...</td> 
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </section>

        <br>
        <br>

        <jsp:include page="/components/footer.jsp" flush="true" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>window.APP_CONTEXT = "${pageContext.request.contextPath}";</script>

        <script type="module" src="${pageContext.request.contextPath}/js/detalle-producto.js"></script>
        <script type="module" src="${pageContext.request.contextPath}/js/detalle-producto.js"></script>

    </body>
</html>