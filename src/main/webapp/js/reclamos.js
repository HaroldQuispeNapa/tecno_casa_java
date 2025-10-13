import { toast, Preguntar } from "./exports/sweet.js";
import { enviarPeticionPost } from "./exports/post_component.js";

const form = document.getElementById("formReclamos");
const form_modal = document.getElementById("form_modal");

const tbody = document.getElementById("tb_reclamo");
const modalEditar = new bootstrap.Modal(document.getElementById("modal_editar_reclamo"));
const URL = "http://localhost:8081/tecno_casa/ControladorReclamo";

// Inputs Modal editar
/*
const idReclamo = document.getElementById("idReclamo");
const tituloModal = document.getElementById("titulo_modal");
const nombreReclamoEditar = document.getElementById("nombre_reclamo_editar");
const apellidoReclamoEditar = document.getElementById("apellido_reclamo_editar");
const direccionReclamoEditar = document.getElementById("direccion_reclamo_editar");
const dniReclamoEditar = document.getElementById("dni_reclamo_editar");
const telefonoReclamoEditar = document.getElementById("telefono_reclamo_editar");
const emailReclamoEditar = document.getElementById("email_reclamo_editar");
const tipoBienReclamoEditar = document.getElementById("tipo_bien_reclamo_editar");
const montoReclamoEditar = document.getElementById("monto_reclamo_editar");
const descripcionReclamoEditar = document.getElementById("descripcion_reclamo_editar");
const tipoReclamoEditar = document.getElementById("tipo_reclamo_editar"); 
const detalleReclamoEditar = document.getElementById("detalle_reclamo_editar");
const pedidoReclamoEditar = document.getElementById("pedido_reclamo_editar");
const estadoReclamoEditar = document.getElementById("estado_reclamo_editar");
*/

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



async function listarReclamos(){
    const res = await fetch(URL);
    const data = await res.json();
    
    tbody.innerHTML = "";
    const render = data.map(({ 
        idReclamo, nombre, apellido, direccion, dni, telefono, email,
        tipo_bien, monto, descripcion, tipo_reclamo, detalle, pedido, estado
    }, i) => `
        <tr>
            <td data-idreclamo=${idReclamo}>${i + 1}</td>
            <td>${nombre}</td>
            <td>${apellido}</td>
            <td>${direccion}</td>
            <td>${dni}</td>
            <td>${telefono || ''}</td>
            <td>${email || ''}</td>
            <td>${tipo_bien}</td>
            <td class="text-end">${monto.toFixed(2)}</td>
            <td>${descripcion}</td>
            <td>${tipo_reclamo}</td>
            <td>${detalle}</td>
            <td>${pedido}</td>
            <td>${estado}</td>
            <td class="text-center">
                <button data-accion="editar" class="btn btn-warning btn-sm">
                    <i class="bi bi-pencil-fill"></i>
                </button>
                <button data-accion="eliminar" class="btn btn-danger btn-sm">
                    <i class="bi bi-trash"></i>
                </button>
            </td>
        </tr>
    `).join("");
    tbody.innerHTML = render;
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

form.addEventListener("submit", async (e) => {
    e.preventDefault();
      console.log("Formulario enviado");
    await registrarReclamo(form);
});


form_modal.addEventListener("submit", async (e)=>{
    e.preventDefault();
    await editarReclamo(form_modal);
    modalEditar.hide();
});


tbody.addEventListener("click", (e) => {
  const accion = e.target.dataset.accion;
  if (!accion) return;

  const fila = e.target.closest("tr");

  if (accion === "editar") abrirModalEditar(fila);
  
});
 
 