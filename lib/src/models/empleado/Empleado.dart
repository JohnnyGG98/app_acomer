class Empleado{

  int id;
  int idRestaurante;
  int idUsuario;
  String nombre;
  String apellido;
  String identificacion;
  int idRol;
  String fotoUrl;

  Empleado({
    this.id,
    this.idRestaurante,
    this.idUsuario,
    this.nombre,
    this.apellido,
    this.identificacion,
    this.idRol,
    this.fotoUrl
  });

  Empleado.fromJSONMap(Map<String, dynamic> json) {
    id = json['id'];
    idRestaurante = json['id_restaurante'];
    idUsuario = json['id_usuario'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    identificacion = json['identificacion'];
    idRol = json['id_rol'];
    fotoUrl = json['foto_url'];
  }

}