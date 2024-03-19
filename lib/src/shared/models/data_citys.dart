class DataCitys {
  String message;
  List<City> data;

  DataCitys({
    required this.message,
    required this.data,
  });

  factory DataCitys.fromJson(Map<String, dynamic> json) => DataCitys(
        message: json["message"],
        data: List<City>.from(json["data"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class City {
  int id;
  String nombre;
  int departamentoId;

  City({
    required this.id,
    required this.nombre,
    required this.departamentoId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        nombre: json["nombre"],
        departamentoId: json["departamento_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "departamento_id": departamentoId,
      };
}
