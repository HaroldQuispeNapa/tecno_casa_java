<%-- 
    Document   : navbar
    Created on : 6 set. 2025
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .navbar-retail {
        background-color: #ffffff;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05); 
        padding: 15px 0;
    }

    .logo-text {
        color: #e30613; 
        font-family: 'Inter', sans-serif;
        font-weight: 900;
        font-size: 1.8rem;
        letter-spacing: -1px;
    }

    .search-group .form-control {
        border-radius: 50px 0 0 50px;
        border: 1px solid #ced4da;
        border-right: none; 
        padding-left: 20px;
    }

    .search-group .btn-search {
        border-radius: 0 50px 50px 0;
        background-color: #e30613; 
        color: white;
        border: 1px solid #e30613;
        padding: 0 25px;
        transition: background 0.3s;
    }

    .search-group .btn-search:hover {
        background-color: #c0000b;
    }

    .nav-icon-link {
        color: #333;
        text-decoration: none;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-size: 0.8rem;
        margin-left: 20px;
        transition: color 0.2s;
    }

    .nav-icon-link:hover {
        color: #e30613;
    }

    .nav-icon-link i {
        font-size: 1.5rem;
        margin-bottom: -5px;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-retail sticky-top">
    <div class="container">

        <a class="navbar-brand logo-text" href="${pageContext.request.contextPath}/index.jsp">
            Tecno Casa
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">

            <form class="d-flex mx-auto my-3 my-lg-0" style="width: 100%; max-width: 600px;">
                <div class="input-group search-group">
                    <input id="txt-buscar" class="form-control shadow-none" type="search" placeholder="¿Qué estás buscando hoy?" aria-label="Buscar">
                    <button id="btn-buscar" class="btn btn-search" type="button">
                        <i class="bi bi-search fs-5"></i>
                    </button>
                </div>
            </form>

            <div class="d-flex align-items-center justify-content-end ms-lg-4">


                <div class="dropdown">
                    <a class="nav-icon-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle"></i>
                        <span>
                            <%
                                String usuario = (String) session.getAttribute("usuario");
                                if (usuario != null) {
                                    out.print("Hola, " + usuario);
                                } else {
                                    out.print("Mi Cuenta");
                                }
                            %>
                        </span>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2">
                        <% if (usuario == null) {%>
                        <li><h6 class="dropdown-header">Bienvenido</h6></li>
                        <li><a class="dropdown-item" href="<%= request.getContextPath()%>/views/login.jsp?page=login"><i class="bi bi-box-arrow-in-right me-2"></i>Iniciar Sesión</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<%= request.getContextPath()%>/views/login.jsp?page=register"><i class="bi bi-person-plus me-2"></i>Registrarse</a></li>
                            <% } else {%>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <form action="<%= request.getContextPath()%>/ControladorAuth" method="post" class="m-0">
                                <input type="hidden" name="accion" value="cerrar">
                                <button type="submit" class="dropdown-item text-danger"><i class="bi bi-power me-2"></i>Cerrar Sesión</button>
                            </form>
                        </li>
                        <% }%>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</nav>