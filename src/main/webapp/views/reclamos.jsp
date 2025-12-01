<%-- 
    Document   : reclamos (Gestión de Reclamos)
    Created on : 12 oct. 2025
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/components/dashboard/dashboard.jsp" flush="true" />

<style>
    /* Estilos consistentes con Usuarios/Clientes */
    .page-title {
        color: #5a5c69;
        font-weight: 400;
        margin-bottom: 1.5rem;
        font-size: 1.75rem;
    }

    .card-datatable {
        background-color: #fff;
        border: 1px solid #e3e6f0;
        border-radius: 0.35rem;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
    }

    /* Encabezado Negro/Oscuro */
    #tablaReclamos thead th {
        background-color: #f8f9fc;
        color: #212529;
        border-bottom: 2px solid #333;
        font-weight: 800;
        text-transform: uppercase;
        font-size: 0.85rem;
        vertical-align: middle;
    }
    
    #tablaReclamos tbody td {
        color: #5a5c69;
        vertical-align: middle;
        border-color: #e3e6f0;
    }
    
    /* Badges de estado (necesarios para que el JS pinte los colores) */
    .badge-estado {
        padding: 0.5em 0.75em;
        font-size: 0.75rem;
        font-weight: 700;
        border-radius: 50px;
        text-transform: uppercase;
    }
    .estado-pendiente { background-color: #ffc107; color: #000; }
    .estado-proceso { background-color: #17a2b8; color: #fff; }
    .estado-resuelto { background-color: #28a745; color: #fff; }
    .estado-rechazado { background-color: #dc3545; color: #fff; }

    /* Botón Rojo Circular */
    .btn-action-danger {
        color: #dc3545;
        border: 1px solid #dc3545;
        background: white;
        border-radius: 50%;
        width: 32px;
        height: 32px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s;
    }
    .btn-action-danger:hover {
        background: #dc3545;
        color: white;
    }
    
    /* Paginación oscura */
    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        background: #333 !important;
        color: white !important;
        border: 1px solid #333 !important;
    }
</style>

<div class="flex-grow-1 p-4" id="main-content">
    
    <h1 class="page-title">Gestión de Reclamos</h1>

    <div class="card card-datatable mb-4">
        <div class="card-body">
            
            <div class="table-responsive">
                <table id="tablaReclamos" class="table table-striped table-bordered w-100" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cliente</th>
                            <th>Bien</th>
                            <th>Monto</th>
                            <th>Descripción</th>
                            <th>Tipo</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody id="tb_reclamo">
                        </tbody>
                    
                </table>    
            </div>
            
        </div>
    </div>
</div>

<jsp:include page="/components/modal_editar_reclamo.jsp" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="module" src="${pageContext.request.contextPath}/js/reclamos.js"></script>