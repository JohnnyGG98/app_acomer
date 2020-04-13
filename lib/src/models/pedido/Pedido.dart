class Restaurante{

int id;
int idEmpleado;
int idMesa;
Map<String, dynamic> platos;
String notas;

Restaurante({
this.id,
this.idEmpleado,
this.idMesa,
this.platos,
this.notas
});

Restaurante.fromJSONMap(Map<String,dynamic> json){
  id = json['id'];
  idEmpleado = json['id_empleado'];
  idMesa = json['id_mesa'];
  platos = json['platos'];
  notas = json['notas'];
 
}


}