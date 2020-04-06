class Restaurante{

int id;
String nombre;
String numeroPlatos;

Restaurante({
this.id,
this.nombre,
this.numeroPlatos
});

Restaurante.fromJSONMap(Map<String,dynamic> json){
  id = json['id'];
  nombre = json['nombre'];
  numeroPlatos = json['numero_platos'];
 
}


}