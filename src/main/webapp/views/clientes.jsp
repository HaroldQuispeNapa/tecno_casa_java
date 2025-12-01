<%-- 
    Document   : clientes
    Created on : 12 oct. 2025
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/components/dashboard/dashboard.jsp" flush="true" />

<style>
    /* Estilos generales de la página */
    .page-title {
        color: #5a5c69;
        font-weight: 400;
        margin-bottom: 1.5rem;
        font-size: 1.75rem;
    }

    /* Estilo de la Tarjeta (Contenedor) */
    .card-datatable {
        background-color: #fff;
        border: 1px solid #e3e6f0;
        border-radius: 0.35rem;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
    }

    /* === CAMBIO AQUÍ: ENCABEZADO NEGRO/OSCURO === */
    #clientesTable thead th {
        background-color: #f8f9fc; /* Fondo gris muy suave */
        color: #212529;            /* NEGRO (En lugar de azul) */
        border-bottom: 2px solid #333; /* Línea inferior un poco más marcada */
        font-weight: 800;          /* Letra más gruesa (Bold) */
        text-transform: uppercase; 
        font-size: 0.85rem;
        vertical-align: middle;
    }
    
    /* Filas del cuerpo */
    #clientesTable tbody td {
        color: #5a5c69;
        vertical-align: middle;
        border-color: #e3e6f0;
    }
    
    /* Paginación en gris oscuro para combinar */
    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        background: #333 !important;
        color: white !important;
        border: 1px solid #333 !important;
    }
</style>

<div class="flex-grow-1 p-4" id="main-content">
    
    <h1 class="page-title">Gestión de Clientes</h1>

    <div class="card card-datatable mb-4">
        <div class="card-body">
            
            <div class="table-responsive">
                <table id="clientesTable" class="table table-striped table-bordered w-100" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DNI</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Fecha Nacimiento</th>
                        </tr>
                    </thead>
                    <tbody>
                        </tbody>
                </table>    
            </div>
            
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="module" src="${pageContext.request.contextPath}/js/clientes.js"></script>