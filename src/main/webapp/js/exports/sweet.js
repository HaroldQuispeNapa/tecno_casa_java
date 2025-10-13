export function toast(estado,mensaje){
  const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })

  Toast.fire({
    icon: estado,
    title: mensaje
  })
}

export function notificar(icon,titulo, mensaje, tiempo){
  Swal.fire({
    icon: icon,
    title: titulo,
    text: mensaje,
    confirmButtonColor: '#2E86C1',
    confirmButtonText: 'Aceptar',
    footer: '',
    timerProgressBar: true,
    timer: (tiempo * 1000)
  })
}

export function Preguntar(callback,mensaje, icon) {
  return Swal.fire({
    text: mensaje,
    icon: icon,
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    cancelButtonText: "Cancelar",
    confirmButtonText: "Aceptar"
    }).then((result) => {
        if (result.isConfirmed) {
            callback()
        }
  });
}
export async function Confirmar(titulo, mensaje, icon = "warning") {
  const result = await Swal.fire({
    title: titulo,
    text: mensaje,
    icon: icon,
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    cancelButtonText: "Cancelar",
    confirmButtonText: "Aceptar"
  });
  return result.isConfirmed;
}