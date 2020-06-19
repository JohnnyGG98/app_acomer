class Categoria {
  int id;
  String nombre;
  int numeroPlatos;

  Categoria({this.id, this.nombre, this.numeroPlatos});

  Categoria.fromJSONMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    numeroPlatos = json['numero_platos'];
  }
}
