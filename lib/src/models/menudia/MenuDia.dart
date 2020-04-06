class Restaurante{

int id;
Map<String,dynamic> menuDia;
DateTime fechaInicio;
DateTime fechaFin;


Restaurante({
this.id,
this.menuDia,
this.fechaInicio,
this.fechaFin

});

Restaurante.fromJSONMap(Map<String,dynamic> json){
  id = json['id'];
  menuDia = json['menu_dia'];
  fechaInicio = json['fecha_inicio'];
  fechaFin = json['fecha_fin'];
}


}