import { toast, Preguntar } from "./exports/sweet.js";
import { enviarPeticionPost } from "./exports/post_component.js";

const form = document.getElementById("formReclamos");
const form_modal = document.getElementById("form_modal");

const tbody = document.getElementById("tb_reclamo");
const modalEditar = new bootstrap.Modal(document.getElementById("modal_editar_reclamo"));
const URL = "http://localhost:8081/tecno_casa/ControladorReclamo";

// Inputs Modal editar
const idReclamo = document.getElementById("idReclamo");
const tituloModal = document.getElementById("titulo_modal");
const estadoReclamoEditar = document.getElementById("estado_reclamo");

async function registrarReclamo(formulario_enviar) {
    const success = await enviarPeticionPost(formulario_enviar, "registrar", URL);
    success ?
            (toast("success", "Registrado Correctamente"), form.reset()) :
            toast("warning", "Error al registrar");
}


 async function editarReclamo(formulario_enviar){
 const success = await enviarPeticionPost(formulario_enviar, "editar", URL);
 success ? 
 (toast("success", "Actualizado Correctamente"), listarReclamos(), form_modal.reset()) :
 toast("warning", "Error al actualizar");
 }
 
async function listarReclamos() {
    const res = await fetch(URL);
    const data = await res.json();

    tbody.innerHTML = data.map((r, i) => `
        <tr>
            <td data-idreclamo="${r.idReclamo}">${i + 1}</td>
            <td>${r.nombre}</td>
            <td>${r.apellido}</td>
            <td>${r.direccion}</td>
            <td>${r.DNI}</td>
            <td>${r.telefono || ''}</td>
            <td>${r.email || ''}</td>
            <td>${r.tipo_bien}</td>
            <td class="text-end">${r.monto.toFixed(2)}</td>
            <td>${r.descripcion}</td>
            <td>${r.tipo_reclamo}</td>
            <td>${r.detalle}</td>
            <td>${r.pedido}</td>
            <td>${r.estado}</td>
            <td class="text-center">
                <button data-accion="editar" class="btn btn-warning btn-sm">
                    <i class="bi bi-pencil-fill"></i>
                </button>
            </td>
        </tr>
    `).join("");
}



/*
 async function eliminarReclamo(idReclamo) {
 const formT = new FormData();
 formT.append("idReclamo", idReclamo);
 
 const success = await enviarPeticionPost(formT, "eliminar", URL);
 success
 ? (toast("success", "Reclamo eliminado correctamente"), listarReclamos())
 : toast("warning", "Error al eliminar el reclamo");
 }
*/
 
 /*
 function abrirModalEditar(fila) {
 const celdas = fila.querySelectorAll("td");
 const id = celdas[0].dataset.idreclamo;
 const nombre = celdas[1].innerText;
 const apellido = celdas[2].innerText;
 const direccion = celdas[3].innerText;
 const dni = celdas[4].innerText;
 const telefono = celdas[5].innerText;
 const email = celdas[6].innerText;
 const tipo_bien = celdas[7].innerText;
 const monto = celdas[8].innerText;
 const descripcion = celdas[9].innerText;
 const tipo_reclamo = celdas[10].innerText;
 const detalle = celdas[11].innerText;
 const pedido = celdas[12].innerText;
 
 tituloModal.innerText = "Editar reclamo: " + nombre + " " + apellido;
 
 idReclamo.value = id;
 nombreReclamoEditar.value = nombre;
 apellidoReclamoEditar.value = apellido;
 direccionReclamoEditar.value = direccion;
 dniReclamoEditar.value = dni;
 telefonoReclamoEditar.value = telefono;
 emailReclamoEditar.value = email;
 tipoBienReclamoEditar.value = tipo_bien;
 montoReclamoEditar.value = monto;
 descripcionReclamoEditar.value = descripcion;
 tipoReclamoEditar.value = tipo_reclamo;
 detalleReclamoEditar.value = detalle;
 pedidoReclamoEditar.value = pedido;
 
 modalEditar.show();
 }
 */


function abrirModalEditar(fila) {
    const celdas = fila.querySelectorAll("td");

    idReclamo.value = celdas[0].dataset.idreclamo;
    document.getElementById("nombre_reclamo_editar").value = celdas[1].innerText;
    document.getElementById("apellido_reclamo_editar").value = celdas[2].innerText;
    document.getElementById("direccion_reclamo_editar").value = celdas[3].innerText;
    document.getElementById("dni_reclamo_editar").value = celdas[4].innerText;
    document.getElementById("telefono_reclamo_editar").value = celdas[5].innerText;
    document.getElementById("email_reclamo_editar").value = celdas[6].innerText;
    document.getElementById("tipo_bien_reclamo_editar").value = celdas[7].innerText;
    document.getElementById("monto_reclamo_editar").value = celdas[8].innerText;
    document.getElementById("descripcion_reclamo_editar").value = celdas[9].innerText;
    document.getElementById("tipo_reclamo_editar").value = celdas[10].innerText;
    document.getElementById("detalle_reclamo_editar").value = celdas[11].innerText;
    document.getElementById("pedido_reclamo_editar").value = celdas[12].innerText;

    estadoReclamoEditar.value = celdas[13].innerText;

    tituloModal.innerText = `Editar reclamo #${idReclamo.value}`;
    modalEditar.show();
}

if (form) {
    form.addEventListener("submit", async (e) => {
        e.preventDefault();
        console.log("Formulario enviado");
        await registrarReclamo(form);
    });
}


 form_modal.addEventListener("submit", async (e)=>{
 e.preventDefault();
 await editarReclamo(form_modal);
 modalEditar.hide();
 });
 
 form_modal.addEventListener("submit", async (e) => {
 e.preventDefault();
 
 const formData = new FormData(form_modal);
 await enviarPeticionPost(formData, "editar", URL);
 modalEditar.hide();
 listarReclamos();
 });
 
tbody.addEventListener("click", (e) => {
    const accion = e.target.dataset.accion;
    if (!accion)
        return;

    const fila = e.target.closest("tr");

    if (accion === "editar")
        abrirModalEditar(fila);

});

 