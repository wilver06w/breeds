import 'package:equatable/equatable.dart';

class DocumentType extends Equatable {
  final String? value;
  final String? text;
  final String? keyValue;

  const DocumentType({
    this.value,
    this.text,
    this.keyValue,
  });

  DocumentType copyWith({
    String? value,
    String? text,
    String? keyValue,
  }) =>
      DocumentType(
        value: value ?? this.value,
        text: text ?? this.text,
        keyValue: keyValue ?? this.keyValue,
      );

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
        value: json['value'] as String?,
        text: json['text'] as String?,
        keyValue: json['key_value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'text': text,
        'key_value': keyValue,
      };

  @override
  List<Object?> get props => [
        value,
        text,
        keyValue,
      ];
}
