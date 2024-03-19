import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int? id;
  final String? identification;
  final String? phone;
  final String? image;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? lastLogin;
  final String? status;
  final String? type;
  final String? firebaseToken;
  final int? city;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final Detail? detail;

  String? get fullName => firstName != null && lastName != null
      ? '$firstName $lastName'
      : firstName;

  const Client({
    this.id,
    this.identification,
    this.phone,
    this.image,
    this.firstName,
    this.lastName,
    this.email,
    this.lastLogin,
    this.status,
    this.type,
    this.firebaseToken,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.detail,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'] as int?,
        identification: json['identification'] as String?,
        phone: json['phone'],
        image: json['image'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        lastLogin: json['last_login'],
        status: json['status'],
        type: json['type'],
        firebaseToken: json['firebase_token'],
        city: json['city'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        deletedAt: json['deleted_at'],
        detail: Detail.fromJson(json['detail']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'identification': identification,
        'phone': phone,
        'image': image,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'last_login': lastLogin,
        'status': status,
        'type': type,
        'firebase_token': firebaseToken,
        'city': city,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'detail': detail?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        identification,
        phone,
        image,
        firstName,
        lastName,
        email,
        lastLogin,
        status,
        type,
        firebaseToken,
        city,
        createdAt,
        updatedAt,
        deletedAt,
        detail,
      ];
}

class Detail {
  final int? id;
  final int? userId;
  final String? score;
  final dynamic latitude;
  final dynamic longitude;
  final DateTime? updatedAt;
  final String serviceType;

  Detail({
    this.id,
    this.userId,
    this.score,
    this.latitude,
    this.longitude,
    this.serviceType = '',
    required this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        score: json['score'] as String?,
        latitude: json['latitude'],
        longitude: json['longitude'],
        serviceType: json['service_type'] ?? '',
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'score': score,
        'latitude': latitude,
        'service_type': serviceType,
        'longitude': longitude,
        'updated_at': updatedAt?.toIso8601String(),
      };
}
