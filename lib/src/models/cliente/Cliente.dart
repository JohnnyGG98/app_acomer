class Cliente {

  int id; 
  int idUsuario;
  String nombre;
  String apellido; 
  String identificacion;
  String telefono;
  int numCompras; 
  DateTime ultimaCompra; 
  double totalConsumos;

  Cliente({
    this.id,
    this.idUsuario,
    this.nombre,
    this.apellido,
    this.identificacion,
    this.telefono,
    this.numCompras,
    this.ultimaCompra,
    this.totalConsumos
  });

  Cliente.fromJSONMap(Map<String, dynamic> json) {
    id = json['id'];
    idUsuario = json['id_usuario'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    identificacion = json['identificacion'];
    telefono = json['telefono'];
    numCompras = json['num_compras'];
    ultimaCompra = json['ultimaCompra']; 
    totalConsumos = json['totalConsumos'];
  }

}