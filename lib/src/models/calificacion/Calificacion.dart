class Restaurante{

int id;
int idFk;
int idCliente;
int calificacion;
int tipoCalificacion;


Restaurante({
this.id,
this.idFk,
this.idCliente,
this.calificacion,
this.tipoCalificacion

});

Restaurante.fromJSONMap(Map<String,dynamic> json){
  id = json['id'];
  idFk = json['id_fk'];
  idCliente = json['id_cliente'];
  calificacion = json['calificacion'];
  tipoCalificacion = json['tipo_calificacion'];
  
}


}