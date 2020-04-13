class Favorito{

  int id;
  int idPlato;
  int idCliente;

  Favorito([
    this.id,
    this.idPlato,
    this.idCliente
  ]);

  Favorito.fromJSONMap(Map <String, dynamic> json){
    id = json['id'];
    idPlato = json['id_plato'];
    idCliente = json['id_cliente'];
  }
}