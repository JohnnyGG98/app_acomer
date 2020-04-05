# AComer App

Aplicación móvil para reservas en restaurantes que tengan categoria tenedor uno. 

### Creando un modelo 

- Se debe poner el nombre del objeto en singular. 
- Se debe crear dentro de la carpeta models. 
- Antes de crear el modelo, se debe crear una carpeta con el nombre del modelo. 
- Los nombres de los atributos deben estar en camelcase asi ```idUsuario``` no asi ```id_usuario```. 
- Todos los modelos deben tener un constructor que se llame ```Modelo.fromJSONMap(Map<String, Dynamic> json)```. 

**Ejemplo:**

```dart
class Cliente {

  int id; 
  int idUsuario;
  String nombre;
  String apellido; 
  String identificacion;
  String telefono;
  int numCompras; 
  DateTime ultimaCompra; 
  double totalConsumos;

  Cliente({
    this.id,
    this.idUsuario,
    this.nombre,
    this.apellido,
    this.identificacion,
    this.telefono,
    this.numCompras,
    this.ultimaCompra,
    this.totalConsumos
  });

  Cliente.fromJSONMap(Map<String, dynamic> json) {
    id = json['id'];
    idUsuario = json['id_usuario'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    identificacion = json['identificacion'];
    telefono = json['telefono'];
    numCompras = json['num_compras'];
    ultimaCompra = json['ultimaCompra']; 
    totalConsumos = json['totalConsumos'];
  }

}
```