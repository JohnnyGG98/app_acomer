class Menu {

  int id; 
  int idRestaurante; 
  Map<String, dynamic> menu; 

  Menu({
    this.id,
    this.idRestaurante,
    this.menu
  });

  Menu.fromJSONMap(Map<String, dynamic> json) {
    id = json['id_menu'];
    idRestaurante = json['id_restaurante'];
    menu = json['menu'];
  }

}