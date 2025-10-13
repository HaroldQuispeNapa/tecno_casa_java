<%-- 
    Document   : dashboard
    Created on : 12 oct. 2025, 23:27:45
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Panel Empresarial</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <span class="navbar-brand">Panel de Administrador</span>
    <div class="ms-auto text-white">
      👤 Juan Pérez
    </div>
  </div>
</nav>

<div class="d-flex">
  <!-- Sidebar -->
  <div class="bg-primary text-white vh-100" style="width: 230px;">
    <h5 class="text-center py-3">Menú</h5>
    <ul class="list-group list-group-flush">
        <a href="clientes.jsp" class="list-group-item bg-primary text-white border-0" style="cursor:pointer;">Clientes</a>
        <a href="usuarios.jsp" class="list-group-item bg-primary text-white border-0" style="cursor:pointer;">Usuarios</a>
        <a href="productos.jsp" class="list-group-item bg-primary text-white border-0" style="cursor:pointer;">Productos</a>
        <a href="reclamos.jsp" class="list-group-item bg-primary text-white border-0" style="cursor:pointer;">Reclamos</a>
    </ul>
  </div>

</body>
</html>

