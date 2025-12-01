document.addEventListener("DOMContentLoaded", function () {

    const params = new URLSearchParams(window.location.search);
    const contextPath = window.APP_CONTEXT || "";
    const idProducto = params.get("id");

    if (!idProducto) {
        console.warn("No hay ID en la URL");
        return;
    }

    const apiUrl = 'http://localhost:9090/api/productos/buscar/' + idProducto;

    fetch(apiUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error("No se pudo obtener el producto (Error " + response.status + ")");
                }
                return response.json();
            })
            .then(data => {
                console.log("Datos recibidos:", data);

                const marcaTitulo = document.getElementById("prod-marca-titulo");
                if (marcaTitulo)
                    marcaTitulo.textContent = data.marca ? data.marca.nombre : "Sin marca";

                const fichaMarca = document.getElementById("ficha-marca");
                if (fichaMarca)
                    fichaMarca.textContent = data.marca ? data.marca.nombre : "Sin marca";

                const prodModelo = document.getElementById("prod-modelo");
                if (prodModelo)
                    prodModelo.textContent = data.modelo;

                const fichaModelo = document.getElementById("ficha-modelo");
                if (fichaModelo)
                    fichaModelo.textContent = data.modelo;

                const precioTexto = "S/ " + (data.precio ? data.precio.toFixed(2) : "0.00");
                const prodPrecio = document.getElementById("prod-precio");
                if (prodPrecio)
                    prodPrecio.textContent = precioTexto;

                const fichaPrecio = document.getElementById("ficha-precio");
                if (fichaPrecio)
                    fichaPrecio.textContent = precioTexto;

                const fichaCategoria = document.getElementById("ficha-categoria");
                if (fichaCategoria)
                    fichaCategoria.textContent = data.categoria ? data.categoria.nombre : "General";

                const imgTag = document.getElementById("prod-img");
                if (imgTag && data.img) {
                    imgTag.src = contextPath + "/imgs/" + data.img;
                    imgTag.alt = data.modelo;
                }
            })
            .catch(error => {
                console.error("Error al cargar:", error);
                const titulo = document.getElementById("prod-modelo");
                if (titulo) {
                    titulo.textContent = "Producto no encontrado o error de conexión";
                    titulo.classList.add("text-danger");
                }
            });
});