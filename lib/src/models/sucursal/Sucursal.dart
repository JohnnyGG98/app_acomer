class Sucursal{

  int id;
  int idRestaurante;
  Map<String, dynamic> horarioAtencion;
  int numero;
  String direccion;
  double latitud;
  double longitud;


  Sucursal([
    this.id,
    this.idRestaurante,
    this.horarioAtencion,
    this.numero,
    this.direccion,
    this.latitud,
    this.longitud
  ]);

  Sucursal.fromJSONMap(Map<String, dynamic> json){
    id = json['id'];
    idRestaurante = json['id_restaurante'];
    horarioAtencion = json['horario_atencion'];
    numero = json['numero'];
    direccion = json['direccion'];
    latitud = json['latitud'];
    longitud = json['longitud'];
  }
  
}