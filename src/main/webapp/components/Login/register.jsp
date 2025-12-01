<%-- 
    Document   : register
    Created on : 8 set. 2025
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .auth-card {
        background: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        width: 100%;
    }

    .form-control-retail {
        border: 1px solid #333;
        border-radius: 4px;
        padding: 10px 15px;
        font-size: 0.9rem;
    }

    .form-control-retail:focus {
        box-shadow: none;
        border-color: #e30613;
    }

    .btn-retail-red {
        background-color: #e30613;
        color: white;
        border-radius: 50px;
        padding: 10px 30px;
        font-weight: 700;
        border: none;
        transition: background 0.3s;
        width: 100%;
    }
    .btn-retail-red:hover {
        background-color: #c0000b;
        color: white;
    }
</style>

<div class="auth-card">
    <div class="text-center mb-4">
        <h4 class="fw-bold">Crear Cuenta</h4>
        <p class="text-muted small">Completa tus datos para registrarte</p>
    </div>

    <% if (request.getAttribute("error") != null) {%>
    <div class="alert alert-danger py-2 small mb-3 border-0 bg-danger bg-opacity-10 text-danger">
        <i class="bi bi-exclamation-circle-fill me-1"></i> <%= request.getAttribute("error")%>
    </div>
    <% }%>  

    <form action="${pageContext.request.contextPath}/ControladorAuth" method="post">
        <input type="hidden" value="registrar" name="accion">
        <input type="hidden" name="rol" value="1" />

        <div class="mb-3">
            <label for="dni" class="form-label fw-bold small">DNI *</label>
            <input type="text" 
                   class="form-control form-control-retail" 
                   id="dni" 
                   name="dni" 
                   placeholder="Ingrese DNI (8 dígitos)" 
                   required 
                   minlength="8" 
                   maxlength="8" 
                   pattern="[0-9]{8}" 
                   title="El DNI debe tener exactamente 8 números"
                   inputmode="numeric"
                   oninput="this.value = this.value.replace(/[^0-9]/g, '')">
        </div>

        <div class="row g-2 mb-3">
            <div class="col-6">
                <label for="nombres" class="form-label fw-bold small">Nombres *</label>
                <input type="text" class="form-control form-control-retail" id="nombres" name="nombres" placeholder="Tus nombres" required>
            </div>
            <div class="col-6">
                <label for="apellidos" class="form-label fw-bold small">Apellidos *</label>
                <input type="text" class="form-control form-control-retail" id="apellidos" name="apellidos" placeholder="Tus apellidos" required>
            </div>
        </div>

        <div class="mb-4">
            <label for="clave" class="form-label fw-bold small">Contraseña *</label>
            <div class="input-group">
                <input type="password" class="form-control form-control-retail border-end-0" id="claveReg" name="clave" placeholder="Crea una contraseña" required>
                <span class="input-group-text bg-white border-start-0" style="border: 1px solid #333; border-left: none; cursor: pointer;" onclick="togglePassReg()">
                    <i class="bi bi-eye-slash" id="eyeIconReg"></i>
                </span>
            </div>
        </div>

        <div class="mb-3">
            <button type="submit" class="btn btn-retail-red py-2">
                REGISTRARME
            </button>
        </div>

        <div class="text-center mt-4 pt-3 border-top">
            <span class="text-muted small">¿Ya tienes una cuenta?</span>
            <a href="${pageContext.request.contextPath}/views/login.jsp?page=login" class="fw-bold text-dark text-decoration-none ms-1">
                Inicia sesión aquí
            </a>
        </div>
    </form>
</div>

<script>
    function togglePassReg() {
        const passwordInput = document.getElementById('claveReg');
        const icon = document.getElementById('eyeIconReg');
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.remove('bi-eye-slash');
            icon.classList.add('bi-eye');
        } else {
            passwordInput.type = 'password';
            icon.classList.remove('bi-eye');
            icon.classList.add('bi-eye-slash');
        }
    }
</script>