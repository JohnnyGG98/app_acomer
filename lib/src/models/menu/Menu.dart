class Menu {

  int id; 
  int idRestaurante; 
  List<dynamic> menu;
  List<dynamic> fechas;

  Menu({
    this.id,
    this.idRestaurante,
    this.menu
  });

  Menu.fromJSONMap(Map<String, dynamic> json) {
    id = json['id_menu'];
    idRestaurante = json['id_restaurante'];
    menu = json['menu_dia'];
  }

}