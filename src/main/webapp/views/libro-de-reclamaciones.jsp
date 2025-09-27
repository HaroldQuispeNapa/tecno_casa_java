<%-- 
    Document   : paginaInicio
    Created on : 6 set. 2025, 20:34:56
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <!-- Head.jsp -->
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="Libro de reclamaciones"/>
    </jsp:include>
    <body>

        <!-- Navbar.jsp -->
        <jsp:include page="/components/navbar.jsp" flush="true" />

        <!-- Sección Reclamo -->
        <section class="container my-5">
            <div class="container">
                <img src="../imgs/libro2.png" alt="Libro de reclamaciones" width="300" class="mx-auto d-block"/>
                <form class="col-12 col-md-8 col-lg-6 mx-auto" method="POST">
                    <div>
                        <h4>Identificación del consumidor reclamante</h4>
                        <hr>
                        <div class="mb-3">
                            <label>Nombres *</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>Apellidos *</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>Dirección *</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>DNI *</label>
                            <input type="text" class="form-control" maxlength="8">
                        </div>
                        <div class="mb-3">
                            <label>Teléfono *</label>
                            <input type="text" class="form-control" maxlength="9">
                        </div>
                        <div class="mb-3">
                            <label>Correo electrónico *</label>
                            <input type="email" class="form-control">
                        </div>  
                    </div>

                    <div>
                        <h4>Identificación del bien contratado</h4>
                        <hr>
                        <div class="mb-3">
                            <label>Tipo de Bien *</label>
                            <select class="form-select" aria-label="Default select example">
                                <option selected>Seleccionar el tipo de bien</option>
                                <option value="1">Servicio</option>
                                <option value="2">Producto</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Monto Reclamado *</label>
                            <input type="number" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label>Descripción *</label>
                            <input type="text" class="form-control">
                        </div>
                    </div>

                    <div>
                        <h4>Detalle de la reclamación y pedido del consumidor</h4>
                        <hr>
                        <div class="mb-3">
                            <label>Tipo de Reclamación *</label>
                            <select class="form-select" aria-label="Default select example">
                                <option selected>Seleccionar el tipo de Reclamación</option>
                                <option value="1">Reclamo</option>
                                <option value="2">Queja</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label>Detalle *</label>
                            <textarea type="text" class="form-control" placeholder="¿Qué fue lo que sucedió?" rows="5"></textarea>
                        </div>
                        <div class="mb-3">
                            <label>Pedido *</label>
                            <textarea type="text" class="form-control" placeholder="¿Cuál es tu requerimiento?" rows="5"></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn w-100 btn-lg btn-warning" style="background: #ffc267">Enviar</button>
                </form>

            </div>

        </section>

        <!-- Footer -->
        <jsp:include page="/components/footer.jsp" flush="true" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

