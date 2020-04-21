class Plato{

  int id;
  int idRestaurante;
  String nombre;
  double precio;
  Map <String, dynamic> ingredientes;
  String urlImagen;

  Plato([
    this.id,
    this.idRestaurante,
    this.nombre,
    this.precio,
    this.ingredientes,
    this.urlImagen
  ]);

  Plato.fromJSONMap(Map <String, dynamic> json){
    id = json['id'] ?? 0;
    idRestaurante = json['id_restaurante'];
    nombre = json['nombre'];
    precio = double.parse(json['precio']);
    ingredientes = json['ingredientes'];
    urlImagen = json['url_imagen'] ?? 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  }

}