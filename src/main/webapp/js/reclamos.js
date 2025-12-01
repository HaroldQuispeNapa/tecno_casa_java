import { toast, Preguntar } from "./exports/sweet.js";
import { enviarPeticionPost } from "./exports/post_component.js";

const form = document.getElementById("formReclamos");
const form_modal = document.getElementById("form_modal");
const tbody = document.getElementById("tb_reclamo");
const modalEditar = new bootstrap.Modal(document.getElementById("modal_editar_reclamo"));
const URL = "http://localhost:8081/tecno_casa/ControladorReclamo";

const idReclamo = document.getElementById("idReclamo");
const tituloModal = document.getElementById("titulo_modal");
const estadoReclamoEditar = document.getElementById("estado_reclamo");

let dataTable;

function initDataTable() {
    if ($.fn.DataTable.isDataTable('#tablaReclamos')) {
        $('#tablaReclamos').DataTable().destroy();
    }

    dataTable = $('#tablaReclamos').DataTable({
        responsive: true,
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json',
        },
        columnDefs: [
            { orderable: false, targets: [14] }
        ]
    });
}

document.addEventListener("DOMContentLoaded", () => {
    initDataTable();
});

async function registrarReclamo(formulario_enviar) {
    const success = await enviarPeticionPost(formulario_enviar, "registrar", URL);
    if (success) {
        toast("success", "Registrado Correctamente");
        form.reset();
    } else {
        toast("warning", "Error al registrar");
    }
}

async function editarReclamo(formulario_enviar) {
    const dataToSend = formulario_enviar instanceof FormData ? formulario_enviar : new FormData(formulario_enviar);
    
    const success = await enviarPeticionPost(dataToSend, "editar", URL);
    if (success) {
        toast("success", "Actualizado Correctamente");
        modalEditar.hide();
        form_modal.reset();
        await listarReclamos(); 
    } else {
        toast("warning", "Error al actualizar");
    }
}

async function listarReclamos() {
    try {
        const res = await fetch(`${URL}?accion=listar`); 
        const data = await res.json();

        if ($.fn.DataTable.isDataTable('#tablaReclamos')) {
            $('#tablaReclamos').DataTable().destroy();
        }

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
                    <button type="button" data-accion="editar" class="btn btn-warning btn-sm btn-editar">
                        <i class="bi bi-pencil-fill"></i>
                    </button>
                </td>
            </tr>
        `).join("");

        initDataTable();

    } catch (error) {
        console.error("Error al listar:", error);
    }
}

function abrirModalEditar(fila) {
    const celdas = fila.querySelectorAll("td");

    idReclamo.value = celdas[0].dataset.idreclamo;
    
    const setVal = (id, val) => {
        const el = document.getElementById(id);
        if(el) el.value = val;
    };

    setVal("nombre_reclamo_editar", celdas[1].innerText);
    setVal("apellido_reclamo_editar", celdas[2].innerText);
    setVal("direccion_reclamo_editar", celdas[3].innerText);
    setVal("dni_reclamo_editar", celdas[4].innerText);
    setVal("telefono_reclamo_editar", celdas[5].innerText);
    setVal("email_reclamo_editar", celdas[6].innerText);
    setVal("tipo_bien_reclamo_editar", celdas[7].innerText);
    setVal("monto_reclamo_editar", celdas[8].innerText);
    setVal("descripcion_reclamo_editar", celdas[9].innerText);
    setVal("tipo_reclamo_editar", celdas[10].innerText);
    setVal("detalle_reclamo_editar", celdas[11].innerText);
    setVal("pedido_reclamo_editar", celdas[12].innerText);
    
    if(estadoReclamoEditar) estadoReclamoEditar.value = celdas[13].innerText;

    tituloModal.innerText = `Editar reclamo #${idReclamo.value}`;
    modalEditar.show();
}

if (form) {
    form.addEventListener("submit", async (e) => {
        e.preventDefault();
        await registrarReclamo(new FormData(form));
    });
}

if (form_modal) {
    form_modal.addEventListener("submit", async (e) => {
        e.preventDefault();
        await editarReclamo(new FormData(form_modal));
    });
}

$('#tablaReclamos tbody').on('click', 'button[data-accion="editar"]', function () {
    const fila = $(this).closest('tr')[0];
    abrirModalEditar(fila);
});

