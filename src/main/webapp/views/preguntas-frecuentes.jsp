<%-- 
    Document   : preguntas-frecuentes
    Created on : 6 set. 2025
    Author     : efrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="/components/head.jsp">
        <jsp:param name="title" value="Preguntas Frecuentes - Tecno Casa"/>
    </jsp:include>

    <body>

        <jsp:include page="/components/navbar.jsp" flush="true" />

        <section class="bg-white py-5 mb-5 border-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-7">
                        <small class="text-uppercase text-danger fw-bold ls-1">Centro de Ayuda</small>
                        <h1 class="display-5 fw-bold text-dark mt-2 mb-3">¿Cómo podemos ayudarte?</h1>
                        <p class="lead text-muted">
                            Aquí encontrarás las respuestas a las dudas más comunes sobre compras, envíos y garantías en Tecno Casa.
                        </p>
                    </div>
                    <div class="col-md-5 text-center">
                        <img src="${pageContext.request.contextPath}/imgs/pregunta.png" alt="Ayuda" class="img-fluid hero-img-faq" style="max-height: 250px;">
                    </div>
                </div>
            </div>
        </section>

        <section class="container mb-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">

                    <div class="accordion" id="accordionFAQ">

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="bi bi-cart3 me-2 fs-5"></i> ¿Cómo puedo pedir en la tienda?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Puedes realizar tu pedido en nuestra web seleccionando el producto y haciendo clic en <strong>"Añadir al carrito"</strong>. Una vez tengas todo lo que necesitas, ve al icono del carrito y sigue los pasos para finalizar la compra. También ofrecemos recogida en tienda o entrega a domicilio a todo el Perú.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="bi bi-credit-card me-2 fs-5"></i> ¿Qué métodos de pago aceptan?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Aceptamos todas las tarjetas de crédito y débito (Visa, Mastercard, Amex), pagos vía PayPal y transferencias bancarias directas. Todos nuestros procesos de pago son 100% seguros y encriptados.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <i class="bi bi-shield-check me-2 fs-5"></i> ¿Qué garantías tienen los productos?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Todos los productos tecnológicos cuentan con la <strong>garantía oficial del fabricante</strong> (mínimo 1 año). Adicionalmente, Tecno Casa ofrece una garantía de satisfacción de 7 días para cambios inmediatos por defectos de fábrica.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <i class="bi bi-clock me-2 fs-5"></i> ¿Cuál es el horario de atención?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Nuestro horario de atención en tiendas físicas y soporte telefónico es:
                                    <ul class="mt-2 mb-0">
                                        <li><strong>Lunes a Viernes:</strong> 9:00 a.m. a 6:00 p.m.</li>
                                        <li><strong>Sábados:</strong> 10:00 a.m. a 2:00 p.m.</li>
                                        <li><strong>Domingos:</strong> Cerrado (Atención web 24/7).</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    <i class="bi bi-arrow-return-left me-2 fs-5"></i> ¿Cómo puedo devolver un producto?
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Puedes devolver un producto dentro de los primeros 7 días calendario posteriores a la compra. El producto debe estar sellado, en su caja original y debes presentar tu comprobante de pago electrónico.
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingSix">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                    <i class="bi bi-calendar-check me-2 fs-5"></i> ¿Puedo hacer una reserva de un producto?
                                </button>
                            </h2>
                            <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionFAQ">
                                <div class="accordion-body">
                                    Sí, puedes reservar un producto contactando a nuestro equipo de ventas por WhatsApp. La reserva tiene una validez máxima de 24 horas.
                                </div>
                            </div>
                        </div>

                    </div> 

                </div>
            </div>
        </section>

        <jsp:include page="/components/footer.jsp" flush="true" />

    </body>
</html>