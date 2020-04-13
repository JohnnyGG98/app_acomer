class EncabezadoFactura{

  int id;
  int idRestaurante;
  int idCliente;
  int idPedido;
  double total;
  DateTime fecha;
  String nombre;
  String direccion;
  String telefono;
  String identificacion;


  EncabezadoFactura([
    this.id,
    this.idRestaurante,
    this.idCliente,
    this.idPedido,
    this.total,
    this.fecha,
    this.nombre,
    this.direccion,
    this.telefono,
    this.identificacion
  ]);


  EncabezadoFactura.fromJSONMap(Map <String, dynamic> json){
    id = json['id'];
    idRestaurante = json['id_restaurante'];
    idCliente = json['id_cliente'];
    idPedido = json['id_pedido'];
    total = json['total'];
    fecha = json['fecha'];
    nombre = json['nombre'];
    direccion = json['direccion'];
    telefono = json['telefono'];
    identificacion = json['identificacion'];
  }
}