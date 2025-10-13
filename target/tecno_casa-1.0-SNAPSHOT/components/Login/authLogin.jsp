<%-- 
    Document   : authLogin
    Created on : 8 set. 2025, 23:55:01
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<form action="${pageContext.request.contextPath}/ControladorAuth" method="post">
    <div class="bg-dark p-3 rounded text-white">
        <input type="hidden" value="login" name="accion">
        <h3> Login de usuario </h3>
        <div class="mb-3">
            <label for="" class="form-label">DNI</label>
            <input type="number" class="form-control" id="dni" name="dni" placeholder="Ingrese numero de DNI" required>
        </div>
        <div class="mb-3">
            <label for="inputPassword" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="clave" name="clave" placeholder="Ingrese su contraseña"required >
        </div>
        
        <div class="d-grid">
            <button type="submit" name class="btn" style="background: #ffc267" >
                Iniciar Session
            </button>
        </div>
        <% if (request.getAttribute("error") != null) {%>
        <p style="color:red;"><%= request.getAttribute("error")%></p>
        <% }%>  
    </div>
    
</form>
