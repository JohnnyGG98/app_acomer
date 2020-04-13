class Usuario{

  int id;
  String nombre;
  String clave;
  String correo;
  int tipoUsuario;
  DateTime ultimoLogin;
  DateTime ultimoCambioClave;
  int intentosLogin;
  int numeroLogins;

  Usuario([
    this.id,
    this.nombre,
    this.clave,
    this.correo,
    this.tipoUsuario,
    this.ultimoLogin,
    this.ultimoCambioClave,
    this.intentosLogin,
    this.numeroLogins
  ]);

  Usuario.fromJSONMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    clave = json['clave'];
    correo = json['correo'];
    tipoUsuario = json['tipo_usuario'];
    ultimoLogin = json['ultimo_login'];
    ultimoCambioClave = json['ultimo_cambio_clave'];
    intentosLogin = json['intentos_login'];
    numeroLogins = json['numero_logins'];
  }
}