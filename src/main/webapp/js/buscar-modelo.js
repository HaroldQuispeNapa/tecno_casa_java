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

    function realizarBusqueda() {
        const termino = txtBuscar.value.trim();

        if (termino === "") {
            if(contenedor) {
                window.location.href = contextPath + "/ControladorPrincipal?accion=paginaInicio";
            }
            return;
        }

        if (!contenedor) {
            window.location.href = contextPath + "/ControladorPrincipal?accion=paginaInicio&q=" + encodeURIComponent(termino);
            return; 
        }

        const url = 'http://localhost:9090/api/productos/buscar-modelo/' + termino;

        fetch(url)
            .then(response => {
                if (!response.ok) throw new Error("Error en la petición");
                return response.json();
            })
            .then(productos => {
                contenedor.innerHTML = "";

                if (productos.length === 0) {
                     contenedor.innerHTML = `
                        <div class="col-12" style="width: 100%; flex: 0 0 100%;">
                            <h3 class="fw-bold mb-4 text-center text-dark">Resultados de Búsqueda</h3>
                            <div class="alert alert-warning text-center p-4 border-0 w-100 shadow-sm" role="alert" 
                                 style="background-color: #fff3cd; color: #856404;">
                                 No podemos encontrar productos que coincida con la selección.
                            </div>
                        </div>
                    `;
                    contenedor.scrollIntoView({ behavior: 'smooth', block: 'start' }); 
                    return;
                }

                contenedor.innerHTML += `
                    <div class="col-12" style="width: 100%; flex: 0 0 100%;">
                         <h3 class="fw-bold mb-4 text-center text-dark">Resultados de Búsqueda</h3>
                    </div>
                `;

                productos.forEach(p => {
                    let precio = parseFloat(p.precio).toFixed(2);
                    let marca = p.marca ? p.marca.nombre : "Genérico";

                    const html = `
                        <div class="col">
                            <div class="card h-100 shadow-sm">
                                <img src="${contextPath}/imgs/${p.img}" width="240" height="250" class="card-img-top" alt="${p.modelo}" style="object-fit: contain;">
                                <div class="card-body d-flex flex-column">
                                    <h6 class="text-muted">${marca}</h6>
                                    <p class="card-title flex-grow-1">${p.modelo}</p>
                                    <div class="mt-auto">
                                        <p class="text-danger fw-bold mb-2">S/ ${precio}</p>
                                        <a href="./views/detalle-Producto.jsp?id=${p.idProducto}" class="btn btn-danger w-100">Ver Detalle</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    contenedor.innerHTML += html;
                });
                
                contenedor.scrollIntoView({ behavior: 'smooth', block: 'start' });

            })
            .catch(error => console.error("Error:", error));
    }

    if (btnBuscar) {
        btnBuscar.addEventListener("click", function (e) {
            e.preventDefault();
            realizarBusqueda();
        });
    }

    if (txtBuscar) {
        txtBuscar.addEventListener("keyup", function (e) {
            if (e.key === "Enter") {
                e.preventDefault();
                realizarBusqueda();
            }
        });
    }
});