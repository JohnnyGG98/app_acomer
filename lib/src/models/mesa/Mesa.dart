class Restaurante{

int id;
int numero;
int capacidad;
String descripcion;


Restaurante({
this.id,
this.numero,
this.capacidad,
this.descripcion

});

Restaurante.fromJSONMap(Map<String,dynamic> json){
  id = json['id'];
  numero = json['numero'];
  capacidad = json['capacidad'];
  descripcion = json['descripcion'];
  
}


}