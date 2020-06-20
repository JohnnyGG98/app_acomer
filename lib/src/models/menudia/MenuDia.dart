class MenuDia {

  int id; 
  int idRestaurante; 
  String descripcion;
  double precio;
  List<dynamic> menu;
  List<dynamic> fechas;

  MenuDia({
    this.id,
    this.idRestaurante,
    this.descripcion,
    this.precio,
    this.fechas,
    this.menu
  });

  MenuDia.fromJSONMap(Map<String, dynamic> json) {
    id = json['id_menu'];
    idRestaurante = json['id_restaurante'];
    descripcion = json['descripcion'];
    precio = double.parse(json['precio'] ?? "0");
    menu = json['menu_dia'];
    fechas = json['fechas'];
  }

}