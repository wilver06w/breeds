class Clien {
  int id;
  dynamic dni;
  String nombre;
  String apellido;
  String correo;
  dynamic telefono;
  int puntosRedimibles;
  int puntosPendientes;
  List<dynamic>? direccion;
  List<dynamic>? tarjetas;
  String ultimoMetodoPago;

  Clien({
    this.id = 0,
    this.dni = '',
    this.nombre = '',
    this.apellido = '',
    this.correo = '',
    this.telefono,
    this.puntosRedimibles = 0,
    this.puntosPendientes = 0,
    this.direccion = const [],
    this.tarjetas = const [],
    this.ultimoMetodoPago = '',
  });

  factory Clien.fromJson(Map<String, dynamic> json) => Clien(
        id: json["id"] ?? 0,
        dni: json["dni"] ?? '',
        nombre: json["nombre"] ?? '',
        apellido: json["apellido"] ?? '',
        correo: json["correo"] ?? '',
        telefono: json["telefono"] ?? '',
        puntosRedimibles: json["puntos_redimibles"] ?? 0,
        puntosPendientes: json["puntos_pendientes"] ?? 0,
        direccion: json["direccion"] != null
            ? List<dynamic>.from(json["direccion"].map((x) => x))
            : null,
        tarjetas: json["tarjetas"] != null
            ? List<dynamic>.from(json["tarjetas"].map((x) => x))
            : null,
        ultimoMetodoPago: json["ultimo_metodo_pago"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "telefono": telefono,
        "puntos_redimibles": puntosRedimibles,
        "puntos_pendientes": puntosPendientes,
        "direccion": List<dynamic>.from(direccion!.map((x) => x)),
        "tarjetas": List<dynamic>.from(tarjetas!.map((x) => x)),
        "ultimo_metodo_pago": ultimoMetodoPago,
      };
}
