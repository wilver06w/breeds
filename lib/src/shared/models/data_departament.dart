class DataDepartament {
  String message;
  List<Datum> data;

  DataDepartament({
    required this.message,
    required this.data,
  });

  factory DataDepartament.fromJson(Map<String, dynamic> json) =>
      DataDepartament(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String nombre;

  Datum({
    required this.id,
    required this.nombre,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
