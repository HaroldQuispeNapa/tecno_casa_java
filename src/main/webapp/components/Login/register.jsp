<%-- 
    Document   : register
    Created on : 8 set. 2025, 23:55:01
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form action="${pageContext.request.contextPath}/ControladorAuth" method="post">
    <div class="bg-dark p-3 rounded text-white">
        <input type="hidden" value="registrar" name="accion">
        <h3> Registro de usuario </h3>
        <div class="mb-3">
            <label for="staticEmail" class="form-label">DNI</label>
            <input type="number" class="form-control" id="dni" name="dni" placeholder="Ingrese su DNI" required >
        </div>

        <div class="mb-3">
            <label for="inputPassword" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="clave" name="clave" placeholder="Ingrese su contraseña"required >
        </div>
        
        <div class="mb-3">
            <label for="" class="form-label">Nombres</label>
            <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Ingrese sus nombres" required>
        </div>
        
        <div class="mb-3">
            <label for="" class="form-label">Apellidos</label>
            <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Ingrese sus apellidos" required>
        </div>
        <input type="hidden" name="rol" value="1" />
        
        <div class="d-grid">
            <button type="submit" name class="btn" style="background: #ffc267" >
                Enviar
            </button>
        </div>
        <% if (request.getAttribute("error") != null) {%>
        <p style="color:red;"><%= request.getAttribute("error")%></p>
        <% }%>  
    </div>
    
</form>
