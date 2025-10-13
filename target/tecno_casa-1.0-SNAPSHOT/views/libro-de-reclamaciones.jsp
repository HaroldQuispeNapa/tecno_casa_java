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
                <form class="col-12 col-md-8 col-lg-6 mx-auto" method="POST" id="formReclamos">
                    <div>
                        <h4>Identificación del consumidor reclamante</h4>
                        <hr>
                        <div class="mb-3">
                            <label>Nombres *</label>
                            <input type="text" class="form-control" name="nombre">
                        </div>
                        <div class="mb-3">
                            <label>Apellidos *</label>
                            <input type="text" class="form-control" name="apellido">
                        </div>
                        <div class="mb-3">
                            <label>Dirección *</label>
                            <input type="text" class="form-control" name="direccion">
                        </div>
                        <div class="mb-3">
                            <label>DNI *</label>
                            <input type="text" class="form-control" maxlength="8" name="dni">
                        </div>
                        <div class="mb-3">
                            <label>Teléfono *</label>
                            <input type="text" class="form-control" maxlength="9" name="telefono">
                        </div>
                        <div class="mb-3">
                            <label>Correo electrónico *</label>
                            <input type="email" class="form-control" name="email">
                        </div>  
                    </div>

                    <div>
                        <h4>Identificación del bien contratado</h4>
                        <hr>
                        <div class="mb-3">
                            <label>Tipo de Bien *</label>
                            <select class="form-select" aria-label="Default select example" name="tipo_bien">
                                <option selected value="">Seleccionar el tipo de bien</option>
                                <option value="Servicio">Servicio</option>
                                <option value="Producto">Producto</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Monto Reclamado *</label>
                            <input type="number" class="form-control" name="monto">
                        </div>

                        <div class="mb-3">
                            <label>Descripción *</label>
                            <input type="text" class="form-control" name="descripcion">
                        </div>
                    </div>

                    <div>
                        <h4>Detalle de la reclamación y pedido del consumidor</h4>
                        <hr>
                        <div class="mb-3">
                            <label>Tipo de Reclamación *</label>
                            <select class="form-select" aria-label="Default select example" name="tipo_reclamo">
                                <option selected value="">Seleccionar el tipo de Reclamación</option>
                                <option value="Reclamo">Reclamo</option>
                                <option value="Queja">Queja</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label>Detalle *</label>
                            <textarea type="text" class="form-control" placeholder="¿Qué fue lo que sucedió?" rows="5" name="detalle"></textarea>
                        </div>
                        <div class="mb-3">
                            <label>Pedido *</label>
                            <textarea type="text" class="form-control" placeholder="¿Cuál es tu requerimiento?" rows="5" name="pedido"></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn w-100 btn-lg btn-warning" style="background: #ffc267">Enviar</button>
                </form>

            </div>

        </section>

        <!-- Footer -->
        <jsp:include page="/components/footer.jsp" flush="true" />
        <jsp:include page="/components/modal_editar_reclamo.jsp" />


        <script type="module" src="${pageContext.request.contextPath}/js/reclamos.js"></script>
    </body>
</html>

