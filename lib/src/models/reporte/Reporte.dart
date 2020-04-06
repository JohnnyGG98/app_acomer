class Restaurante{

int id;
Map<String,dynamic> reporte;
DateTime fecha;
String nombre;


Restaurante({
this.id,
this.reporte,
this.fecha,
this.nombre

});

Restaurante.fromJSONMap(Map<String,dynamic> json){
  id = json['id'];
  reporte = json['reporte'];
  fecha = json['fecha'];
  nombre = json['nombre'];
}


}