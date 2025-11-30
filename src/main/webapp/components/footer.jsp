<%-- 
    Document   : footer
    Created on : 6 set. 2025, 23:56:57
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer class="bg-dark text-light py-4">
    <div class="container d-flex justify-content-between align-items-center">
        <label href="" class="text-decoration-none text-light">Contactanos: +51 97621872</label>
        <a href="https://maps.app.goo.gl/AGZqy1GnmCvpYB19A" class="text-decoration-none text-light">Av. Wilson - Stan #412</a>
        <a href="${pageContext.request.contextPath}/views/preguntas-frecuentes.jsp" class="text-decoration-none text-light">Preguntas Frecuentes</a>
        <a href="${pageContext.request.contextPath}/views/libro-de-reclamaciones.jsp">
            <img src="${pageContext.request.contextPath}/imgs/libro-de-reclamaciones.webp" alt="Libro de reclamaciones" width="200"/>
        </a>
    </div>

    <script>window.APP_CONTEXT = "${pageContext.request.contextPath}";</script>
    <script type="module" src="${pageContext.request.contextPath}/js/buscar-modelo.js"></script>
    
</footer>
