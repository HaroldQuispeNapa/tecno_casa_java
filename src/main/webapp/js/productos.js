console.log("producto.js cargado");
import { toast, Confirmar } from "./exports/sweet.js";

const form = document.getElementById("formProducto");
const modal = new bootstrap.Modal(document.getElementById("modalProducto"));
const URL = "http://localhost:8081/tecno_casa/ControladorProductos";

let dataTable;

function initDataTable() {
    if ($.fn.DataTable.isDataTable('#tabla-productos')) {
        $('#tabla-productos').DataTable().destroy();
    }

    dataTable = $('#tabla-productos').DataTable({
        responsive: true,
        pageLength: 5,
        lengthMenu: [5, 10, 25, 50],
        columnDefs: [
            { orderable: false, targets: [0, 6] } 
        ]
    });
}

/*
function initDataTable() {
    if ($.fn.DataTable.isDataTable('#tabla-productos')) {
        $('#tabla-productos').DataTable().destroy();
    }

    dataTable = $('#tabla-productos').DataTable({
        responsive: true,
        pageLength: 5,
        lengthMenu: [5, 10, 25, 50],
        language: {
            "decimal": "",
            "emptyTable": "No hay datos disponibles en la tabla",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ productos",
            "infoEmpty": "Mostrando 0 a 0 de 0 productos",
            "infoFiltered": "(filtrado de _MAX_ productos totales)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ productos",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "No se encontraron registros coincidentes",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
            "aria": {
                "sortAscending": ": activar para ordenar la columna ascendente",
                "sortDescending": ": activar para ordenar la columna descendente"
            }
        },
        columnDefs: [
            { orderable: false, targets: [0, 6] } 
        ]
    });
} 
*/

document.addEventListener("DOMContentLoaded", () => {
    initDataTable();
    registrarEventosTabla(); 
});


function obtenerIdSeleccionado() {
    const seleccionados = dataTable.$('.seleccion-producto:checked');
    return seleccionados.length === 1 ? seleccionados.val() : null;
}


function registrarEventosTabla() {
    $('#tabla-productos tbody').on('change', '.seleccion-producto', function() {
        $('tr').removeClass('selected');
        
        if (this.checked) {
            $(this).closest('tr').addClass('selected');
        }
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
            if ($.fn.DataTable.isDataTable('#tabla-productos')) {
                $('#tabla-productos').DataTable().destroy();
            }

            tablaActual.innerHTML = nuevaTabla.innerHTML;

            initDataTable();
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

    const $checkbox = dataTable.$(`.seleccion-producto[value="${id}"]`);
    
    const $fila = $checkbox.closest("tr");
    const celdas = $fila.find("td");

    form.modelo.value = celdas.eq(2).text();
    form.idMarca.value = celdas.eq(3).data("id") || celdas.eq(3).attr("data-id");
    form.idCategoria.value = celdas.eq(4).data("id") || celdas.eq(4).attr("data-id");
    form.precio.value = celdas.eq(5).text().replace("S/. ", "").trim();
    form.idProducto.value = id;

    form.setAttribute("data-accion", "editar");
    modal.show();
});


document.getElementById("btn-eliminar-producto").addEventListener("click", async () => {
    const seleccionados = dataTable.$('.seleccion-producto:checked');
    
    if (seleccionados.length === 0) {
        toast("warning", "Selecciona al menos un producto para eliminar");
        return;
    }

    const confirmar = await Confirmar("¿Eliminar productos?", "Esta acción no se puede deshacer");
    if (!confirmar) return;

    const formEliminar = new FormData();
    
    seleccionados.each(function() {
        formEliminar.append("idProducto", $(this).val());
    });
    
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

