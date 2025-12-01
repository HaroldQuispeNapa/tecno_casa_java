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

const parametros = {
    "username" : "Harold",
    "password" : "hola123",
    "roles" : "ADMIN"
};

async function loginAPI() {
    const res = await fetch(URL,{
        method : "POST",
        body : parametros,
        headers: {"Content-Type": "application/json"}
    });

    const data = res.json();
    console.log(data);
}

async function renderTabla(data) {
    const tbody = document.getElementById("tabla-sugerencias");
    tbody.innerHTML = "";
    const filas = data.map(({id,nombre,correo, comentario, createdAt})=>
        `<tr>
                    <td>${id}</td>
                    <td>${nombre}</td>
                    <td>${correo}</td>
                    <td>${comentario}</td>
                    <td>${createdAt}</td>
                </tr>`
    ).join("");
    tbody.innerHTML = filas;
}



await obtenerSugerencias();
