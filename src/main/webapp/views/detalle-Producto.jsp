<%-- 
    Document   : detalleProducto
    Created on : 5 oct. 2025, 14:54:10
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <!-- Head.jsp -->
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="detalles del producto"/>
    </jsp:include>
    <body>


        <!-- Navbar.jsp -->
        <jsp:include page="/components/navbar.jsp" flush="true" />

        <!-- Sección detalle producto -->
        <section class="container py-5">

            <div class="row">
                <div class="col-md-6 text-center">
                    <div class="p-4 border rounded shadow-sm d-inline-block">
                        <img src="${pageContext.request.contextPath}/imgs/137364_1.webp" alt="..." class="img-fluid rounded" style="object-fit: contain;">
                    </div>
                </div>

                <!-- Información del producto -->
                <div class="col-md-6 d-flex flex-column justify-content-center">
                    <h2 class="fw-bold text-uppercase text-secondary mb-2">Samsung</h2>
                    <h4 class="fw-semibold text-dark mb-3">
                        Celular Libre Samsung A07 6.7"<br>128GB 4GB RAM Negro
                    </h4>
                    <p class="fw-bold fs-5 text-muted mb-0">Precio</p>
                    <p class="text-danger fw-bold fs-1 mb-3">S/ 699.00</p>

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

            <!-- ficha tecnica -->
            <div class="mt-5">
                <h4 class="bg-secondary text-white p-3 rounded-top mb-0 text-center">Ficha Técnica</h4>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered align-middle mb-0">
                        <tbody>
                            <tr>
                                <th>Precio</th><td>S/ 699.00</td><th>Marca</th><td>Samsung</td>
                            </tr>
                            <tr>
                                <th>Modelo</th><td>SM-A065MZKELTP</td><th>Categoría</th><td>Celular</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </section>



        <!-- Footer -->
        <jsp:include page="/components/footer.jsp" flush="true" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>