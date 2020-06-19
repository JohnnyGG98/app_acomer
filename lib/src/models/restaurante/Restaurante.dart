class Restaurante {
  int id;
  String nombreComercial;
  String nombreFiscal;
  String inicioSuscripcion;
  String ultimoPago;
  String fechaProximoPago;

  Restaurante(
      {this.id,
      this.nombreComercial,
      this.nombreFiscal,
      this.inicioSuscripcion,
      this.ultimoPago,
      this.fechaProximoPago});

  Restaurante.fromJSONMap(Map<String, dynamic> json) {
    id = json['id'];
    nombreComercial = json['nombre_comercial'];
    nombreFiscal = json['nombre_fiscal'];
    inicioSuscripcion = json['inicio_suscripcion'];
    ultimoPago = json['ultimo_pago'];
    fechaProximoPago = json['fecha_proximo_pago'];
  }
}
