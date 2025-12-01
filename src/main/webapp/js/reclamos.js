import { toast, Preguntar } from "./exports/sweet.js";
import { enviarPeticionPost } from "./exports/post_component.js";

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
        columnDefs: [
            {orderable: false, targets: [7]}
        ]
    });
}

document.addEventListener("DOMContentLoaded", async () => {
    await listarReclamos();
});

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

        // === AQUÍ ESTÁ LA CLAVE: GENERAMOS EL HTML NUEVO ===
        tbody.innerHTML = data.map((r) => {
            // Lógica para color del badge
            let claseBadge = "badge-secondary"; // Default
            if (r.estado === "Pendiente")
                claseBadge = "estado-pendiente";
            else if (r.estado === "Resuelto" || r.estado === "Atendido")
                claseBadge = "estado-resuelto";
            else if (r.estado === "Rechazado")
                claseBadge = "estado-rechazado";
            else
                claseBadge = "estado-proceso";

            // Guardamos TODOS los datos crudos en atributos data-* del botón
            // Esto facilita muchísimo leerlos al editar, sin depender de las columnas visibles
            return `
            <tr>
                <td class="fw-bold text-muted small">#${r.idReclamo}</td>

                <td>
                    <div class="d-flex flex-column lh-sm">
                        <span class="fw-bold text-dark mb-1">${r.nombre} ${r.apellido}</span>
                        <small class="text-muted" style="font-size: 0.75rem;">
                            <i class="bi bi-card-heading"></i> ${r.DNI} | <i class="bi bi-telephone"></i> ${r.telefono || '-'}
                        </small>
                    </div>
                </td>

                <td><span class="badge bg-light text-dark border">${r.tipo_bien}</span></td>

                <td class="fw-bold text-dark">S/ ${parseFloat(r.monto).toFixed(2)}</td>

                <td>
                    <div class="text-truncate" style="max-width: 250px;" title="${r.descripcion}">
                        ${r.descripcion}
                    </div>
                </td>

                <td class="small text-uppercase fw-bold text-secondary">${r.tipo_reclamo}</td>

                <td class="text-center">
                    <span class="badge badge-estado ${claseBadge}">${r.estado}</span>
                </td>

                <td class="text-center">
                    <button type="button" 
                            class="btn btn-action-danger btn-editar shadow-sm"
                            title="Gestionar Reclamo"
                            data-id="${r.idReclamo}"
                            data-nombre="${r.nombre}"
                            data-apellido="${r.apellido}"
                            data-dni="${r.DNI}"
                            data-telefono="${r.telefono}"
                            data-email="${r.email}"
                            data-direccion="${r.direccion}"
                            data-bien="${r.tipo_bien}"
                            data-monto="${r.monto}"
                            data-descripcion="${r.descripcion}"
                            data-tipo="${r.tipo_reclamo}"
                            data-estado="${r.estado}"
                            data-detalle="${r.detalle || ''}"
                            data-pedido="${r.pedido || ''}">
                        <i class="bi bi-pencil-fill"></i>
                    </button>
                </td>
            </tr>
            `;
        }).join("");

        initDataTable();

    } catch (error) {
        console.error("Error al listar:", error);
    }
}

function abrirModalEditar(btn) {
    const d = btn.dataset;

    idReclamo.value = d.id;

    const setVal = (id, val) => {
        const el = document.getElementById(id);
        if (el)
            el.value = val || "";
    };

    setVal("nombre_reclamo_editar", d.nombre);
    setVal("apellido_reclamo_editar", d.apellido);
    setVal("direccion_reclamo_editar", d.direccion);
    setVal("dni_reclamo_editar", d.dni);
    setVal("telefono_reclamo_editar", d.telefono);
    setVal("email_reclamo_editar", d.email);
    setVal("tipo_bien_reclamo_editar", d.bien);
    setVal("monto_reclamo_editar", d.monto);
    setVal("descripcion_reclamo_editar", d.descripcion);
    setVal("tipo_reclamo_editar", d.tipo);
    setVal("detalle_reclamo_editar", d.detalle);
    setVal("pedido_reclamo_editar", d.pedido);

    if (estadoReclamoEditar)
        estadoReclamoEditar.value = d.estado;

    tituloModal.innerText = `Editar reclamo #${d.id}`;
    modalEditar.show();
}

if (form_modal) {
    form_modal.addEventListener("submit", async (e) => {
        e.preventDefault();
        await editarReclamo(new FormData(form_modal));
    });
}

$('#tablaReclamos tbody').on('click', '.btn-editar', function () {
    // 'this' es el botón presionado
    abrirModalEditar(this);
});