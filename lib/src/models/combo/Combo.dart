class Combo {

  int id;
  int idRestaurante; 
  Map<String, dynamic> platos;
  double precioFinal;
  Map<String, dynamic> extra; 

  Combo({
    this.id,
    this.idRestaurante,
    this.platos,
    this.precioFinal,
    this.extra
  });  

  Combo.fromJSONMap(Map<String, dynamic> json){
    id = json['id_combo'];
    idRestaurante = json['id_restaurante'];
    platos = json['platos'];
    precioFinal = json['precio_final'];
    extra = json['extra'];
  }

}