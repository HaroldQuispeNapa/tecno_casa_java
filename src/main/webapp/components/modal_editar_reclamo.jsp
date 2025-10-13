<%-- 
    Document   : modal_editar_reclamo
    Created on : 12 oct. 2025, 22:35:11
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="modal_editar_reclamo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="titulo_modal"></h1>
            </div>
            <div class="modal-body">
                <form id="form_modal">
                    <input type="hidden" name="idReclamo" id="idReclamo">

                    <div class="mb-3">
                        <label>Nombre*</label>
                        <input type="text" class="form-control" name="nombre" id="nombre_reclamo_editar" required>
                    </div>

                    <div class="mb-3">
                        <label>Apellido*</label>
                        <input type="text" class="form-control" name="apellido" id="apellido_reclamo_editar" required>
                    </div>

                    <div class="mb-3">
                        <label>Dirección*</label>
                        <input type="text" class="form-control" name="direccion" id="direccion_reclamo_editar" required>
                    </div>

                    <div class="mb-3">
                        <label>DNI*</label>
                        <input type="text" class="form-control" name="dni" id="dni_reclamo_editar" maxlength="8" required>
                    </div>

                    <div class="mb-3">
                        <label>Teléfono</label>
                        <input type="text" class="form-control" name="telefono" id="telefono_reclamo_editar" maxlength="9">
                    </div>

                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" id="email_reclamo_editar">
                    </div>

                    <div class="mb-3">
                        <label>Tipo de Bien*</label>
                        <select class="form-select" name="tipo_bien" id="tipo_bien_reclamo_editar" required>
                            <option value="">--Seleccione--</option>
                            <option value="Producto">Producto</option>
                            <option value="Servicio">Servicio</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Monto</label>
                        <input type="number" class="form-control" name="monto" id="monto_reclamo_editar" step="0.01">
                    </div>

                    <div class="mb-3">
                        <label>Descripción*</label>
                        <input type="text" class="form-control" name="descripcion" id="descripcion_reclamo_editar" required>
                    </div>

                    <div class="mb-3">
                        <label>Tipo de Reclamo*</label>
                        <select class="form-select" name="tipo_reclamo" id="tipo_reclamo_editar" required>
                            <option value="">--Seleccione--</option>
                            <option value="Reclamo">Reclamo</option>
                            <option value="Queja">Queja</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Detalle*</label>
                        <textarea class="form-control" name="detalle" id="detalle_reclamo_editar" rows="3" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label>Pedido*</label>
                        <textarea class="form-control" name="pedido" id="pedido_reclamo_editar" rows="3" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="estado_reclamo">Estado*</label>
                        <select class="form-select" name="estado" id="estado_reclamo" required>
                            <option value="">--Seleccione--</option>
                            <option value="Pendiente">Pendiente</option>
                            <option value="Proceso">Proceso</option>
                            <option value="Resuelto">Resuelto</option>
                        </select>
                    </div>

                    <div class="modal-footer w-100">
                        <div class="row w-100">
                            <div class="col-6">
                                <button type="button" class="btn btn-outline-danger w-100" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                            <div class="col-6">
                                <button type="submit" class="btn btn-outline-dark w-100">Actualizar</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

