class DataCategoria {
  String message;
  List<Datum> data;

  DataCategoria({
    required this.message,
    required this.data,
  });

  factory DataCategoria.fromJson(Map<String, dynamic> json) => DataCategoria(
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
  String slug;

  Datum({
    required this.id,
    required this.nombre,
    required this.slug,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nombre: json["nombre"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "slug": slug,
      };
}
