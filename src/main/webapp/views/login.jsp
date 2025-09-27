<%-- 
    Document   : login
    Created on : 8 set. 2025, 23:37:19
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Head.jsp -->
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="Login"/>
    </jsp:include>
    <body>
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <%
                        String data = (String) request.getAttribute("page");
                        if (data == null) {
                            data = request.getParameter("page"); // fallback si viene por URL directa
                        }
                        String component = null;
                        if (data != null) {
                            switch (data) {
                                case "login":
                                    component = "/components/Login/authLogin.jsp";
                                    break;
                                case "register":
                                    component = "/components/Login/register.jsp";
                                    break;
                                default:
                                    response.sendRedirect("paginaInicio.jsp");
                                    return;
                            }
                        } else {
                            response.sendRedirect("paginaInicio22.jsp");
                            return;
                        }
                    %>
                    <jsp:include page="<%= component %>" />                   
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </body>
</html>
