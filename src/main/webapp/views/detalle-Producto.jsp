<%-- 
    Document   : detalleProducto
    Created on : 5 oct. 2025
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="Detalles del producto - Tecno Casa"/>
    </jsp:include>
    
    <body style="background-color: #fcfcfc;">

        <jsp:include page="/components/navbar.jsp" flush="true" />

        <div class="bg-light border-bottom py-2 mb-4">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 small">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                        <li class="breadcrumb-item"><a href="#">Productos</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Detalle</li>
                    </ol>
                </nav>
            </div>
        </div>

        <section class="container mb-5">
            <div class="row g-5">
                
                <div class="col-lg-6">
                    <div class="product-image-container shadow-sm position-relative">
                        <span class="position-absolute top-0 start-0 m-3 badge bg-danger px-3 py-2">OFERTA ONLINE</span>
                        
                        <img id="prod-img" src="" alt="Cargando imagen..." class="img-fluid" style="object-fit: contain; max-height: 450px;">
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="ps-lg-4">
                        <small id="prod-marca-titulo" class="text-uppercase text-muted fw-bold ls-1">
                            CARGANDO...
                        </small>

                        <h1 id="prod-modelo" class="fw-bold text-dark mt-2 mb-3 display-6" style="font-family: 'Poppins', sans-serif;">
                            Cargando información del producto...
                        </h1>
                        
                        <div class="mb-3 text-warning small">
                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i>
                            <span class="text-muted ms-2">(4.8 de 5 estrellas)</span>
                        </div>

                        <div class="price-box mb-4">
                            <div class="d-flex align-items-center">
                                <span class="h5 mb-0 text-danger me-2 fw-bold">PRECIO ONLINE:</span>
                                <span id="prod-precio" class="display-5 fw-bold text-danger">S/ --.--</span>
                            </div>
                        </div>

                        <div class="d-flex align-items-end mb-4 gap-3">
                            <div>
                                <label for="cantidad" class="form-label small fw-bold text-muted">Cantidad:</label>
                                <div class="input-group">
                                    <button class="btn btn-qty" type="button" onclick="changeQty(-1)"><i class="bi bi-dash"></i></button>
                                    <input type="text" id="cantidad" class="form-control text-center quantity-input" value="1" readonly>
                                    <button class="btn btn-qty" type="button" onclick="changeQty(1)"><i class="bi bi-plus"></i></button>
                                </div>
                            </div>
                            
                            <div class="flex-grow-1">
                                <button class="btn btn-danger w-100 btn-lg shadow-sm" style="border-radius: 50px; background-color: #e30613;">
                                    <i class="bi bi-cart-plus me-2"></i> AÑADIR AL CARRITO
                                </button>
                            </div>
                        </div>

                        <div class="d-flex gap-4 text-muted small border-top pt-3">
                            <span><i class="bi bi-truck me-1"></i> Envío a domicilio</span>
                            <span><i class="bi bi-shop me-1"></i> Retiro en tienda</span>
                            <span><i class="bi bi-shield-check me-1"></i> Garantía 1 año</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5 pt-4">
                <div class="col-12">
                    <h4 class="fw-bold border-bottom pb-2 mb-4">Especificaciones Técnicas</h4>
                    
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table tech-table table-hover align-middle mb-0">
                                    <tbody>
                                        <tr>
                                            <th class="ps-4 py-3" style="width: 25%;">Marca</th>
                                            <td class="py-3" id="ficha-marca">...</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-4 py-3 bg-white">Modelo</th>
                                            <td class="py-3 bg-white" id="ficha-modelo">...</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-4 py-3">Precio Lista</th>
                                            <td class="py-3" id="ficha-precio">...</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-4 py-3 bg-white">Categoría</th>
                                            <td class="py-3 bg-white" id="ficha-categoria">...</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <jsp:include page="/components/footer.jsp" flush="true" />
        

        <script>window.APP_CONTEXT = "${pageContext.request.contextPath}";</script>
        
        <script>
            function changeQty(delta) {
                const input = document.getElementById('cantidad');
                let newValue = parseInt(input.value) + delta;
                if(newValue >= 1) input.value = newValue;
            }
        </script>

        <script type="module" src="${pageContext.request.contextPath}/js/detalle-producto.js"></script>

    </body>
</html>