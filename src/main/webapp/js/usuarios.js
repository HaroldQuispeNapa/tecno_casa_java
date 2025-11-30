$(document).ready(function() {
  $('#usuariosTable').DataTable({
    ajax: {
      url: 'http://localhost:9090/api/usuarios',
      dataSrc: ''
    },
    columns: [
      { data: 'id' },
      { data: 'dni' },
      { data: 'nombres' },
      { data: 'apellidos' },
      { data: 'fechaNacimiento' },
      { data: 'idRol' } 
    ]
  });
});


