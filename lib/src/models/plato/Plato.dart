class Plato{

  int id;
  int idRestaurante;
  String nombre;
  double precio;
  List <dynamic> ingredientes;
  List <IngredienteEstado> estadoIngredientes = new List();
  String urlImagen;
  String nombreRestaurante;
  int puntuacion = 0;

  Plato([
    this.id,
    this.idRestaurante,
    this.nombre,
    this.precio,
    this.ingredientes,
    this.urlImagen,
    this.nombreRestaurante
  ]);

  Plato.fromJSONMap(Map <String, dynamic> json){
    id = json['id_plato'] ?? 15;
    idRestaurante = json['id_restaurante'];
    nombre = json['nombre'];
    precio = double.parse(json['precio'] ?? "0");
    ingredientes = json['ingredientes'];
    urlImagen = json['url_imagen'] ?? 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
    nombreRestaurante = json['restaurante'] != null ? 
      json['restaurante']['nombre_comercial'] : 'Rest';

    if (ingredientes != null) {
      ingredientes.forEach((i) {
        estadoIngredientes.add(new IngredienteEstado(
          agregado: true,
          ingrediente: i.toString()
        ));
      });
    }
  }

}

class IngredienteEstado {

  bool agregado;
  String ingrediente;

  IngredienteEstado({
    this.agregado,
    this.ingrediente
  });

  get ingredienteFixed {
    return ingrediente.toString().length > 35 ? 
      '${ingrediente.toString().substring(0, 30)}...' :
      ingrediente.toString();
  }

}