class DataBanner {
  String message;
  Data data;

  DataBanner({
    required this.message,
    required this.data,
  });

  factory DataBanner.fromJson(Map<String, dynamic> json) => DataBanner(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<String> mobile;
  int appVersion;

  Data({
    required this.mobile,
    required this.appVersion,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mobile: List<String>.from(json["mobile"].map((x) => x)),
        appVersion: json["app_version"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": List<dynamic>.from(mobile.map((x) => x)),
        "app_version": appVersion,
      };
}
