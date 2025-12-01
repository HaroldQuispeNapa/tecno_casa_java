document.addEventListener("DOMContentLoaded", function () {

    const contextPath = window.APP_CONTEXT || "";

    const txtBuscar = document.getElementById("txt-buscar");
    const btnBuscar = document.getElementById("btn-buscar");
    const contenedor = document.getElementById("contenedor-productos");

    const params = new URLSearchParams(window.location.search);
    const busquedaPendiente = params.get("q");

    if (busquedaPendiente && contenedor && txtBuscar) {
        txtBuscar.value = busquedaPendiente;
        setTimeout(() => {
            realizarBusqueda();
        }, 100);
    }

    if (txtBuscar) {
        txtBuscar.addEventListener("keydown", function (e) {
            if (e.key === "Enter") {
                e.preventDefault();
                realizarBusqueda();
            }
        });
    }

    if (btnBuscar) {
        btnBuscar.addEventListener("click", function (e) {
            e.preventDefault();
            realizarBusqueda();
        });
    }

    function realizarBusqueda() {
        const termino = txtBuscar.value.trim();

        if (termino === "") {
            if (contenedor) {
                window.location.href = contextPath + "/ControladorPrincipal?accion=paginaInicio";
            }
            return;
        }

        if (!contenedor) {
            window.location.href = contextPath + "/ControladorPrincipal?accion=paginaInicio&q=" + encodeURIComponent(termino);
            return;
        }

        const url = 'http://localhost:9090/api/productos/buscar-modelo/' + termino;

        contenedor.innerHTML = '<div class="col-12 text-center py-5" style="width: 100%; flex: 0 0 100%;"><div class="spinner-border text-danger" role="status"></div></div>';

        fetch(url)
                .then(response => {
                    if (!response.ok)
                        throw new Error("Error en la petición");
                    return response.json();
                })
                .then(productos => {
                    contenedor.innerHTML = "";

                    if (productos.length === 0) {
                        contenedor.innerHTML = `
                        <div class="col-12 text-center py-5" style="width: 100%; flex: 0 0 100%;">
                            <h3 class="fw-bold text-dark">Sin resultados</h3>
                            <div class="alert alert-warning d-inline-block px-5 shadow-sm">
                                No encontramos productos que coincidan con "<strong>${termino}</strong>"
                            </div>
                        </div>
                    `;
                        return;
                    }

                    contenedor.innerHTML += `
                    <div class="col-12 mb-4" style="width: 100%; flex: 0 0 100%;">
                         <h3 class="fw-bold text-dark text-center">Resultados de Búsqueda</h3>
                    </div>
                `;

                    productos.forEach(p => {
                        let precio = parseFloat(p.precio).toFixed(2);
                        let marca = p.marca ? p.marca.nombre : "Genérico";

                        const html = `
                            <div class="col">
                                <div class="card-retail">
                                    <div class="badge-oferta">PRECIO ONLINE</div>

                                    <div class="text-center mb-3" style="height: 180px; display: flex; align-items: center; justify-content: center;">
                                        <img src="${contextPath}/imgs/${p.img}" style="max-height: 100%; max-width: 100%; object-fit: contain;" alt="${p.modelo}">
                                    </div>

                                    <div class="mt-auto">
                                        <small class="text-muted fw-bold">${marca}</small>
                                        <h6 class="card-title my-2" style="height: 40px; overflow: hidden;">${p.modelo}</h6>

                                        <div class="d-flex align-items-end mb-3">
                                            <div class="me-2">
                                                <h4 class="text-danger fw-bold m-0">S/ ${precio}</h4>
                                            </div>
                                        </div>

                                        <a href="./views/detalle-Producto.jsp?id=${p.idProducto}" class="btn btn-retail">
                                            Ver Producto <i class="bi bi-arrow-right-short"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        `;
                        contenedor.innerHTML += html;
                    });

                    contenedor.scrollIntoView({behavior: 'smooth', block: 'start'});
                })
                .catch(error => {
                    console.error("Error:", error);
                    contenedor.innerHTML = `<div class="col-12 py-5 text-center" style="width: 100%; flex: 0 0 100%;"><div class="alert alert-danger d-inline-block">Error al buscar productos.</div></div>`;
                });
    }
});