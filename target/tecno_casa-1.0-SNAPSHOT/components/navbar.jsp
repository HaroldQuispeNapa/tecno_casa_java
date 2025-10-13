<%-- 
    Document   : navbar
    Created on : 6 set. 2025, 20:52:17
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">Tecno Casa</a>     
        <form class="d-flex mx-auto" style="width: 50%;">
            <input class="form-control me-2" type="search" placeholder="Buscar productos..." aria-label="Buscar">
            <button class="btn btn-outline-dark" style="background: #ffc267" type="button">
              <i class="bi bi-search"></i>
            </button>
        </form>
        <div class="ms-auto">
            <div class="dropdown">
                <% 
                    String usuario = (String) session.getAttribute("usuario");
                    if(usuario != null){
                %>
                    <label class="text-light">Bienvenido, <%= usuario %></label>
                <% } %>

                <a class="btn dropdown-toggle text-light shadow-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-box-arrow-in-right me-2 fs-2"></i>
                </a>

                <ul class="dropdown-menu">
                    <% if(usuario == null){ %>
                        <li><a class="dropdown-item" href="login.jsp?page=register">Registrarte</a></li>
                        <li><a class="dropdown-item" href="login.jsp?page=login">Iniciar Sesión</a></li>
                    <% } else { %>
                        <form action="<%= request.getContextPath() %>/authUser" method="post">
                            <input type="hidden" name="accion" value="cerrar">
                            <button type="submit" class="dropdown-item">Cerrar Sesión</button>
                        </form>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
</nav>
