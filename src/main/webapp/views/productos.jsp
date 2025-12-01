<%-- 
    Document   : productos
    Created on : 12 oct. 2025
    Author     : efrai
--%>

<%@page import="Modelo.dto.Categoria"%>
<%@page import="Modelo.dto.Marca"%>
<%@page import="Modelo.dto.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/components/dashboard/dashboard.jsp" flush="true" />

<style>
    /* Estilos para la tabla limpia (como en la imagen anterior) */
    .card-datatable {
        background-color: #fff;
        border: 1px solid #e3e6f0;
        border-radius: 0.35rem;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
    }
    
    .page-title {
        color: #5a5c69;
        font-weight: 400;
        margin-bottom: 1.5rem;
    }

    /* === NUEVOS ESTILOS PARA LOS BOTONES (SEGÚN TU IMAGEN) === */
    
    /* 1. Botón "Nuevo Producto" (Rojo sólido) */
    .btn-nuevo {
        background-color: #e30613; /* Rojo Retail */
        color: white;
        font-weight: 600;
        border: none;
        padding: 8px 20px;
        border-radius: 6px;
        transition: background 0.3s;
    }
    .btn-nuevo:hover {
        background-color: #c0000b;
        color: white;
    }

    /* 2. Grupo de Botones Editar/Eliminar (Fondo blanco) */
    .btn-group-custom .btn {
        background-color: #fff;
        border: 1px solid #dee2e6;
        color: #495057; /* Gris oscuro para texto */
        font-weight: 500;
        padding: 8px 20px;
    }

    .btn-group-custom .btn:hover {
        background-color: #f8f9fa;
    }

    /* Colores específicos para los iconos y textos */
    .btn-edit-custom { color: #495057; }
    .btn-edit-custom i { color: #6c757d; margin-right: 5px; } /* Lápiz gris azulado */

    .btn-delete-custom { color: #dc3545 !important; } /* Texto rojo */
    .btn-delete-custom i { color: #dc3545; margin-right: 5px; } /* Basurero rojo */

    /* Separación entre el botón rojo y el grupo */
    .toolbar-gap { gap: 15px; }
</style>

<div class="flex-grow-1 p-4" id="main-content">
    
    <h1 class="page-title h3 text-gray-800">Productos</h1>

    <div class="card card-datatable mb-4">
        <div class="card-body">
            
            <div class="d-flex align-items-center toolbar-gap mb-4">
                
                <button class="btn btn-nuevo shadow-sm" id="btn-agregar-producto">
                    <i class="bi bi-plus-lg me-1"></i> Nuevo Producto
                </button>

                <div class="btn-group btn-group-custom shadow-sm" role="group">
                    <button type="button" class="btn btn-edit-custom" id="btn-editar-producto">
                        <i class="bi bi-pencil"></i> Editar
                    </button>
                    <button type="button" class="btn btn-delete-custom" id="btn-eliminar-producto">
                        <i class="bi bi-trash3"></i> Eliminar
                    </button>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered w-100" id="tabla-productos">  
                    <thead>
                        <tr>
                            <th style="width: 30px;">#</th> 
                            <th>ID</th>
                            <th>Modelo</th>
                            <th>Marca</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>Imagen</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Producto> productos = (List<Producto>) request.getAttribute("productos");
                            if (productos != null && !productos.isEmpty()) {
                                for (Producto p : productos) {
                        %>
                        <tr>
                            <td class="text-center">
                                <input type="checkbox" class="seleccion-producto form-check-input" value="<%= p.getIdProducto()%>">
                            </td>
                            <td><%= p.getIdProducto()%></td>
                            <td><%= p.getModelo()%></td>
                            <td data-id="<%= p.getMarca().getIdMarca()%>"><%= p.getMarca().getNombre()%></td>
                            <td data-id="<%= p.getCategoria().getIdCategoria()%>"><%= p.getCategoria().getNombre()%></td>
                            <td>S/. <%= p.getPrecio()%></td>
                            <td class="text-center">
                                <img src="imgs/<%= p.getImg()%>" width="50" height="50" style="object-fit: contain;" alt="img">
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="modalProducto" tabindex="-1">
        <div class="modal-dialog">
            <form id="formProducto" class="modal-content" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title">Formulario Producto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="idProducto" id="idProducto">
                    
                    <div class="mb-3">
                        <label class="form-label">Modelo</label>
                        <input type="text" name="modelo" id="modelo" class="form-control" placeholder="Modelo">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Precio</label>
                        <input type="number" step="0.01" name="precio" id="precio" class="form-control" placeholder="Precio">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Imagen</label>
                        <input type="file" name="img" id="img" class="form-control" accept="image/*">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Marca</label>
                        <select name="idMarca" id="idMarca" class="form-select">
                            <%
                                List<Marca> marcas = (List<Marca>) request.getAttribute("marcas");
                                if (marcas != null) for (Marca m : marcas) {
                            %>
                            <option value="<%= m.getIdMarca()%>"><%= m.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Categoría</label>
                        <select name="idCategoria" id="idCategoria" class="form-select">
                            <%
                                List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
                                if (categorias != null) for (Categoria c : categorias) {
                            %>
                            <option value="<%= c.getIdCategoria()%>"><%= c.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-success">Guardar</button>
                </div>
            </form>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="module" src="${pageContext.request.contextPath}/js/productos.js"></script>