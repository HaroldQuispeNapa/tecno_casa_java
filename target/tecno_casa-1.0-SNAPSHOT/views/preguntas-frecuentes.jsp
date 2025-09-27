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
        <jsp:param name="title" value="Preguntes Frecuentes"/>
    </jsp:include>
    <body>

        <!-- Navbar.jsp -->
        <jsp:include page="/components/navbar.jsp" flush="true" />

        <!-- Sección Preguntas -->
        <section class="container my-5">
            <div class="mb-3">
                <h1 class="fs-2 text-center py-3">¿Tienes preguntas?</h1>
                <label class="fs-5 text-center py-3">
                    A continuación, encontrará respuestas a las preguntas más frecuentes sobre TecnoCasa. 
                    Si no encuentra la información que necesita, no dude en contactarnos, estaremos encantados de ayudarle a potenciar su hogar de electrodomésticos.
                </label>
                <img class="mx-auto d-block" src="../imgs/pregunta.png" alt="alt" width="300"/>
            </div>

            <div>
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                ¿Cómo puedo pedir en la tienda?
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Puedes realizar tu pedido en nuestra web seleccionando el producto y añadiéndolo al carrito. También ofrecemos recogida en tienda o entrega a domicilio.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                ¿Qué métodos de pago aceptan?
                            </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Aceptamos tarjetas de crédito/débito, PayPal y transferencias bancarias. Los pagos se procesan de forma segura.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                ¿Qué garantías tienen los productos?
                            </button>
                        </h2>
                        <div id="flush-collapseThree" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Todos los productos cuentan con garantía del fabricante y nuestra garantía de tienda de 12 meses para defectos de producto.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                                ¿Cuál es el horario de atención?
                            </button>
                        </h2>
                        <div id="flush-collapseFour" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Nuestro horario de atención es de lunes a viernes, de 9:00 a.m. a 6:00 p.m., y los sábados de 10:00 a.m. a 2:00 p.m.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                                ¿Cómo puedo devolver un producto?
                            </button>
                        </h2>
                        <div id="flush-collapseFive" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Puedes devolver un producto dentro de los 30 días posteriores a la compra presentando el comprobante y en su estado original. Para más detalles, contacta a nuestro servicio al cliente.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
                                ¿Puedo hacer una reserva de un producto?
                            </button>
                        </h2>
                        <div id="flush-collapseSix" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">Sí, puedes reservar un producto poniéndote en contacto con nuestro equipo de atención al cliente a través de teléfono o correo electrónico.</div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <!-- Footer -->
  <jsp:include page="/components/footer.jsp" flush="true" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

