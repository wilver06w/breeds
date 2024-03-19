import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:breeds/src/shared/models/country/documents.dart';
import 'package:breeds/src/shared/models/country/lat_long.dart';
import 'package:breeds/src/shared/models/country/loca_le.dart';
import 'package:breeds/src/core/utils/helpers/price_formatter/utils/price_formatter_settings.dart';

class Country extends Equatable {
  const Country({
    this.code,
    this.name,
    this.currency,
    this.currencyName,
    this.currencyNameText,
    this.logo,
    this.api,
    this.digits,
    this.prefix,
    this.locale,
    this.currencyDecimal,
    this.productIva,
    this.b2b,
    this.b2c,
    this.clientDocuments,
    this.mapsKey,
    this.centerPoint,
    this.enabled = true,
    this.priceSettings,
  });
  final String? code;
  final String? name;
  final String? currency;
  final String? currencyName;
  final String? currencyNameText;
  final String? logo;
  final String? api;
  final int? digits;
  final String? prefix;
  final Locale? locale;
  final int? currencyDecimal;
  final bool? productIva;
  final bool? b2b;
  final bool? b2c;
  final bool enabled;
  final List<DocumentType>? clientDocuments;
  final String? mapsKey;
  final LatLong? centerPoint;
  final PriceFormatterSettings? priceSettings;

  Country copyWith({
    String? code,
    String? name,
    String? currency,
    String? currencyName,
    String? currencyNameText,
    String? logo,
    String? api,
    String? uri,
    String? page,
    int? digits,
    String? prefix,
    String? imageUrl,
    Locale? locale,
    int? currencyDecimal,
    bool? productIva,
    bool? b2b,
    bool? b2c,
    List<DocumentType>? clientDocuments,
    String? mapsKey,
    LatLong? centerPoint,
    PriceFormatterSettings? priceSettings,
  }) {
    return Country(
      code: code ?? this.code,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      currencyName: currencyName ?? this.currencyName,
      currencyNameText: currencyNameText ?? this.currencyNameText,
      logo: logo ?? this.logo,
      api: api ?? this.api,
      digits: digits ?? this.digits,
      prefix: prefix ?? this.prefix,
      locale: locale ?? this.locale,
      currencyDecimal: currencyDecimal ?? this.currencyDecimal,
      productIva: productIva ?? this.productIva,
      b2b: b2b ?? this.b2b,
      b2c: b2c ?? this.b2c,
      clientDocuments: clientDocuments ?? this.clientDocuments,
      mapsKey: mapsKey ?? this.mapsKey,
      centerPoint: centerPoint ?? this.centerPoint,
      priceSettings: priceSettings ?? this.priceSettings,
    );
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'] as String?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      currencyName: json['currency_name'] as String?,
      currencyNameText: json['currency_name_text'] as String?,
      logo: json['logo'] as String?,
      api: json['api'] as String?,
      digits: json['digits'] as int?,
      prefix: json['prefix'] as String?,
      locale: json['locale'] == null
          ? null
          : Locale.fromJson(json['locale'] as Map<String, dynamic>),
      currencyDecimal: json['currency_decimal'] as int?,
      productIva: json['product_iva'] as bool?,
      b2b: json['b2b'] as bool?,
      b2c: json['b2c'] as bool?,
      clientDocuments: (json['client_documents'] as List)
          .map((e) => DocumentType.fromJson(e ?? {}))
          .toList(),
      mapsKey: json['maps_key'] as String?,
      centerPoint: json['center_point'] == null
          ? null
          : LatLong.fromJson(json['center_point'] as Map<String, dynamic>),
      priceSettings: json['price_settings'] == null
          ? null
          : PriceFormatterSettings.fromJson(
              json['price_settings'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'currency': currency,
      'currency_name': currencyName,
      'currency_name_text': currencyNameText,
      'logo': logo,
      'api': api,
      'digits': digits,
      'prefix': prefix,
      'locale': locale?.toJson() ?? {},
      'currency_decimal': currencyDecimal,
      'product_iva': productIva,
      'b2b': b2b,
      'b2c': b2c,
      'client_documents': clientDocuments
              ?.map(
                (c) => null,
              )
              .toList() ??
          [],
      'mapsKey': mapsKey,
      'center_point': centerPoint?.toJson() ?? {},
    };
  }

  @override
  bool operator ==(other) {
    return code == (other as dynamic).code &&
        api == (other as dynamic).api &&
        prefix == (other as dynamic).prefix;
  }

  @override
  int get hashCode => digits! + Random().nextInt(1000000);

  @override
  List<Object?> get props {
    return [
      code,
      name,
      currency,
      currencyName,
      currencyNameText,
      logo,
      api,
      digits,
      prefix,
      locale,
      currencyDecimal,
      productIva,
      b2b,
      b2c,
      clientDocuments,
      mapsKey,
      centerPoint,
      enabled,
      priceSettings,
    ];
  }
}
