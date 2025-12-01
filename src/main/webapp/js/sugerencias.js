const URL = "http://localhost:9090/api/sugerencias";

async function obtenerSugerencias() {
    try {
        const res = await fetch(URL);
        const data = await res.json();
        console.log(data);
        renderTabla(data);
    } catch (error) {
        console.error("Error al obtener sugerencias:", error);
    }
}

async function renderTabla(data) {
    const tbody = document.getElementById("tabla-sugerencias");
    tbody.innerHTML = "";
    const filas = data.map(({id,nombre,correo, comentario, createdAt})=>{
        return `<tr>
                    <td>${id}</td>
                    <td>${nombre}</td>
                    <td>${correo}</td>
                    <td>${comentario}</td>
                    <td>${createdAt}</td>
                </tr>`;
    });
    tbody.innerHTML = filas;
}



await obtenerSugerencias();
