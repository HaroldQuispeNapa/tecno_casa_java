console.log("producto.js cargado");
import { toast, Confirmar } from "./exports/sweet.js";

const form = document.getElementById("formProducto");
const modal = new bootstrap.Modal(document.getElementById("modalProducto"));
const URL = "http://localhost:8080/tecno_casa/ControladorProductos";


function obtenerIdSeleccionado() {
    const seleccionados = document.querySelectorAll('.seleccion-producto:checked');
    return seleccionados.length === 1 ? seleccionados[0].value : null;
}


function registrarEventosTabla() {
    document.querySelectorAll('.seleccion-producto').forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            document.querySelectorAll('tr').forEach(tr => tr.classList.remove('selected'));
            if (checkbox.checked) {
                checkbox.closest('tr').classList.add('selected');
            }
        });
    });
}


async function cargarProductos() {
    try {
        const response = await fetch(`${URL}?accion=listar`);
        const html = await response.text();
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, "text/html");
        const nuevaTabla = doc.querySelector("#tabla-productos");
        const tablaActual = document.querySelector("#tabla-productos");
        if (nuevaTabla && tablaActual) {
            tablaActual.replaceWith(nuevaTabla);
            registrarEventosTabla();
        }
    } catch (error) {
        console.error("Error al cargar productos:", error);
    }
}


form.addEventListener("submit", async (e) => {
    e.preventDefault();
    const accion = form.getAttribute("data-accion") || "registrar";

   
    if (!form.modelo.value.trim() ||
            !form.precio.value.trim() ||
            !form.idMarca.value.trim() ||
            !form.idCategoria.value.trim()) {
        toast("warning", "Todos los campos son obligatorios");
        return;
    }

    const formData = new FormData(form);
    formData.append("accion", accion);

    try {
        const response = await fetch(URL, {
            method: "POST",
            body: formData
        });

        const text = await response.text();
        console.log("Respuesta cruda:", text);

        const json = JSON.parse(text);
        if (json.estado === "ok") {
            toast("success", json.mensaje);
            modal.hide();
            form.reset();
            await cargarProductos();
        } else {
            toast("error", json.mensaje);
        }

    } catch (error) {
        console.error("Error al interpretar JSON:", error);
        toast("error", "Respuesta inválida del servidor");
    }
});


document.getElementById("btn-agregar-producto").addEventListener("click", () => {
    form.reset();
    form.setAttribute("data-accion", "registrar");
    modal.show();
});


document.getElementById("btn-editar-producto").addEventListener("click", () => {
    const id = obtenerIdSeleccionado();
    if (!id) {
        toast("warning", "Selecciona un solo producto para editar");
        return;
    }

    const fila = document.querySelector(`.seleccion-producto[value="${id}"]`).closest("tr");
    const celdas = fila.querySelectorAll("td");

    form.modelo.value = celdas[2].textContent;
    form.idMarca.value = celdas[3].getAttribute("data-id");
    form.idCategoria.value = celdas[4].getAttribute("data-id");
    form.precio.value = celdas[5].textContent.replace("S/. ", "");
    form.idProducto.value = id;

    form.setAttribute("data-accion", "editar");
    modal.show();
});


document.getElementById("btn-eliminar-producto").addEventListener("click", async () => {
    const seleccionados = document.querySelectorAll('.seleccion-producto:checked');
    if (seleccionados.length === 0) {
        toast("warning", "Selecciona al menos un producto para eliminar");
        return;
    }

    const confirmar = await Confirmar("¿Eliminar productos?", "Esta acción no se puede deshacer");
    if (!confirmar) return;

    const formEliminar = new FormData();
    seleccionados.forEach(cb => formEliminar.append("idProducto", cb.value));
    formEliminar.append("accion", "eliminar");

    try {
        const response = await fetch(URL, {
            method: "POST",
            body: formEliminar
        });

        const text = await response.text();
        const json = JSON.parse(text);

        if (json.estado === "ok") {
            toast("success", json.mensaje || "Productos eliminados");
            await cargarProductos();
        } else {
            toast("error", json.mensaje || "No se pudieron eliminar los productos");
        }

    } catch (error) {
        console.error("Error al eliminar:", error);
        toast("error", "Error de conexión con el servidor");
    }
});

