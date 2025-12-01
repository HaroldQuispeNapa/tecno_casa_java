<%-- 
    Document   : dashboard (Componente Header + Sidebar)
    Created on : 12 oct. 2025
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Panel Administrativo - Tecno Casa</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">

        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">

    </head>

    <body>

        <div class="d-flex" id="wrapper">

            <div id="sidebar-wrapper">
                <div class="sidebar-heading">
                    TECNO <span class="sidebar-brand-red">CASA</span>
                </div>

                <div class="list-group list-group-flush mt-3">
                    <small class="text-muted px-4 mb-2 text-uppercase fw-bold" style="font-size: 0.75rem;">Administración</small>

                    <a href="${pageContext.request.contextPath}/views/clientes.jsp" class="list-group-item list-group-item-action">
                        <i class="bi bi-people-fill"></i> Clientes
                    </a>

                    <a href="${pageContext.request.contextPath}/views/usuarios.jsp" class="list-group-item list-group-item-action">
                        <i class="bi bi-person-badge-fill"></i> Usuarios
                    </a>

                    <a href="${pageContext.request.contextPath}/ControladorProductos?accion=listar" class="list-group-item list-group-item-action">
                        <i class="bi bi-box-seam-fill"></i> Productos
                    </a>
                    <a href="${pageContext.request.contextPath}/ControladorReclamo?accionAdmin=reclamo" class="list-group-item list-group-item-action">
                        <i class="bi bi-exclamation-octagon-fill"></i> Reclamos
                    </a>
                </div>
            </div>

            <div id="page-content-wrapper">

                <nav class="navbar navbar-expand-lg top-navbar">
                    <div class="container-fluid">
                        <button class="btn btn-link text-dark" id="menu-toggle">
                            <i class="bi bi-list fs-4"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0 align-items-center">

                                <%
                                    String usuario = (String) session.getAttribute("usuario");
                                    String inicial = (usuario != null && usuario.length() > 0) ? usuario.substring(0, 1).toUpperCase() : "U";
                                    if (usuario != null) {
                                %>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="me-2 text-secondary fw-semibold small d-none d-lg-inline"><%= usuario%></span>
                                        <div class="nav-user-img shadow-sm"><%= inicial%></div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end shadow border-0 mt-2" aria-labelledby="navbarDropdown">
                                        <div class="dropdown-divider"></div>

                                        <form action="<%= request.getContextPath()%>/ControladorAuth" method="post" class="m-0">
                                            <input type="hidden" name="accion" value="cerrar">
                                            <button type="submit" class="dropdown-item small text-danger fw-bold">
                                                <i class="bi bi-box-arrow-right me-2"></i>Cerrar Sesión
                                            </button>
                                        </form>
                                    </div>
                                </li>
                                <% }%>
                            </ul>
                        </div>
                    </div>
                </nav>

                <script>
                    document.getElementById("menu-toggle").addEventListener("click", function (e) {
                        e.preventDefault();
                        document.body.classList.toggle("toggled");
                    });
                </script>
