<%-- 
    Document   : clientes
    Created on : 12 oct. 2025, 23:30:26
    Author     : efrai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/components/dashboard/dashboard.jsp" flush="true" />

<div class="flex-grow-1 p-4" id="main-content">
    <h1>RECLAMOS</h1>

    <div class="table-responsive mt-4">
        <table class="table table-bordered table-hover" id="tablaReclamos">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Dirección</th>
                    <th>DNI</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Tipo de Bien</th>
                    <th>Monto</th>
                    <th>Descripción</th>
                    <th>Tipo de Reclamo</th>
                    <th>Detalle</th>
                    <th>Pedido</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="tb_reclamo">
                <c:forEach var="r" items="${listaReclamos}" varStatus="status">
                    <tr>
                        <td data-idReclamo="${r.idReclamo}">${status.index + 1}</td>
                        <td>${r.nombre}</td>
                        <td>${r.apellido}</td>
                        <td>${r.direccion}</td>
                        <td>${r.DNI}</td>
                        <td>${r.telefono}</td>
                        <td>${r.email}</td>
                        <td>${r.tipo_bien}</td>
                        <td>${r.monto}</td>
                        <td>${r.descripcion}</td>
                        <td>${r.tipo_reclamo}</td>
                        <td>${r.detalle}</td>
                        <td>${r.pedido}</td>
                        <td>${r.estado}</td>
                        <td class="text-center">
                            <button data-accion="editar" class="btn btn-warning btn-sm btn-editar">
                                <i class="bi bi-pencil-fill"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/components/modal_editar_reclamo.jsp" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="module" src="${pageContext.request.contextPath}/js/reclamos.js"></script>

</body>
</html>