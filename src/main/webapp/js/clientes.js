$(document).ready(function() {
  $('#clientesTable').DataTable({
    ajax: {
      url: 'http://localhost:9090/api/usuarios/clientes',
      dataSrc: '' 
    },
    columns: [
      { data: 'id' },
      { data: 'dni' },
      { data: 'nombres' },
      { data: 'apellidos' },
      { data: 'fechaNacimiento' }
    ]
  });
});
