class Sugerencia {

  int id;
  int idCliente;
  String sugerencia; 

  Sugerencia({
    this.id,
    this.idCliente,
    this.sugerencia
  });

  Sugerencia.fromJSONMap(Map<String, dynamic> json) {
    id = json['id_sugerencia'];
    idCliente = json['id_cliente'];
    sugerencia = json['sugerencia'];
  }

}