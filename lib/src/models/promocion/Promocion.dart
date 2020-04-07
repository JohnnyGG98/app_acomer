class Promocion{

  int id;
  int idRestaurante;
  int idFk;
  DateTime fechaInicio;
  DateTime fechaFin;
  double precio;
  int descuento;
  Map <String, dynamic> extra;


  Promocion([
    this.id,
    this.idRestaurante,
    this.idFk,
    this.fechaInicio,
    this.fechaFin,
    this.precio,
    this.descuento,
    this.extra
  ]);


  Promocion.fromJSONMap(Map <String, dynamic> json){
    id = json['id'];
    idRestaurante = json['id_restaurante'];
    idFk = json['id_fk'];
    fechaInicio = json['fecha_inicio'];
    fechaFin = json['fecha_fin'];
    precio = json['precio'];
    descuento = json['descuento'];
    extra = json['extra'];
  }
}