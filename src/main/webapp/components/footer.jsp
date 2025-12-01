<%-- 
    Document   : footer
    Created on : 6 set. 2025
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    footer a { transition: color 0.3s ease; }
    footer a:hover { color: #e30613 !important; padding-left: 5px; }
    .social-icon { font-size: 1.5rem; transition: transform 0.2s; }
    .social-icon:hover { transform: translateY(-3px); color: #e30613 !important; }
</style>

<footer class="bg-dark text-light pt-5 pb-3 mt-auto">
    <div class="container">
        <div class="row g-4 justify-content-between">
            
            <div class="col-12 col-md-4">
                <h5 class="text-uppercase fw-bold mb-3" style="color: #e30613;">Tecno Casa</h5>
                <ul class="list-unstyled text-muted small">
                    <li class="mb-2 d-flex align-items-start">
                        <i class="bi bi-geo-alt-fill me-2 text-light"></i>
                        <a href="https://maps.google.com/?q=Av.+Wilson+-+Stan+%23412" target="_blank" class="text-decoration-none text-secondary">
                            Av. Wilson - Stan #412<br>Lima, Perú
                        </a>
                    </li>
                    <li class="mb-2 d-flex align-items-center">
                        <i class="bi bi-whatsapp me-2 text-light"></i>
                        <a href="https://wa.me/5197621872" target="_blank" class="text-decoration-none text-secondary">
                            +51 976 218 722
                        </a>
                    </li>
                    <li class="mb-2 d-flex align-items-center">
                        <i class="bi bi-envelope-fill me-2 text-light"></i>
                        <span class="text-secondary">contacto@tecnocasa.com</span>
                    </li>
                </ul>
                
                <div class="mt-4">
                    <a href="#" class="text-light me-3 social-icon"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-light me-3 social-icon"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-light me-3 social-icon"><i class="bi bi-tiktok"></i></a>
                </div>
            </div>

            <div class="col-12 col-md-4">
                <h5 class="text-uppercase fw-bold mb-3 text-light">Te Ayudamos</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/views/preguntas-frecuentes.jsp" class="text-decoration-none text-secondary">Preguntas Frecuentes</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-secondary">Términos y Condiciones</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-secondary">Políticas de Envío</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-secondary">Seguimiento de Pedido</a></li>
                </ul>
            </div>

            <div class="col-12 col-md-4 text-md-end">
                <div class="mb-4">
                    <a href="${pageContext.request.contextPath}/views/libro-de-reclamaciones.jsp">
                        <img src="${pageContext.request.contextPath}/imgs/libro-de-reclamaciones.webp" alt="Libro de reclamaciones" class="img-fluid rounded border border-light" style="max-width: 180px; opacity: 0.9;"/>
                    </a>
                </div>
                
                <div>
                    <h6 class="text-muted mb-2 small text-uppercase">Medios de Pago</h6>
                    <div class="d-flex gap-2 justify-content-md-end">
                        <i class="bi bi-credit-card-2-front fs-3 text-secondary"></i>
                        <i class="bi bi-paypal fs-3 text-secondary"></i>
                        <i class="bi bi-cash-coin fs-3 text-secondary"></i>
                    </div>
                </div>
            </div>
        </div>

        <hr class="my-4 border-secondary">

        <div class="row">
            <div class="col-12 text-center">
                <small class="text-secondary">© 2025 <strong>Tecno Casa</strong>. Todos los derechos reservados.</small>
            </div>
        </div>
        
    </div>

    <script>window.APP_CONTEXT = "${pageContext.request.contextPath}";</script>
    <script type="module" src="${pageContext.request.contextPath}/js/buscar-modelo.js"></script>
    
</footer>