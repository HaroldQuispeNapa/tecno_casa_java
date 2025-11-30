<%-- 
    Document   : clientes
    Created on : 12 oct. 2025, 23:30:26
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/components/dashboard/dashboard.jsp" flush="true" />
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <!-- DataTables -->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    </head>
    <body>
        <div class="flex-grow-1 p-4" id="main-content">
            <h1>Clientes</h1>

            <table id="clientesTable" class="display">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DNI</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Fecha Nacimiento</th>
                    </tr>
                </thead>
            </table>    
        </div>
    </div>
    <script type="module" src="${pageContext.request.contextPath}/js/clientes.js"></script>
</body>
</html>
