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
        <jsp:param name="title" value="Tecno Casa"/>
    </jsp:include>
<body>

  <!-- Navbar.jsp -->
  <jsp:include page="/components/navbar.jsp" flush="true" />

  
  <!-- Sección Productos -->
  <section class="container" style="background: #ffc267">
        <div>
            <h2 class="text-center mt-3">Productos TECNOLÓGICOS para el Hogar</h2>
            <h4 class="text-center">Envío a todo el Perú</h4>
        </div>
        <div class="row">
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcedfeaec472b72287e1e2.png" class="img-fluid mb-2" alt="Electrodomésticos">
            </div>
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcedfeaec472b72287e1e4.png" class="img-fluid mb-2" alt="Smart Home">
            </div>
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcf15f179ddbfa7ada3187.png" class="img-fluid mb-2" alt="Entretenimiento">
            </div>
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcf15f179ddbfa7ada3188.png" class="img-fluid mb-2" alt="Entretenimiento">
            </div>
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcf1ab903cab61b257608d.png" class="img-fluid mb-2" alt="Entretenimiento">
            </div>
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcf1ab903cab61b257608f.png" class="img-fluid mb-2" alt="Entretenimiento">
            </div>
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcf15f179ddbfa7ada3189.png" class="img-fluid mb-2" alt="Entretenimiento">
            </div>
            <div class="col-md-3 text-center">
                <img src="${pageContext.request.contextPath}/imgs/pixlr-image-generator-68bcf19eec4d6d8c50b4e334.png" class="img-fluid mb-2" alt="Entretenimiento">
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

