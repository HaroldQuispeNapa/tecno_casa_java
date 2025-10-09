<%-- 
    Document   : paginaInicio
    Created on : 6 set. 2025, 20:34:56
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <!-- Head.jsp -->
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="Tecno Casa"/>
    </jsp:include>
    <body>

        <!-- Navbar.jsp -->
        <jsp:include page="/components/navbar.jsp" flush="true" />


        <!-- Sección Carosuel Productos -->
        <section style="background: #ff0000;">
            <div class="container-fluid py-2">
                <h4 class="text-center mt-0 text-light">Productos TECNOLÓGICOS para el Hogar</h4>
                <h4 class="text-center text-warning">¡Envío a todo el Perú!</h4>
            </div>
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_celular.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_cocina.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_laptops.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_tv.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_refri.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/imgs/fondo_lavadora.webp" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>

        <!-- Sección Productos -->
        <section>
            <div style="background: #000000;" class="container-fluid py-2">
                <h3 class="text-center text-light display-7">Encuentra lo que necesitas</h3>
            </div>
            <div class="container py-5">
                <div class="row row-cols-2 row-cols-md-5 g-4">

                    <!-- Productos celulares -->
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/137364_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">SAMSUNG</h6>
                                <p class="card-title flex-grow-1">Celular Libre Samsung A07 6.7" 128GB 4GB RAM Negro</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 699.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/20965704_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">XIAOMI</h6>
                                <p class="card-title flex-grow-1">Celular Libre Xiaomi Redmi A5 6.8" 128GB 4GB RAM</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 349.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/zte_v60_gris_07_2.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">ZTE</h6>
                                <p class="card-title flex-grow-1">Celular Libre ZTE V60 6.72" 256 GB 8GB RAM Negro</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 499.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/iphone_16_pro_max_desert_titanium_pdp_image_position_0__gens.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">APPLE</h6>
                                <p class="card-title flex-grow-1">iPhone 16 Pro Max 256GB Titanio del Desierto</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 5,499.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/135161_1_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">SAMSUNG</h6>
                                <p class="card-title flex-grow-1">Celular Samsung Galaxy S25 6.2" 128GB 12GB RAM SILVER SHADOW</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 2,999.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Productos tv -->
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/136511_01.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">LG</h6>
                                <p class="card-title flex-grow-1">Televisor LG Smart TV 55" QNED AI 4K UHD 55QNED82ASG</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 1,849.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/tcl_tv_qled_p8k_75_front_full_specs.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">TCL</h6>
                                <p class="card-title flex-grow-1">Televisor TCL Smart TV 75" QLED 4K UHD 75P8K</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 2,749.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/136546_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">SAMSUNG</h6>
                                <p class="card-title flex-grow-1">Televisor Samsung Smart TV 55" Neo QLED 4K UHD Vision AI QN55QN70FAGXPE</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 2,299.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/136142_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">SAMSUNG</h6>
                                <p class="card-title flex-grow-1">Televisor Samsung Smart TV 65" QLED 4K UHD Vision AI QN65Q8FAAGXPE</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 2,349.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/136166_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">LG</h6>
                                <p class="card-title flex-grow-1">Televisor LG Smart TV 55" OLED AI B5 4K UHD OLED55B5PSA</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 3,599.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Productos lavadoras -->
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/128666_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">LG</h6>
                                <p class="card-title flex-grow-1">Refrigeradora LG Top Freezer GT24BPP Door Cooling 241L</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 1,099.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/124589_1_1_2.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">SAMSUNG</h6>
                                <p class="card-title flex-grow-1">Refrigeradora Samsung Side By Side RS60T5200B1/PE 602L</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 3,999.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/132796_1_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">SAMSUNG</h6>
                                <p class="card-title flex-grow-1">Refrigeradora Samsung Top Freezer 384Lt All Around Cooling RT38DG6730S9PE</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 2,099.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/127839_1_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">LG</h6>
                                <p class="card-title flex-grow-1">Lavaseca LG WD9PVC4S6 AI DD Carga Frontal 9kg/5kg</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 1,499.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/imgs/136036_1_1.webp" width="240" height="250" class="card-img-top" alt="">
                            <div class="card-body d-flex flex-column">
                                <h6 class="text-muted">SAMSUNG  </h6>
                                <p class="card-title flex-grow-1">Lavadora Samsung AI Wash EcoBubble™ 21kg Negra WA80F21B9BPE</p>
                                <div class="mt-auto">
                                    <p class="text-danger fw-bold mb-2">S/ 2,199.00</p>
                                    <a href="detalle-Producto.jsp" class="btn btn-danger w-100">Añadir al carro</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Sección Sugerencias -->
        <section class="container my-5">
            <h2 class="mb-4 text-center">Sugerencias</h2>
            <div class="row align-items-center">
                <div class="col-md-6 text-center">
                    <img src="${pageContext.request.contextPath}/imgs/sugerencia.png" class="img-fluid" alt="Sugerencias">
                </div>
                <div class="col-md-6">
                    <form class="p-4 border rounded shadow-sm bg-light">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" id="nombre" class="form-control" placeholder="Escribe tu nombre">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Correo</label>
                            <input type="email" id="email" class="form-control" placeholder="ejemplo@email.com">
                        </div>
                        <div class="mb-3">
                            <label for="comentario" class="form-label">Comentario</label>
                            <textarea id="comentario" class="form-control" rows="3" placeholder="Escribe tu sugerencia..."></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Enviar</button>
                    </form>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="/components/footer.jsp" flush="true" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

