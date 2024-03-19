import 'package:equatable/equatable.dart';

class Locale extends Equatable {
  final String? languageCode;
  final String? countryCode;

  const Locale({
    this.languageCode,
    this.countryCode,
  });

  Locale copyWith({
    String? languageCode,
    String? countryCode,
  }) =>
      Locale(
        languageCode: languageCode ?? this.languageCode,
        countryCode: countryCode ?? this.countryCode,
      );

  factory Locale.fromJson(Map<String, dynamic> json) => Locale(
        languageCode: json['languageCode'] as String?,
        countryCode: json['countryCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'languageCode': languageCode,
        'countryCode': countryCode,
      };

  @override
  List<Object?> get props => [
        languageCode,
        countryCode,
      ];
}
