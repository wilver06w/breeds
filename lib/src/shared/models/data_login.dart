import 'package:breeds/src/shared/models/clien.dart';

class DataLogin {
  String message;
  Data data;

  DataLogin({
    this.message = '',
    required this.data,
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Clien userData;
  String accessToken;

  Data({
    required this.userData,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userData: Clien.fromJson(json["userData"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "userData": userData.toJson(),
        "accessToken": accessToken,
      };
}
