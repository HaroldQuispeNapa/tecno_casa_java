<%-- 
    Document   : clientes
    Created on : 12 oct. 2025, 23:30:26
    Author     : efrai
--%>

<%@page import="Modelo.dto.Categoria"%>
<%@page import="Modelo.dto.Marca"%>
<%@page import="Modelo.dto.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/components/dashboard/dashboard.jsp" flush="true" />
<div class="flex-grow-1 p-4" id="main-content">
    <h1 class="mb-4">Gestión de Productos</h1>



    <div class="mb-3">
        <button class="btn btn-primary" id="btn-agregar-producto">Agregar Producto</button>
        <button class="btn btn-warning" id="btn-editar-producto">Editar Producto</button>
        <button class="btn btn-danger" id="btn-eliminar-producto">Eliminar Producto</button>
    </div>

  
    <div class="table-responsive">
        <table class="table table-bordered" id="tabla-productos">  
            <thead class="table-dark">
                <tr class="fila-producto">
                    <th>Seleccionar</th>
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
                    <td>
                        <input type="checkbox" class="seleccion-producto" value="<%= p.getIdProducto()%>">
                    </td>
                    <td><%= p.getIdProducto()%></td>
                    <td><%= p.getModelo()%></td>
                    <td data-id="<%= p.getMarca().getIdMarca()%>"><%= p.getMarca().getNombre()%></td>
                    <td data-id="<%= p.getCategoria().getIdCategoria()%>"><%= p.getCategoria().getNombre()%></td>
                    <td>S/. <%= p.getPrecio()%></td>
                    <td><img src="imgs/<%= p.getImg()%>" width="80" alt="Imagen de <%= p.getModelo()%>"></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No se encontraron productos</td>
                </tr>
                <%
                    }
                %>
            </tbody>

        </table>
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
                    <input type="text" name="modelo" id="modelo" class="form-control mb-2" placeholder="Modelo">
                    <input type="number" name="precio" id="precio" class="form-control mb-2" placeholder="Precio">
                    <input type="file" name="img" id="img" class="form-control mb-2" accept="image/*">
                    <select name="idMarca" id="idMarca" class="form-control mb-2">
                        <%
                            List<Marca> marcas = (List<Marca>) request.getAttribute("marcas");
                            if (marcas != null) {
                                for (Marca m : marcas) {
                        %>
                        <option value="<%= m.getIdMarca()%>"><%= m.getNombre()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                    <select name="idCategoria" id="idCategoria" class="form-control mb-2">
                        <%
                            List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
                            if (categorias != null) {
                                for (Categoria c : categorias) {
                        %>
                        <option value="<%= c.getIdCategoria()%>"><%= c.getNombre()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Guardar</button>
                </div>
            </form>
        </div>
    </div>


</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="module" src="${pageContext.request.contextPath}/js/productos.js"></script>

</body>
</html>
