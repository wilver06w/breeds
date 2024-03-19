class LatLong {
  final double? latitude;
  final double? longitude;

  LatLong({
    this.latitude,
    this.longitude,
  });

  LatLong copyWith({
    double? latitude,
    double? longitude,
  }) =>
      LatLong(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory LatLong.fromJson(Map<String, dynamic> json) => LatLong(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
