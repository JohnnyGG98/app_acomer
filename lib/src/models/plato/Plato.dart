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
    precio = json['precio'];
    ingredientes = json['ingredientes'];
    urlImagen = json['url_imagen'];
  }
}