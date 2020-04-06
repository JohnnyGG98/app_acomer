class Reserva {

  int id; 
  int idRestaurante; 
  int idMesa; 
  DateTime fechaReserva; 
  int numeroPersonas; 
  Map<String, dynamic> platos;
  String codigoQr;
  double total; 

  Reserva({
    this.id,
    this.idRestaurante,
    this.idMesa,
    this.fechaReserva,
    this.numeroPersonas,
    this.platos,
    this.codigoQr,
    this.total
  });

  Reserva.fromJSONMap(Map<String, dynamic> json) {
    id = json['id'];
    idRestaurante = json['id_resturante'];
    idMesa = json['id_mesa'];
    fechaReserva = json['fecha_reserva'];
    numeroPersonas = json['numero_personas'];
    platos = json['platos'];
    codigoQr = json['codigo_qr'];
    total = json['total'];
  }

}